import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class ProductService extends ChangeNotifier {
  final String _baseUrl = "flutter-varios-b2090-default-rtdb.europe-west1.firebasedatabase.app";
  final List<Product> products = [];
  late Product selectedProduct;

  final storage = new FlutterSecureStorage();

  File? newPictureFile;
  
  bool isLoading = true;
  bool isSaving = false;

  ProductService() {
    this.loadProducts();
  }

  Future<List<Product>> loadProducts() async {

    this.isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, "products.json", {
      'auth': await storage.read(key: 'token') ?? ''
    });
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode(resp.body);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap(value);
      tempProduct.id = key;
      this.products.add(tempProduct);
    });

    this.isLoading = false;
    notifyListeners();

    return this.products;

  }

  Future saveOrCreateProduuct(Product product) async {

    isSaving = true;
    notifyListeners();

    if (product.id == null) {
      // Crear
      await this.createProduct(product);
    } else {
      // Actualizar
      await this.updateProduct(product);
    }

    isSaving = false;
    notifyListeners();

  }

  Future<String> updateProduct(Product product) async {

    final url = Uri.https(_baseUrl, "products/${product.id}.json", {
      'auth': await storage.read(key: 'token') ?? ''
    });

    final resp = await http.put(url, body: product.toJson());
    final decodedData = resp.body;

    final index = this.products.indexWhere((element) => element.id == product.id);
    this.products[index] = product;

    return product.id!;

  }

  Future<String> createProduct(Product product) async {

    final url = Uri.https(_baseUrl, "products.json", {
      'auth': await storage.read(key: 'token') ?? ''
    });
    
    final resp = await http.post(url, body: product.toJson());
    final decodedData = json.decode(resp.body);

    product.id = decodedData['name'];
    this.products.add(product);

    return product.id!;

  }

  void updateSelectedProductImage(String path) {
    this.selectedProduct.picture = path;
    this.newPictureFile = File.fromUri(Uri(path: path));

    notifyListeners();
  }

  Future<String?> uploadImage() async {

    if (this.newPictureFile == null) return null;

    this.isSaving = true;
    notifyListeners();

    final url = Uri.parse("https://api.cloudinary.com/v1_1/dphrapiyu/image/upload?upload_preset=cursoflutter");

    final imageUploadRequest = http.MultipartRequest("POST", url);

    final file = await http.MultipartFile.fromPath("file", newPictureFile!.path);

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      print("Algo salio mal");
      print(resp.body);
      return null;
    }

    this.newPictureFile = null;

    final decodedData = json.decode(resp.body);
    return decodedData['secure_url'];

  }

}
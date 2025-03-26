import 'package:flutter/material.dart';
import 'package:formulario/models/product.dart';
import 'package:formulario/providers/providers.dart';
import 'package:formulario/screens/screens.dart';
import 'package:formulario/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    final productsService = Provider.of<ProductService>(context);
    final authService = Provider.of<AuthProvider>(context, listen: false);

    if(productsService.isLoading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        title: Text("Productos", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.login_outlined, color: Colors.white),
          onPressed: () {
            authService.logout();
            Navigator.pushReplacementNamed(context, 'login');
          },
        )
      ),
      body: ListView.builder(
        itemCount: productsService.products.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            productsService.selectedProduct = productsService.products[index].copy();
            Navigator.pushNamed(context, "details");
          },
          child: ProductCard(product: productsService.products[index])
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          productsService.selectedProduct = new Product(available: true, name: "", price: 0);
          Navigator.pushNamed(context, "details");
        }
      )
    );
  }
}
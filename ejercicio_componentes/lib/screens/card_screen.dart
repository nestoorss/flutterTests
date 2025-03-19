import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Tarjetas"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 10),
          CustomCardType2(imageUrl: 'https://quatresoft.com/wp-content/uploads/2014/04/windows_xp_bliss-wide.jpg', name: "Un hermoso paisaje"),
          SizedBox(height: 20),
          CustomCardType2(imageUrl: 'https://i.imgflip.com/17s6gn.jpg?a483600',),
          SizedBox(height: 20),
          CustomCardType2(imageUrl: 'https://wparena.com/wp-content/uploads/2009/09/img0.jpg', name: "Windows 7"),
        ],
      )
    );
  }
}
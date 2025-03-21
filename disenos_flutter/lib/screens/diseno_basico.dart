import 'package:flutter/material.dart';

class DisenoBasico extends StatelessWidget {
     
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Imagen central
          Image(image: AssetImage("assets/landscape.jpg")),

          // Titulo
          Title(),

          // Button Section
          ButtonSection(),

          // Descripcion
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Lorem ictus ajfioadsjfioeasjfriuoewjhrfuioeashjfuieawhjfuieahfuieoasdfheujksafhnesdjikvndsjkfvnsejdoifvnsdruifhsenuijfbhnesjkfnvsedrjlkfghrsemlfuvjwskerm,fcijkesm,jcucfiwej,mrutcfv,mh.wjeujtfmhwe,jcitehwnrmsgjvnnwrcmchgwjgngjvwhmcnjwenghfwefnmfgiujhsi")
          )

        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Oeschinen Lacke Campground (false)", style: TextStyle(fontWeight: FontWeight.bold),),
              Text("Kandersteg, Switzerland", style: TextStyle(color: Colors.black)),
            ],
          ),

          Expanded(child: Container()),

          Icon(Icons.star, color: Colors.red),
          Text("41"),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomButton(icon: Icons.call, text: "Call"),
          CustomButton(icon: Icons.route, text: "Route"),
          CustomButton(icon: Icons.share, text: "Share"),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final String text;
  
  const CustomButton({
    super.key, required this.icon, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.blue),
        Text(text, style: TextStyle(color: Colors.blue)),
      ],
    );
  }
}
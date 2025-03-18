import 'package:flutter/material.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({Key? key}): super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Column(
        children: const [
          FadeInImage(
            // TODO: cambios del video 81
            image: NetworkImage("https://quatresoft.com/wp-content/uploads/2014/04/windows_xp_bliss-wide.jpg"), 
            placeholder: AssetImage('assets/aaaaaaaaaa.jpg'),
          )
        ],
      )
    );
  }
  
}
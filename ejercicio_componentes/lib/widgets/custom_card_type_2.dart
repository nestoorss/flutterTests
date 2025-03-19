import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomCardType2 extends StatelessWidget {
  const CustomCardType2({super.key, required this.imageUrl, this.name});
  
  final String imageUrl;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      // ignore: deprecated_member_use
      shadowColor: AppTheme.primary.withOpacity(0.5),
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(imageUrl), 
            placeholder: const AssetImage('assets/aaaaaaaaaa.jpg'),
            width: double.infinity,
            height: 260,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
          ),

          if (name != null)
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
              child: Text(name!)  
            )
        ],
      )
    );
  }
  
}
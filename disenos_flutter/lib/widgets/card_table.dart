import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            _Singlecard(color: Colors.blue, icon: Icons.border_all, text: "General"),
            _Singlecard(color: Colors.pinkAccent, icon: Icons.car_rental, text: "Transport"),
          ]
        ),
        TableRow(
          children: [
            _Singlecard(color: Colors.purple, icon: Icons.shop, text: "Shopping"),
            _Singlecard(color: Colors.purpleAccent, icon: Icons.cloud, text: "Bill"),
          ]
        ),
        TableRow(
          children: [
            _Singlecard(color: Colors.deepPurple, icon: Icons.movie, text: "Entertainment"),
            _Singlecard(color: Colors.green, icon: Icons.food_bank, text: "Grocery"),
          ]
        ),
      ]
    );
  }
}

class _Singlecard extends StatelessWidget {

  final IconData icon;
  final Color color;
  final String text;

  const _Singlecard({required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return _CardBackground(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(icon, size: 35, color: Color.fromRGBO(255, 255, 255, 0.698)),
          ),
          SizedBox(height: 10),
          Text(text, style: TextStyle(color: color, fontSize: 18))
        ],
      )
    );
  }
}

class _CardBackground extends StatelessWidget {

  final Widget child;

  const _CardBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(20)
            ),
            child: child
          ),
        ),
      ),
    );
  }
}
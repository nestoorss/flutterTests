import 'package:custom_transition_route/pages/page2.dart';
import 'package:flutter/material.dart';
import 'package:next_transitions/next_transitions.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue,
      body: Center(
         child: MaterialButton(
          color: Colors.white,
          onPressed: () {
            NextTransitions(
              context: context,
              child: Page2(),
              animation: AnimationType.fadeIn
            );
          },
          child: Text("Go to page2"),
         )
      ),
    );
  }
}
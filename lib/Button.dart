import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;
  final Widget widget;
  final double radius;
  final bool clear;

  Button(
      {this.text = '',
      this.color = Colors.blue,
      this.onTap,
      this.widget = const Text(''),
      this.radius = 5.0,
      this.clear = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: clear ? null : 50.0,
      decoration: clear
          ? null
          : BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(radius),
              boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 30.0,
                      offset: Offset(0.0, 10.0))
                ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onTap,
            child: Center(
                child: Padding(
              padding: clear
                  ? EdgeInsets.symmetric(horizontal: 2.0)
                  : EdgeInsets.symmetric(horizontal: 8.0),
              child: text == ''
                  ? widget
                  : Text(text,
                      style: clear
                          ? TextStyle(
                              fontSize: 14.0,
                              height: 16.0 / 14.0,
                              color: Color(0xFF282C2E),
                              fontWeight: FontWeight.bold)
                          : TextStyle(
                              fontSize: 14.0,
                              height: 16.0 / 14.0,
                              color: Colors.white)),
            ))),
      ),
    );
  }
}

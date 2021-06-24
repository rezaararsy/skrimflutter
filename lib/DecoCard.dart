import 'package:flutter/material.dart';


class DecoCard extends StatelessWidget {
  final Widget child;
  final double padding;
  final VoidCallback onTap;

  DecoCard({
    this.child,
    this.padding = 16.0,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final cardPadding = EdgeInsets.all(padding);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 30.0,
              offset: Offset(0.0, 10.0)
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            color: Colors.transparent,
            padding: cardPadding,
            child: getChild(),
          )
        ),
      ),
    );
  }

  Widget getChild() {
    return child == null ? Container() : child;
  }
}
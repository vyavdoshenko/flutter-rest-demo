import 'package:flutter/material.dart';

BoxDecoration buildGradientBoxDecoration(BuildContext context) => BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(0.1, 0.6),
        colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColorDark
        ],
        tileMode: TileMode.clamp,
      ),
    );

class RoundedButton extends StatelessWidget {
  final onPressed;
  final color;
  final title;

  const RoundedButton({
    @required this.onPressed,
    @required this.color,
    @required this.title,
  });

  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(5.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 40.0,
          child: Text(
            title,
          ),
        ),
      ),
    );
  }
}

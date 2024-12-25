import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final double borderRadius;
  final double width;
  final double height;

  const GradientButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.gradientColors = const [Color(0xFFEABE66), Color(0xFFC3872E)],
    this.borderRadius = 8.0,
    this.width = 82.0,
    this.height = 32.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                fontSize: 12,
                height: 1.0,
                letterSpacing: 1.0, // Optional for spacing in uppercase letters
              ),
            ),
          ),
        ),
      ),
    );
  }
}

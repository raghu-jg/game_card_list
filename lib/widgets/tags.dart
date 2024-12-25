import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String tagText;

  const Tag({
    Key? key,
    required this.tagText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          104, // Define width for the parent container (important for Positioning)
      height: 30,
      child: Stack(
        // clipBehavior: Clip.none,
        children: [
          // Background bar
          // Positioned(
          //   left: 121,
          //   top: 70,
          //   child: Container(
          //     width: 100,
          //     height: 3,
          //     color: Color(0xFFE7C692),
          //   ),
          // ),
          // Left ellipse
          // Positioned(
          //   left: 118,
          //   top: 70,
          //   child: Container(
          //     width: 6,
          //     height: 3,
          //     decoration: BoxDecoration(
          //       color: Color(0xFFD0A35C),
          //       borderRadius: BorderRadius.circular(3),
          //     ),
          //   ),
          // ),
          // Right ellipse
          // Positioned(
          //   left: 218,
          //   top: 70,
          //   child: Container(
          //     width: 6,
          //     height: 3,
          //     decoration: BoxDecoration(
          //       color: Color(0xFFD0A35C),
          //       borderRadius: BorderRadius.circular(3),
          //     ),
          //   ),
          // ),
          // Gradient rectangle
          // Container(
          //   height: 30,
          //   width: 104,
          // ),
          Positioned(
            top: 0,
            child: Container(
              width: 94,
              height: 20,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFE7C692),
                    Color(0xFFCFA159),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                tagText,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  height: 1.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

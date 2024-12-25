import 'package:flutter/material.dart';

class SortByEntryFeeWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final bool sortAscending;

  const SortByEntryFeeWidget({
    Key? key,
    required this.onTap,
    required this.sortAscending,
    this.label = "Low to High",
    this.backgroundColor = Colors.white,
    this.borderColor = const Color(0xFFBDBDBD),
    this.borderWidth = 1.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("SortByEntryFeeWidget tapped");
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Row(
          children: [
            Image.asset(
              'assets/union.png',
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 2),
            Text(
              sortAscending ? label : "High to Low",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

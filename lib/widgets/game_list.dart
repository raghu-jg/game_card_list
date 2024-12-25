import 'package:dynamic_list_app/widgets/button.dart';
import 'package:dynamic_list_app/widgets/tags.dart';
import 'package:flutter/material.dart';

enum GameOptionType { practice, pointValue }

class GameOptionTile extends StatelessWidget {
  final GameOptionType type;
  final String title;
  final String entryFee;
  final String playerCount;
  final bool isRecommended;
  final String buttonText;
  final VoidCallback onButtonPressed;
  final List<Color> cardGradientColors; //  card background
  final List<Color> overlayGradientColors; //  overlay border
  final double borderRadius;
  final List<Color> buttonGradientColors;
  final String tagLabel;
  final Color borderColor;

  const GameOptionTile({
    Key? key,
    required this.type,
    required this.title,
    required this.entryFee,
    required this.playerCount,
    required this.buttonText,
    required this.onButtonPressed,
    this.isRecommended = false,
    required this.cardGradientColors,
    required this.overlayGradientColors,
    required this.borderColor,
    this.borderRadius = 12.0,
    required this.buttonGradientColors,
    this.tagLabel = 'Recommended',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Outer container for gradient overlay (Border effect)
          Container(
            decoration: BoxDecoration(
              gradient: isRecommended
                  ? LinearGradient(
                      colors: overlayGradientColors,
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    )
                  : null,
              border: isRecommended ? null : Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Container(
              // Inner container for card content
              margin: isRecommended
                  ? EdgeInsets.only(top: 1, left: 1, right: 1)
                  : EdgeInsets.all(0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: cardGradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(borderRadius - 2),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Row(
                children: [
                  // Section 1: Entry Fee/Practice
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTitle(),
                        const SizedBox(height: 4),
                        Text(
                          entryFee == '0' ? 'Entry: Free' : 'Entry: ₹$entryFee',
                          textAlign: TextAlign.start,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),

                  // Section 2: Number of Players
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        '$playerCount Players',
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  // Section 3: Button
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: GradientButton(
                          text: buttonText,
                          onPressed: onButtonPressed,
                          gradientColors: buttonGradientColors,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Tag for Recommended
          if (isRecommended)
            Positioned(
              top: 0,
              left: 0,
              child: Tag(tagText: tagLabel),
            ),
        ],
      ),
    );
  }

  /// Builds the title widget based on GameOptionType
  Widget _buildTitle() {
    switch (type) {
      case GameOptionType.practice:
        return Row(
          children: [
            Image.asset(
              'assets/image.png',
              width: 16,
              height: 16,
            ),
            const SizedBox(
                width: 4), // Add some spacing between the icon and the text
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        );
      case GameOptionType.pointValue:
        return FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              text: '₹ $title ',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: 'Pt. Value',
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }
}

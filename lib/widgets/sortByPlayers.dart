import 'package:flutter/material.dart';

enum PlayerCount {
  twoPlayers("2P"),
  sixPlayers("6P");
  // threePlayers("3P");

  final String label;
  const PlayerCount(this.label);
}

class FilterByPlayerCountWidget extends StatefulWidget {
  final List<PlayerCount> playerCounts;
  final Function(String) onFilterByPlayers;
  final String selectedPlayerFilter;
  final Color selectedBackgroundColor;
  final Color selectedBorderColor;
  final double selectedBorderWidth;

  const FilterByPlayerCountWidget({
    Key? key,
    required this.playerCounts,
    required this.onFilterByPlayers,
    required this.selectedPlayerFilter,
    this.selectedBackgroundColor = const Color(0xFFFFF0D4),
    this.selectedBorderColor = const Color(0xFFE7C691),
    this.selectedBorderWidth = 1.0,
  }) : super(key: key);

  @override
  State<FilterByPlayerCountWidget> createState() =>
      _FilterByPlayerCountWidgetState();
}

class _FilterByPlayerCountWidgetState extends State<FilterByPlayerCountWidget> {
  double _indicatorPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _updateIndicatorPosition();
  }

  @override
  void didUpdateWidget(covariant FilterByPlayerCountWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateIndicatorPosition();
  }

  void _updateIndicatorPosition() {
    final index = widget.playerCounts
        .indexWhere((player) => player.label == widget.selectedPlayerFilter);
    setState(() {
      _indicatorPosition = index.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // Animated Indicator
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            left: _indicatorPosition * 60, // Adjust spacing accordingly
            child: Container(
              width: 60,
              height: 30,
              decoration: BoxDecoration(
                color: widget.selectedBackgroundColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: widget.selectedBorderColor,
                  width: widget.selectedBorderWidth,
                ),
              ),
            ),
          ),

          // Player Count Buttons
          Row(
            mainAxisSize: MainAxisSize.min,
            children: widget.playerCounts.asMap().entries.map((entry) {
              final playerCount = entry.value;
              return GestureDetector(
                onTap: () => widget.onFilterByPlayers(playerCount.label),
                child: SizedBox(
                  width: 60,
                  height: 30,
                  child: Center(
                    child: Text(
                      playerCount.label,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: widget.selectedPlayerFilter == playerCount.label
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

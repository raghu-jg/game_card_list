import 'package:dynamic_list_app/widgets/sortByEntryFee.dart';
import 'package:dynamic_list_app/widgets/sortByPlayers.dart';
import 'package:flutter/material.dart';

class FilterStripRow extends StatelessWidget {
  final VoidCallback onSortByEntryFee;
  final VoidCallback onGameRulesTap;
  final Function(String) onFilterByPlayers;
  final String selectedPlayerFilter;
  final bool sortAscending;

  const FilterStripRow({
    Key? key,
    required this.onSortByEntryFee,
    required this.onGameRulesTap,
    required this.onFilterByPlayers,
    required this.selectedPlayerFilter,
    required this.sortAscending,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8F4F0),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Sort by Entry Fee
          SortByEntryFeeWidget(
            onTap: onSortByEntryFee,
            sortAscending: sortAscending,
          ),

          // Filter by Player Count
          Container(
            margin: const EdgeInsets.only(right: 30),
            child: FilterByPlayerCountWidget(
              playerCounts: PlayerCount.values,
              onFilterByPlayers: onFilterByPlayers,
              selectedPlayerFilter: selectedPlayerFilter,
            ),
          ),

          // Game Rules
          GestureDetector(
            onTap: onGameRulesTap,
            child: Row(
              children: [
                Image.asset(
                  'assets/poker-cards 1.png',
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 2),
                const Text(
                  "Game Rules",
                  style: TextStyle(
                    color: Color(0xFFC3872E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

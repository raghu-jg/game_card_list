import 'package:dynamic_list_app/constant/config.dart';
import 'package:dynamic_list_app/widgets/filter_strip_row.dart';
import 'package:dynamic_list_app/widgets/game_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:
            const Color(0xFFF8F4F0), // Set default background color
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF8F4F0), // Set AppBar background color
          elevation: 0, // Remove AppBar shadow
        ),
      ),
      home: const GameOptionsScreen(),
    );
  }
}

class GameOptionsScreen extends StatefulWidget {
  const GameOptionsScreen({Key? key}) : super(key: key);

  @override
  State<GameOptionsScreen> createState() => _GameOptionsScreenState();
}

class _GameOptionsScreenState extends State<GameOptionsScreen> {
  List<Map<String, dynamic>> gameOptionsList = List.from(gameOptions);
  bool sortAscending = true;
  String selectedPlayerFilter = "2P";

  void onGameRulesTap() {
    print("Game Rules");
  }

  void sortByEntryFee() {
    setState(() {
      gameOptionsList.sort((a, b) {
        int feeA = a['entryFee'] ?? 0;
        int feeB = b['entryFee'] ?? 0;
        return sortAscending ? feeA.compareTo(feeB) : feeB.compareTo(feeA);
      });
      sortAscending = !sortAscending;
    });
  }

  void filterByPlayers(String playerType) {
    setState(() {
      selectedPlayerFilter = playerType;

      // Determine the filter count based on the selected player type
      String filterCount;
      if (playerType == "2P") {
        filterCount = '2';
      } else if (playerType == "6P") {
        filterCount = '6';
      } else if (playerType == "3P") {
        // Add logic for 3P
        filterCount = '3';
      } else {
        filterCount = ''; // Default case, though it shouldn't happen
      }

      // Filter the game options list based on player count
      gameOptionsList = gameOptions.where((option) {
        return option['playerCount'] == filterCount;
      }).toList();

      print("Filtered List: $gameOptionsList");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F4F0),
        title: const Text('Game Options'),
      ),
      body: Column(
        children: [
          FilterStripRow(
            onSortByEntryFee: sortByEntryFee,
            onGameRulesTap: onGameRulesTap,
            onFilterByPlayers: filterByPlayers,
            selectedPlayerFilter: selectedPlayerFilter,
            sortAscending: sortAscending,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: gameOptionsList.length,
              itemBuilder: (context, index) {
                final option = gameOptionsList[index];
                return GameOptionTile(
                  type: option['type'],
                  title: option['title'],
                  entryFee: option['entryFee'].toString(),
                  playerCount: option['playerCount'],
                  buttonText: option['buttonText'],
                  onButtonPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${option['title']} selected!')),
                    );
                  },
                  isRecommended: option['isRecommended'],
                  cardGradientColors: option['cardGradientColors'],
                  borderColor: option['borderColor'] ?? Colors.white,
                  borderRadius: option['borderRadius'],
                  buttonGradientColors: option['buttonGradientColors'],
                  tagLabel: option['tagLabel'],
                  overlayGradientColors: option['overlayGradientColors'] ?? [],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

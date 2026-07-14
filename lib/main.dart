import 'package:flutter/material.dart';

void main() {
  runApp(const SportElemzoApp());
}

class SportElemzoApp extends StatelessWidget {
  const SportElemzoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sport Elemző',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.greenAccent,
        scaffoldBackgroundColor: const Color(0xFF0A0A0A),
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> matches = [
    {
      'home': 'Real Madrid',
      'away': 'FC Barcelona',
      'odds1': 2.15,
      'oddsX': 3.50,
      'odds2': 3.10,
      'probHome': 52,
      'probDraw': 25,
      'probAway': 23,
    },
    {
      'home': 'Manchester City',
      'away': 'Liverpool',
      'odds1': 1.85,
      'oddsX': 3.80,
      'odds2': 3.90,
      'probHome': 58,
      'probDraw': 22,
      'probAway': 20,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚽ SportFogadás Elemző'),
        backgroundColor: Colors.green[900],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final m = matches[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            color: Colors.grey[850],
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${m['home']}  —  ${m['away']}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildOdd('1', m['odds1'], '${m['probHome']}%'),
                      _buildOdd('X', m['oddsX'], '${m['probDraw']}%'),
                      _buildOdd('2', m['odds2'], '${m['probAway']}%'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Több meccs és részletes elemzés hamarosan...')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildOdd(String label, double odd, String prob) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Text(odd.toStringAsFixed(2), style: const TextStyle(fontSize: 18)),
        Text(prob, style: const TextStyle(color: Colors.greenAccent)),
      ],
    );
  }
}

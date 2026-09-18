import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MiniCricketApp());
}

class MiniCricketApp extends StatelessWidget {
  const MiniCricketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Cricket',
      home: CricketScreen(),
    );
  }
}

class CricketScreen extends StatefulWidget {
  const CricketScreen({super.key});

  @override
  State<CricketScreen> createState() => _CricketScreenState();
}

class _CricketScreenState extends State<CricketScreen> {

  int totalRun = 0;
  int balls = 6;
  String statusText = "";

  void batClicked() {
    setState(() {
      if (balls > 0) {
        balls = balls - 1;

        List<int> possibleRuns = [0, 1, 2, 3, 4, 6];
        int randNo = possibleRuns[Random().nextInt(possibleRuns.length)];

        totalRun += randNo;

        if (randNo == 0) {
          statusText = "No Runs";
        } else {
          statusText = "$randNo Runs";
        }

      } else {
        totalRun = 0;
        balls = 6;
        statusText = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A75D2),
      appBar: AppBar(
        title: const Text("Mini Cricket", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF064B8A),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/bat.jpg'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/images/ball.jpg'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Runs", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("Balls", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("$totalRun", style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                  Text("$balls", style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
                ],
              ),

              const SizedBox(height: 30),

              Text(
                statusText,
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: balls == 0 ? Colors.red : const Color(0xFF064B8A),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                onPressed: batClicked,
                child: Text(
                  balls == 0 ? "Restart" : "Bat",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
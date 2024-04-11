import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RandomNumberGenerator(),
    );
  }
}

class RandomNumberGenerator extends StatefulWidget {
  @override
  _RandomNumberGeneratorState createState() => _RandomNumberGeneratorState();
}

class _RandomNumberGeneratorState extends State<RandomNumberGenerator> {
  int _randomNumber = 0;
  int _extraPoints = 0;
  List<String> _generatedNumbers = [];

  void _generateRandomNumber(int min, int max) {
    setState(() {
      _randomNumber = Random().nextInt(max - min + 1) + min;
      _generatedNumbers.add(_randomNumber.toString());
      if (min == 1 && max == 2) {
      _extraPoints = 0;
      }
    });
  }

  void _clearGeneratedNumbers() {
    setState(() {
      _randomNumber = 0; 
      _extraPoints = 0; 
      _generatedNumbers.clear();
    });
  }

  void _incrementBonusPoints() {
    setState(() {
      if (_extraPoints < 3) {
        _extraPoints++;
      }
    });
  }

  void _decrementBonusPoints() {
    setState(() {
      if (_extraPoints > -3) {
        _extraPoints--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 103, 6, 1),
      appBar: AppBar(
        title: const Text('Dice spel'),
        titleTextStyle: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.orange),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: SafeArea(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child:InkWell(
                    onTap: () => _generateRandomNumber(1, 4),
                    child: Image.asset('assets/img/D4.png', width: 70, height: 70),
                  ),
                ),
                SizedBox(
                  child:InkWell(
                    onTap: () => _generateRandomNumber(1, 6),
                    child: Image.asset('assets/img/D6.png', width: 70, height: 70),
                  ),
                ),
                SizedBox(
                  child:InkWell(
                    onTap: () => _generateRandomNumber(1, 8),
                    child: Image.asset('assets/img/D8.png', width: 70, height: 70),
                  ),
                ),
                SizedBox(
                  child:InkWell(
                    onTap: () => _generateRandomNumber(1, 10),
                    child: Image.asset('assets/img/D10.png', width: 70, height: 70),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child:InkWell(
                    onTap: () => _generateRandomNumber(1, 12),
                    child: Image.asset('assets/img/D12.png', width: 70, height: 70),
                  ),
                ),
                SizedBox(
                  child:InkWell(
                    onTap: () => _generateRandomNumber(1, 20),
                    child: Image.asset('assets/img/D20.png', width: 70, height: 70),
                  ),
                ),
                SizedBox(
                  child:InkWell(
                    onTap: () => _generateRandomNumber(1, 100),
                    child: Image.asset('assets/img/D100.png', width: 70, height: 70),
                  ),
                ),
                SizedBox(
                  child:InkWell(
                    onTap: () => _generateRandomNumber(1, 2),
                    child: Image.asset('assets/img/D2.png', width: 70, height: 70),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
             'Result',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            
            const SizedBox(height: 20.0),
            Text(
             '$_randomNumber',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),

            const SizedBox(height: 20.0),
            const Text(
             'with extra',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),

            const SizedBox(height: 20.0),
            Text(
             (_randomNumber + _extraPoints).toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            
            const SizedBox(height: 20.0,),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Устанавливаем радиус границы
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0), // Устанавливаем отступы
                ),
              ),
              onPressed: _clearGeneratedNumbers,
              child: const Text('Clear', style: TextStyle(fontSize: 30.0, color: Color.fromARGB(255, 103, 6, 1))),
            ),
          ],
        ),
      ), 
  
      //Extra point
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: _incrementBonusPoints,
            backgroundColor: Colors.white,
            child: const Icon(Icons.add, color: Color.fromARGB(255, 103, 6, 1)
            ),
          ),
          Text('Extra: $_extraPoints',
            style: const TextStyle(fontSize: 20.0, color: Colors.white),
          ),
          FloatingActionButton(
            onPressed: _decrementBonusPoints,
            backgroundColor: Colors.white,
            child: const Icon(Icons.remove, color: Color.fromARGB(255, 103, 6, 1)
            ),
          ),
        ],
      ), 
    );
  }
}




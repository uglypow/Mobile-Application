import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class pinPage extends StatefulWidget {
  const pinPage({super.key});

  @override
  State<pinPage> createState() => _pinPageState();
}

class _pinPageState extends State<pinPage> {
  // state variable
  // Convert "______" string to list of string
  List<String> _pin = "______".split('');
  int _index = 0;

  Widget _buildButton(String number, text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if (_index < _pin.length) {
              _pin[_index] = number;
              _index++;
            }
            print("You clicked " + number);
          });
        },
        child: Ink(
          width: 70.0,
          height: 70.0,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                number,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Text(
                text,
                style: TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFunctionButton(IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 70.0,
          width: 70.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(icon, size: 25.0)],
          ),
        ),
      ),
    );
  }

  void delete() {
    setState(() {
      if (_index > 0) {
        _pin[_index - 1] = "_";
        _index--;
      }
      print("You clicked remove button");
    });
  }

  void clear() {
    setState(() {
      _pin.fillRange(0, _pin.length, "_");
      _index = 0;
      print("You cliked clear button");
    });
  }

  @override
  Widget build(BuildContext context) {
    String pinString = _pin.join(); // Convert the _pin list to a string

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(
                Icons.security,
                size: 60.0,
              ),
              SizedBox(height: 10.0),
              Text(
                'PIN LOGIN',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          Text(
            pinString,
            style: TextStyle(fontSize: 20.0, color: Colors.black54),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton("1", "one"),
                  _buildButton("2", "two"),
                  _buildButton("3", "three"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton("4", "four"),
                  _buildButton("5", "five"),
                  _buildButton("6", "six"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton("7", "seven"),
                  _buildButton("8", "eight"),
                  _buildButton("9", "nine"),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                _buildFunctionButton(Icons.clear, clear),
                _buildButton("0", "zero"),
                _buildFunctionButton(Icons.backspace_outlined, delete),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pin Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const pinPage(),
    );
  }
}

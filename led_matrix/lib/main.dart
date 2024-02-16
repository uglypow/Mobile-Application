import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LED MATRIX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ledMatrix(),
    );
  }
}

class ledMatrix extends StatefulWidget {
  const ledMatrix({super.key});

  @override
  State<ledMatrix> createState() => _ledMatrixState();
}

class _ledMatrixState extends State<ledMatrix> {
  static const dotsData = [
    // Digit 0
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 1
    [
      [0, 0, 1, 0, 0],
      [0, 1, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 1, 1, 0],
    ],
    // Digit 2
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [1, 1, 1, 1, 1],
    ],
    // Digit 3
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 4
    [
      [0, 0, 0, 1, 0],
      [0, 0, 1, 1, 0],
      [0, 1, 0, 1, 0],
      [1, 0, 0, 1, 0],
      [1, 1, 1, 1, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 0, 1, 0],
    ],
    // Digit 5
    [
      [1, 1, 1, 1, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 6
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 0],
      [1, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 7
    [
      [1, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [0, 0, 0, 1, 0],
      [0, 0, 1, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
      [0, 1, 0, 0, 0],
    ],
    // Digit 8
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ],
    // Digit 9
    [
      [0, 1, 1, 1, 0],
      [1, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 1],
      [0, 0, 0, 0, 1],
      [1, 0, 0, 0, 1],
      [0, 1, 1, 1, 0],
    ]
  ];
  String _displayNum = "00";

  Widget _buildDot(int display) {
    Color displayColor = display == 0 ? Color(0xFF333232) : Color(0xFFb2fe58);
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: displayColor,
        ),
      ),
    );
  }

  Widget _buildRow(List<int> dotList) {
    return Row(
      children: [
        for (var i = 0; i < dotList.length; i++) _buildDot(dotList[i])
      ],
    );
  }

  Widget _buildDigit(List<List<int>> rowList) {
    return Column(children: [
      for (var i = 0; i < rowList.length; i++) _buildRow(rowList[i])
    ]);
  }

  Widget _buildDisplay(String value) {
    int firstDigit = int.parse(value.substring(0, 1));
    int secondDigit = int.parse(value.substring(1, 2));
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDigit(dotsData[firstDigit]),
            _buildDigit(dotsData[secondDigit]),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFd8bcfc),
      appBar: AppBar(
        title: Text(
          'CP-SU LED MATRIX',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF7044c4), // Make appbar transparent
        elevation: 0, // Remove appbar shadow
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              customBorder: new CircleBorder(),
              onTap: () {
                setState(() {
                  int currentValue = int.parse(_displayNum);
                  currentValue = (currentValue + 1) %
                      100; // Increment and ensure it stays within the range 0-99
                  _displayNum = currentValue
                      .toString()
                      .padLeft(2, '0'); // Convert back to a 2-digit string
                });
              },
              child: Ink(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_drop_up,
                  color: Color(0xFF250059),
                  size: 80.0,
                ),
              ),
            ),
            Container(
              width: 350.0,
              height: 300.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 10.0,
                ),
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple, // Set the shadow color
                    blurRadius: 25.0, // Set the blur radius of the shadow
                    offset: Offset(0, 5), // Set the offset of the shadow (x, y)
                  ),
                ], // Set the color for the black inside
              ),
              child: _buildDisplay(_displayNum),
            ),
            InkWell(
              customBorder: new CircleBorder(),
              onTap: () {
                setState(() {
                  int currentValue = int.parse(_displayNum);
                  currentValue = (currentValue - 1 + 100) %
                      100; // Decrement and ensure it stays within the range 0-99
                  _displayNum = currentValue
                      .toString()
                      .padLeft(2, '0'); // Convert back to a 2-digit string
                });
              },
              child: Ink(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFF250059),
                  size: 80.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

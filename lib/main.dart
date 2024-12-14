import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Word Counter',
      home: WordCounter(),
    );
  }
}

class WordCounter extends StatefulWidget {
  const WordCounter({Key? key}) : super(key: key);
  @override
  _WordCounterState createState() => _WordCounterState();
}

class _WordCounterState extends State<WordCounter> {
  String _inputText = '';
  int _characterCount = 0;
  int _wordCount = 0;

 void _calculateCounts() {
  setState(() {
    _characterCount = _inputText.length;
    _wordCount = _inputText.trim().isEmpty
        ? 0 
        : _inputText.trim().split(RegExp(r'[,\s.]+(?=\S)')).length;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Counter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                setState(() {
                  _inputText = text;
                  _calculateCounts(); // Calculate counts on the fly
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter text here',
              ),
            ),
            SizedBox(height: 20),
            Text('Characters: $_characterCount'),
            Text('Words: $_wordCount'),
          ],
        ),
      ),
    );
  }
}
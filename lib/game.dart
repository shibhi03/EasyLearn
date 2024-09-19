import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Stack Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> wordStack = [];
  TextEditingController _controller = TextEditingController();
  Random random = Random();

  void _addRandomWord() {
    // Example words; replace with your own logic
    List<String> words = ["Apple", "Banana", "Cherry", "Date", "Fig", "Grape"];
    setState(() {
      wordStack.add(words[random.nextInt(words.length)]);
    });
  }

  void _sortStack(String inputWord) {
    // Implement sorting logic based on relevancy to inputWord
    // Here, we'll just sort alphabetically for simplicity
    setState(() {
      wordStack.sort((a, b) => a.compareTo(b));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Word Stack Game'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: wordStack.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(wordStack[index]),
                );
              },
            ),
          ),
          InputFieldWidget(
            controller: _controller,
            onSubmit: (word) {
              _sortStack(word);
              _controller.clear();
            },
          ),
          ElevatedButton(
            onPressed: _addRandomWord,
            child: Text('Add Random Word'),
          ),
        ],
      ),
    );
  }
}

class InputFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmit;

  InputFieldWidget({required this.controller, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Enter a word',
                border: OutlineInputBorder(),
              ),
              onSubmitted: onSubmit,
            ),
          ),
          SizedBox(width: 8.0),
          ElevatedButton(
            onPressed: () => onSubmit(controller.text),
            child: Text('Sort Stack'),
          ),
        ],
      ),
    );
  }
}

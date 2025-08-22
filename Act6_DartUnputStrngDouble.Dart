import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoPage(),
    );
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DartInputStringDouble Demo")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: DartInputStringDouble(),
      ),
    );
  }
}

class DartInputStringDouble extends StatelessWidget {
  const DartInputStringDouble({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      decoration: const InputDecoration(
        labelText: "Enter decimal number",
        hintText: "e.g. 123.45",
        border: OutlineInputBorder(),
      ),
    );
  }
}

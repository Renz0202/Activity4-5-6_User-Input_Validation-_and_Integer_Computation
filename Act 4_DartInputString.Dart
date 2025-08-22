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
      appBar: AppBar(title: const Text("DartInputString Demo")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DartInputString(
          labelText: "Your Name",
          hintText: "Enter your name",
          prefixIcon: const Icon(Icons.person),
          onChanged: (value) => debugPrint("Typed: $value"),
        ),
      ),
    );
  }
}

/// A simple reusable text input field
class DartInputString extends StatefulWidget {
  const DartInputString({
    super.key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.onChanged,
  });

  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final void Function(String)? onChanged;

  @override
  State<DartInputString> createState() => _DartInputStringState();
}

class _DartInputStringState extends State<DartInputString> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        suffixIcon: _controller.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                  widget.onChanged?.call('');
                  setState(() {}); // refresh suffixIcon
                },
              )
            : null,
      ),
    );
  }
}

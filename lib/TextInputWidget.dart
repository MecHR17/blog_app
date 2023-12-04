import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {

  final Function(String) callback;

  const TextInputWidget(this.callback, {super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {

  final controller = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

  void click(){
    widget.callback(controller.text);
    FocusScope.of(context).unfocus();
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return 
        TextField(
          decoration: InputDecoration(prefixIcon: const Icon(Icons.message),labelText: "Type your message",
            suffixIcon: IconButton(onPressed: click, icon: const Icon(Icons.send))),
          controller: controller
        );
  }
}
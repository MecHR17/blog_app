import 'package:provider/provider.dart';

import 'MyHomePage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Slm"),backgroundColor: Colors.blue,),
      body: const Body()
      );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name = "";
  var controller = TextEditingController();

  void click(){
    name = controller.text;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage(name) )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(padding: const EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 5)),
            prefixIcon: const Icon(Icons.person),
            labelText: "Username:",
            suffixIcon: IconButton(
              icon: const Icon(Icons.done),
              onPressed: click,
              splashColor:Colors.blue,
            )
          ),
        ),
      ),
    );
  }
}
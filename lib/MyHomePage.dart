import 'package:flutter/material.dart';

import 'Post.dart';
import 'PostList.dart';
import 'TextInputWidget.dart';

class MyHomePage extends StatefulWidget {
  final String name;

  const MyHomePage(this.name, {super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<Post> posts = [];
  
  void newPost(String txt){
    setState(() {
      posts.add( Post(txt,widget.name) );
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Slm"),backgroundColor: Colors.blue,),
      body: Column(children: <Widget>[
        Expanded(child: PostList(posts,widget.name)),
        TextInputWidget(newPost),
        ]),
      );
  }
}
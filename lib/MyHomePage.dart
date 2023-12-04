import 'package:blog_app/myAppBar.dart';
import 'package:flutter/material.dart';

import 'Post.dart';
import 'PostList.dart';
import 'TextInputWidget.dart';
import 'postCreatePage.dart';

class MyHomePage extends StatefulWidget {
  final String name;

  const MyHomePage(this.name, {super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<Post> posts = [];
  static int ID = 0;

  void newPost(String title, String txt){
    setState(() {
      posts.add( Post(title,txt,widget.name,ID++) );
    });
  }

  void toPostCreate(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostCreate(widget.name, newPost) )
    );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: myAppBar,
      body: Column(children: <Widget>[
        Expanded(child: PostList(posts,widget.name)),
        IconButton(onPressed: toPostCreate, icon: const Icon(Icons.send_rounded)),
        ]),
      );
  }
}
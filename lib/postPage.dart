import 'package:blog_app/Post.dart';
import 'package:blog_app/myAppBar.dart';
import 'package:flutter/material.dart';

class SinglePost extends StatefulWidget {
  final Post post;

  const SinglePost(this.post,{super.key});

  @override
  State<SinglePost> createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20),
          child: Text(
            widget.post.title,
            style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
          ),
          ),

          Padding(padding: EdgeInsets.all(20),
          child: Text(
            widget.post.body,
            style: TextStyle(fontSize: 16),
          ),
          ),
          
        ],
      )
    );
  }
}
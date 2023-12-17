import 'package:blog_app/myAppBar.dart';
import 'package:flutter/material.dart';

import 'Post.dart';
import 'PostList.dart';
import 'postCreatePage.dart';

import 'database.dart';

class MyHomePage extends StatefulWidget {
  final String name;
  static const List<Post> posts = [];
  const MyHomePage(this.name, {super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = MyHomePage.posts;

  void newPost(String title, String txt){
    var post = Post(title,txt,widget.name);
    post.id = savePost(post);
    setState(() { 
      posts.add( post );
    });
  }

  void updateHomePage() async{
    List<Post> allPosts = await getPosts();
    setState(() {
      posts = allPosts;
    });
  }

  @override
  void initState(){
    super.initState();
    updateHomePage();
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
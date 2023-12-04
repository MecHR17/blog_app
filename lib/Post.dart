import 'package:blog_app/postPage.dart';
import 'package:flutter/material.dart';

class Post{
  String title;
  String body;
  String author;
  int likes = 0;
  int id;

  List<String> liked = [];

  Post(this.title,this.body,this.author,this.id);

  void viewPost(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SinglePost(this) )
    );
  }

  bool userLiked(String name){
    return liked.contains(name);
  }

  void likePost(String name){
    if (liked.contains(name)){
      liked.remove(name);
    }
    else{
      liked.add(name);
    }
  }

  int getLikes(){
    return liked.length;
  }
}
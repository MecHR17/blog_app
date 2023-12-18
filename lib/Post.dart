import 'package:blog_app/database.dart';
import 'package:blog_app/postPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'Comment.dart';

class Post{
  String title;
  String body;
  String author;
  int likes = 0;
  DatabaseReference? id;

  List liked = [];
  List comments = [];

  Post(this.title,this.body,this.author);

  void viewPost(BuildContext context,String name){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SinglePost(this,name) )
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
    update();
  }

  void commentPost(String author, String body){
    comments.add(Comment(body, author));
    update();
  }

  int getLikes(){
    return liked.length;
  }

  void update(){
    updatePost(this, this.id);
  }

  Map<String,dynamic> toJson(){
    List comments = [];
    for (var comment in this.comments) {
      comments.add([comment.body,comment.author]);
    }
    return {
      "author":this.author,
      "title":this.title,
      "body":this.body,
      "liked":this.liked.toList(),
      "comments":comments.toList(),
    };
  }
}
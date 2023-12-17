import 'package:blog_app/database.dart';
import 'package:blog_app/postPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Post{
  String title;
  String body;
  String author;
  int likes = 0;
  DatabaseReference? id;

  List liked = [];

  Post(this.title,this.body,this.author);

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
    update();
  }

  int getLikes(){
    return liked.length;
  }

  void update(){
    updatePost(this, this.id);
  }

  Map<String,dynamic> toJson(){
    return {
      "author":this.author,
      "title":this.title,
      "body":this.body,
      "liked":this.liked.toList(),
    };
  }
}
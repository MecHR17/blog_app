import 'package:firebase_database/firebase_database.dart';

class Comment{
  String body;
  String author;
  DatabaseReference? id;

  Comment(this.body,this.author);
}
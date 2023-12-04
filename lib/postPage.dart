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
      body: Padding(padding: const EdgeInsets.all(10), child:Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),side: const BorderSide(color: Colors.black,width: 2)),
          child: IntrinsicHeight( child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:
          <Widget>[
            Expanded(
              child: Padding(padding: EdgeInsets.all(5) ,child: Column(
                children: <Widget>[
                  Align(child: Text(widget.post.title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                  Align(child: Text(widget.post.body,overflow: TextOverflow.fade,), alignment: Alignment.topLeft),
                  Align(child: Text("\nfrom: "+widget.post.author,style: const TextStyle(color: Colors.grey,fontSize: 13,fontStyle: FontStyle.italic),), alignment: Alignment.bottomLeft,),
                ]
              ))
            ),
          ],
        )
        )))
    );
  }
}
import 'package:blog_app/CommentList.dart';
import 'package:blog_app/Post.dart';
import 'package:blog_app/myAppBar.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class SinglePost extends StatefulWidget {
  final Post post;
  final String name;
  const SinglePost(this.post,this.name,{super.key});

  @override
  State<SinglePost> createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  String comment = "";
  var controller = TextEditingController();

  void click(){
    setState(() {
      comment = controller.text;
      widget.post.commentPost(widget.name, comment);
    });
  }

  void updatePage() async{
    var updatedPost = await getPost(widget.post.id);
    setState(() {
      if(updatedPost!=null){
        widget.post.liked = updatedPost.liked;
        widget.post.comments = updatedPost.comments;
      }
    });
  }

  @override
  void initState(){
    super.initState();
    updatePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: Column(children:<Widget>[Padding(padding: const EdgeInsets.all(10), child:Card(
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
        ))),
        Container(
          decoration: BoxDecoration(color:const Color(0xEE176B87),borderRadius: BorderRadius.circular(5),border: Border.all(width: 2,color: Colors.black)),
          child:Container(padding: const EdgeInsets.fromLTRB(100,10, 100, 10),
                child: Text("Comments",style: const TextStyle(fontSize: 20,color: Colors.white)),
              ),
        ),
        Expanded(child: CommentList(widget.post.comments)),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 5)),
            prefixIcon: const Icon(Icons.comment),
            labelText: "Leave a Comment",
            fillColor: Colors.white,
            filled: true,
            suffixIcon: IconButton(
              icon: const Icon(Icons.done),
              onPressed: click,
              splashColor:Colors.blue,
            )
          ),
        ),
        ])
    );
  }
}
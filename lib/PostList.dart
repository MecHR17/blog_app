import 'package:flutter/material.dart';

import 'Post.dart';

class PostList extends StatefulWidget {
  final List<Post> listItems;
  final String name;
  const PostList(this.listItems, this.name, {super.key});
  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callback){
    setState(() {
      callback(widget.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listItems.length,
      itemBuilder: (context, index) {
        var post = widget.listItems[widget.listItems.length - index - 1];
        return GestureDetector(onTap:() => post.viewPost(context,widget.name), child: Padding(padding: const EdgeInsets.all(10), child:Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),side: const BorderSide(color: Colors.black,width: 2)),
          child: IntrinsicHeight( child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:
          <Widget>[
            Expanded(
              child: Padding(padding: EdgeInsets.all(5) ,child: Column(
                children: <Widget>[
                  Align(child: Text(post.title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                  Align(child: Text(post.body,maxLines: 4,overflow: TextOverflow.fade,), alignment: Alignment.topLeft),
                  Align(child: Text("\nfrom: "+post.author,style: const TextStyle(color: Colors.grey,fontSize: 13,fontStyle: FontStyle.italic),), alignment: Alignment.bottomLeft,),
                ]
              ))
            ),
            Container(
              decoration: BoxDecoration(color:const Color(0xEE176B87),borderRadius: BorderRadius.circular(5),border: Border.all(width: 2,color: Colors.black)),
              child:Column(
                children: <Widget>[
                  Container(padding: const EdgeInsets.fromLTRB(0,0, 10, 0),
                    child: Text(post.getLikes().toString(),style: const TextStyle(fontSize: 20)),
                  ),
                  IconButton(onPressed: () => like(post.likePost), icon: const Icon(Icons.thumb_up),
                    color: post.userLiked(widget.name) ? Colors.green:Colors.black
                  )
                ]),
            )
          ],
        )
        ))));
      },
    );
  }
}
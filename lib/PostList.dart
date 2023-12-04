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
        return Card(child:Row(children:
          <Widget>[
            Expanded(child: ListTile(
              title: Text(post.body), 
              subtitle: Text(post.author), 
            )),
            Row(
              children: <Widget>[
                Container(padding: const EdgeInsets.fromLTRB(0,0, 10, 0),
                  child: Text(post.getLikes().toString(),style: const TextStyle(fontSize: 20)),
                ),
                IconButton(onPressed: () => like(post.likePost), icon: const Icon(Icons.thumb_up),
                  color: post.userLiked(widget.name) ? Colors.green:Colors.black
                )
              ]
            ),
          ],
        ));
      },
    );
  }
}
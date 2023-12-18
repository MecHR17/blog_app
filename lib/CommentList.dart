import 'package:flutter/material.dart';

class CommentList extends StatefulWidget {
  final List listItems;
  const CommentList(this.listItems, {super.key});
  @override
  State<CommentList> createState() => _CommentListState();
}

class _CommentListState extends State<CommentList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listItems.length,
      itemBuilder: (context, index) {
        var comment = widget.listItems[widget.listItems.length - index - 1];
        return Padding(padding: const EdgeInsets.all(10), child:Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),side: const BorderSide(color: Colors.black,width: 2)),
          child: IntrinsicHeight( child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:
          <Widget>[
            Expanded(
              child: Padding(padding: EdgeInsets.all(5) ,child: Column(
                children: <Widget>[
                  Align(child: Text(comment.body,maxLines: 4,overflow: TextOverflow.fade,), alignment: Alignment.topLeft),
                  Align(child: Text("\nfrom: "+comment.author,style: const TextStyle(color: Colors.grey,fontSize: 13,fontStyle: FontStyle.italic),), alignment: Alignment.bottomLeft,),
                ]
              ))
            ),
          ],
        )
        )));
      },
    );
  }
}
import 'package:blog_app/myAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PostCreate extends StatefulWidget {
  final String username;
  final Function(String,String) callback;

  const PostCreate(this.username,this.callback,{super.key});

  @override
  State<PostCreate> createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {

  var TitleController = TextEditingController();
  var BodyController = TextEditingController();

  void onPressed(){
    setState(() {
      widget.callback(TitleController.text,BodyController.text);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20),
          child: TextField(
            controller:TitleController,
            decoration: const InputDecoration(prefixIcon: Icon(Icons.title),labelText: "Title"),
          ),
          ),

          Padding(padding: EdgeInsets.all(20),
          child: TextField(
            controller:BodyController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 5))
              
            ),
          ),
          ),
          
          IconButton(onPressed: onPressed, icon: const Icon(Icons.send))
        ],
      )
    );

  }
}
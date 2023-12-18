import 'package:firebase_database/firebase_database.dart';
import 'Post.dart';
import 'Comment.dart';

DatabaseReference savePost(Post post){
  final dbRef = FirebaseDatabase.instance.ref();
  var id = dbRef.child("posts/").push();
  id.set(post.toJson());
  return id;
}

void updatePost(Post post, DatabaseReference? id){
  if(id != null){
    id.update(post.toJson());
  }
}

Future<Post?> getPost(DatabaseReference? id) async{
  Post? newPost = null;
  if(id != null){
    final post = await id.get();
    var title = post.child("title").value;
    var body = post.child("body").value;
    var author = post.child("author").value;
    var liked = post.child("liked").value;
    var comments = post.child("comments").value;
    newPost = Post(title as String, body as String, author as String);
    if(liked != null){
      newPost.liked = liked as List;
      newPost.liked = newPost.liked.toList(growable: true);
    }
    if(comments != null){
      comments = comments as List;
      comments = comments.toList(growable: true);
      for (var comment in comments) {
        newPost.comments.add(Comment(comment[0],comment[1]));
      }
    }
  }
  return newPost;
}

Future<List<Post>> getPosts() async {
  final dbRef = FirebaseDatabase.instance.ref();
  List<Post> posts = [];
  DatabaseEvent event = await dbRef.child("posts/").once();
  final snap = event.snapshot;
  if (snap.value != null){
    for (var post in snap.children) {
      var title = post.child("title").value;
      var body = post.child("body").value;
      var author = post.child("author").value;
      var liked = post.child("liked").value;
      var comments = post.child("comments").value;
      var id = post.key;
      var newPost = Post(title as String, body as String, author as String);
      if(liked != null){
        newPost.liked = liked as List;
        newPost.liked = newPost.liked.toList(growable: true);
      }
      if(comments != null){
        comments = comments as List;
        comments = comments.toList(growable: true);
        for (var comment in comments) {
          newPost.comments.add(Comment(comment[0],comment[1]));
        }
      }
      if(id!=null)
        newPost.id = dbRef.child('posts/'+id);
      posts.add(newPost);
    }
  }
  return posts;
}
class Post{
  String body;
  String author;
  int likes = 0;

  List<String> liked = [];

  Post(this.body,this.author);

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
  }

  int getLikes(){
    return liked.length;
  }
}
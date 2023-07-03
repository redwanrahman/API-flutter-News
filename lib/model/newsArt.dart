class NewsArt {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsCnt;
  String newsUrl;

  NewsArt(
      {required this.imgUrl,
      required this.newsCnt,
      required this.newsDes,
      required this.newsHead,
      required this.newsUrl});

  static NewsArt formAPItoApp(Map<String, dynamic> article) {
    return NewsArt(
        imgUrl: article["urlToImage"] ??
            "https://img.freepik.com/free-vector/breaking-news-concept_23-2148514216.jpg?w=2000",
        newsCnt: article["content"] ?? "--",
        newsDes: article["description"] ?? "--",
        newsHead: article["title"] ?? "--",
        newsUrl: article["url"] ??
            "https://news.google.com/home?hl=en-US&gl=US&ceid=US:en");
  }
}

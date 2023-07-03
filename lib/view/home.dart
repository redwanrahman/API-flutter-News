import 'package:flutter/material.dart';
import 'package:news_app/controller/fetchNews.dart';
import 'package:news_app/model/newsArt.dart';
import 'package:news_app/view/widgets/NewsContainer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  late NewsArt newsArt;

  GetNews() async {
    newsArt = await FetchNews.fetchNews();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    GetNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: PageController(initialPage: 0),
          scrollDirection: Axis.vertical,
          onPageChanged: (value) {
            setState(() {
              isLoading = true;
            });
            GetNews();
          },
          itemBuilder: (context, index) {
            return NewsContainer(
              imgUrl: newsArt.imgUrl,
              newsCnt: newsArt.newsCnt,
              newsHead: newsArt.newsHead,
              newsDes: newsArt.newsDes,
              newsUrl: newsArt.newsUrl,
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app/view/detail.dart';

class NewsContainer extends StatelessWidget {
  String imgUrl;
  String newsHead;
  String newsDes;
  String newsUrl;
  String newsCnt;

  NewsContainer(
      {super.key,
      required this.imgUrl,
      required this.newsHead,
      required this.newsDes,
      required this.newsCnt,
      required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Image.network(
            height: 400,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            imgUrl),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 18,
              ),
              Text(
                newsHead.length > 70
                    ? "${newsHead.substring(0, 70)}...."
                    : newsHead,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                newsCnt.length > 200
                    ? newsCnt.substring(0, 250)
                    : "${newsCnt.toString().substring(0, newsCnt.length - 15)}.....",
                style: TextStyle(fontSize: 12, color: Colors.black38),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                newsDes,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(newsUrl: newsUrl)));
                  },
                  child: Text("Read More")),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}

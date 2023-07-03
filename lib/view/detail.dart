import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  String newsUrl;
  DetailPage({super.key, required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(newsUrl),
      ),
    );
  }
}

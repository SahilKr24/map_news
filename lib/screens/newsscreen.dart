import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:map_news/models/news.dart';
import 'package:map_news/components/widget.dart';

var lock = false;

Future<List<dynamic>> getCategory(String category) async {
  if (lock){
    return [];
  }
  var list = List<News>();
  var response = await http.get(
      'https://newsapi.org/v2/top-headlines?category=${category}&country=in&apiKey=c3331ea850994b449943e957ef2e6f05');
  if (response.statusCode == 200) {
    jsonDecode(response.body)['articles']
        .forEach((e) => list.add(News.fromJson(e)));
    print(list);
  }
  return list;
}

class NewsScreen extends StatefulWidget {
  final location;
  NewsScreen({this.location});

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final api_key = 'c3331ea850994b449943e957ef2e6f05';
  bool newsloaded;
  var business;
  var entertainment;
  var general;
  var health;
  var science;
  var sports;
  var technology;



   getLists() async {
    business = await compute(getCategory,"business");
    entertainment = await compute(getCategory,"entertainment");
    general = await compute(getCategory,"general");
    health = await compute(getCategory,"health");
    science = await compute(getCategory,"science");
    sports = await compute(getCategory, "sports");
    technology = await compute(getCategory, "technology");
    if(lock){
      return 0;
    }
    setState(() {
      newsloaded = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    newsloaded = false;
    getLists();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    lock = true;
    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: !newsloaded
          ? Center(child: CircularProgressIndicator(),)
          : SingleChildScrollView(
            child: Column(
              children: [
                NewsTile(newsList: business),
                NewsTile(newsList: technology,),
                NewsTile(newsList: science,),
                NewsTile(newsList: health,),
                NewsTile(newsList: entertainment,),
                NewsTile(newsList: sports,)
              ],
            ),
          )
    );
  }
}

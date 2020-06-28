import 'package:flutter/material.dart';
import 'package:map_news/models/news.dart';

List<News> newsList = [News()];

class NewsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 300.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: newsList.length,
            itemBuilder: (BuildContext context, int index) {
              News news = newsList[index];
              return Container(
                margin: EdgeInsets.all(10.0),
                width: 300.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      bottom: 15.0,
                      child: Container(
                        height: 120.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal:20.0,vertical: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                news.title??'title yaha',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                news.description??'desc yaha',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                'time & publisher yaha',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          height: 180.0,
                          width: 280.0,
                          image: NetworkImage(news.urlToImage??'https://s3.cointelegraph.com/storage/uploads/view/39fecf448cb288e29a7c6de899c524d1.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
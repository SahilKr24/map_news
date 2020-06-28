import 'package:flutter/material.dart';
import 'package:map_news/screens/locationscreen.dart';
import 'package:map_news/models/news.dart';
import 'package:map_news/screens/newsscreen.dart';
import 'components/widget.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var news = List<News>();

  int index = 0;

  var body = [NewsScreen(),LocationScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            child: body[index]
          ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.map),
          onPressed: () {
            setState(() {
              index = index == 0 ? 1 : 0;
            });
          },
        ),
      ),
    );
  }
}

// class NewsTile extends StatelessWidget {
//   String urlToImage, title, description, author;
//   NewsTile(
//       {@required this.urlToImage,
//       @required this.title,
//       @required this.description,
//       @required this.author});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(15),
//       height: 210,
//       child: Stack(
//         children: <Widget>[
//           ClipRRect(
//             borderRadius: BorderRadius.circular(18),
//             child: CachedNetworkImage(
//               imageUrl: urlToImage,
//               width: MediaQuery.of(context).size.width,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: 110,
//               decoration: BoxDecoration(
//                   color: Colors.black54.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(18)),
//             ),
//           ),
//           Container(
//             padding: EdgeInsets.symmetric(horizontal:8,vertical:5),
//             width: MediaQuery.of(context).size.width,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   title,
//                   textAlign: TextAlign.left,
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500,color: Colors.white),
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 Text(
//                   description,
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: Colors.white),
//                 ),
//                 SizedBox(
//                   height: 4,
//                 ),
//                 Text(author,style: TextStyle(color: Colors.white),)
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:topratemovies/model.dart';
import 'package:topratemovies/movie_details.dart';

void main() {
  runApp(
    MaterialApp(
      home:HomePage(),
    )
    
  );
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State<HomePage>{

  var url ="https://api.themoviedb.org/3/movie/top_rated?api_key=f987a7f08c1a0f2479a2eed3d410781e";
  TopRatedMovies topRatedMovies;

   @override
   void initState(){
     super.initState();

     fectchData();
   }
  fectchData()async{
var data = await http.get(url);

var jsonData = jsonDecode(data.body);
topRatedMovies = TopRatedMovies.fromJson (jsonData);
print(topRatedMovies.toJson());
setState(() {});
  }

  @override
  Widget build(BuildContext context) {

     return Scaffold(appBar: AppBar(title: Text('Movies'),
   backgroundColor: Colors.cyan,
   ),
   body:topRatedMovies==null?Center(child: CircularProgressIndicator()
   ):GridView.count(
     crossAxisCount: 2,
     scrollDirection: Axis.vertical,
     children:
     topRatedMovies.results.map((movie) =>
       Padding(padding: EdgeInsets.all(1.0),
       child:InkWell(
         onTap:(){
           Navigator.push(context,
           MaterialPageRoute(builder: (context)=>MovieDetail(results:movie)));
         },
         child:Hero(tag: movie.posterPath,
         child: Card(
           child:Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children:[
             Container(
               height: 130,
               child: Image.network("https://image.tmdb.org/t/p/w200${movie.posterPath}"),
             ),
             Text(
               movie.title,
               style:TextStyle(
                 fontSize:10.0,
                 fontWeight: FontWeight.bold
               )
             )

           ],
           ),
         ),
         ),
       )
       )
       ).toList(),
     
     ),
   );
  } 
  }
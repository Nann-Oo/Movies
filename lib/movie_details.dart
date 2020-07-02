import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:topratemovies/model.dart';

class MovieDetail extends StatelessWidget {
  final Results results;
  MovieDetail({this.results});
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
        body: Center( 
          child: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      
                      height: 200.0,
                      
                      child: Center(
                        child:Image.network(
                        "https://image.tmdb.org/t/p/w200${this.results.posterPath}",
                        fit: BoxFit.fill,
                      ),
                      )
                       
                    ),
                    AppBar(
                      backgroundColor: Colors.transparent,
                      leading: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      elevation: 0,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10.0,),
                      Text(this.results.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2,
                        wordSpacing: 0.6
                      ),),
                      SizedBox(height: 20.0,),
                      Text(
                        this.results.overview,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          letterSpacing: 0.2,
                          wordSpacing: 0.3
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            this.results.releaseDate == null 
                            ? 'Unknown' : this.results.releaseDate,
                            style: TextStyle(color: Colors.green),
                          ),
                          Text(this.results.originalTitle,
                          style: TextStyle(color: Colors.green),)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
    );
  }
}
import 'package:flutter/material.dart';
//import 'package:movie_app_flutter/utils/text.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({Key? key, required this.tv}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Discover Shows',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
              // color: Colors.red,
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tv.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      // color: Colors.green,
                      width: 390,
                      child: Column(
                        //mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            //width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/bossbaby.png"),
                                  fit: BoxFit.cover
                                  // NetworkImage(
                                  //     'https://image.tmdb.org/t/p/w500' +
                                  //         tv[index]['backdrop_path']),
                                  ),
                            ),
                            height: 150,
                          ),

                          // Container(
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(10),
                          //     // image: DecorationImage(
                          //     //     //image: AssetImage("assets/images/joker.png"),
                          //     //     fit: BoxFit.cover
                          //     //     // NetworkImage(
                          //     //     //     'https://image.tmdb.org/t/p/w500' +
                          //     //     //         tv[index]['backdrop_path']),
                          //     //     ),
                          //   ),
                          //   height: 140,
                          // ),

                          // Container(
                          //   child: Text(tv[index]['original_name']
                          //       ? tv[index]['original_name']
                          //       : 'Loading'),
                          // )
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

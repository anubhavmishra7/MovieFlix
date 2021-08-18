import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String name, description, bannerurl, posterurl, vote, launch_on;

  const Description(
      {Key? key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.vote,
      // ignore: non_constant_identifier_names
      required this.launch_on})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
              height: 250,
              child: Stack(children: [
                Positioned(
                  child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 10,
                    child: Text(
                      '⭐ Average Rating - ' + vote,
                      style: TextStyle(color: Colors.white),
                    )),
              ])),
          SizedBox(height: 15),
          Container(
              padding: EdgeInsets.all(10),
              // ignore: unnecessary_null_comparison
              child: Text(
                name != null ? name : 'Not Loaded',
                style: TextStyle(color: Colors.white),
              )),
          Container(
              padding: EdgeInsets.only(left: 10),
              child: Text('Releasing On - ' + launch_on,
                  style: TextStyle(color: Colors.white))),
          Row(
            children: [
              Container(
                height: 200,
                width: 100,
                child: Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(description,
                        style: TextStyle(fontSize: 20, color: Colors.white))),
              ),
            ],
          )
        ]),
      ),
    );
  }
}

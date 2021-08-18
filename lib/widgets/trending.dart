import 'package:flutter/material.dart';

class Trending extends StatelessWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Genre", style: TextStyle(color: Colors.white, fontSize: 40)),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.grey),
              child: Column(
                children: [
                  ListTile(
                    title: Text("Action",
                        style: TextStyle(color: Colors.black, fontSize: 24)),
                  ),
                  Divider(
                    thickness: 7,
                    height: 20,
                  ),
                  ListTile(
                    title: Text("Horror",
                        style: TextStyle(color: Colors.black, fontSize: 24)),
                  ),
                  Divider(
                    thickness: 7,
                    height: 20,
                  ),
                  ListTile(
                    title: Text("Romance",
                        style: TextStyle(color: Colors.black, fontSize: 24)),
                  ),
                  Divider(
                    thickness: 7,
                    height: 20,
                  ),
                  ListTile(
                    title: Text("Sci-fi",
                        style: TextStyle(color: Colors.black, fontSize: 24)),
                  ),
                  Divider(
                    thickness: 7,
                    height: 20,
                  ),
                  ListTile(
                    title: Text("Bollywood",
                        style: TextStyle(color: Colors.black, fontSize: 24)),
                  ),
                  Divider(
                    thickness: 7,
                    height: 20,
                  ),
                  ListTile(
                    title: Text("Hollywood",
                        style: TextStyle(color: Colors.black, fontSize: 24)),
                  ),
                  Divider(
                    thickness: 7,
                    height: 20,
                  ),
                  ListTile(
                    title: Text("Kids",
                        style: TextStyle(color: Colors.black, fontSize: 24)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

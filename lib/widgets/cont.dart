import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  const Contacts(BuildContext context, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
              //color: Colors.red,
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 108.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green),
                  //color: Colors.green,
                  padding: EdgeInsets.all(22),
                  child: Text(
                    "Email Us: grocs@hotmail.com",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green),
                  //color: Colors.green,
                  padding: EdgeInsets.all(22),
                  child: Text(
                    "facebook: groceryforyou.com",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green),
                  //color: Colors.green,
                  padding: EdgeInsets.all(22),
                  child: Text(
                    "Whatsapp: +91-94720000023",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green),
                  //color: Colors.green,
                  padding: EdgeInsets.all(22),
                  child: Text(
                    "FAQ: groceryforyou.in",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )),
          // Container(
          //   child: Text("Me"),
          // )
        ));
  }
}

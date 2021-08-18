import 'package:flix/models/contacts.dart';
import 'package:flix/utils/database_helper.dart';
//import 'dart:io';
//import 'package:flix/widgets/cont.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int? index = null;
  final _formKey = GlobalKey<FormState>();
  final _ctrlName = TextEditingController();
  final _ctrlDirector = TextEditingController();

  Contact _contact = Contact(id: null, name: '', director: '');
  List<Contact> _contacts = [];
  late DatabaseHelper _dbHelper;

  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;
    });
    _refreshContactLst();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [_form(), _list()],
        ),
      ),
    );
  }

  _form() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(20)),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Modify Movies",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    controller: _ctrlName,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        labelText: "Name of the Movie"),
                    onSaved: (val) => setState(() => _contact.name = val!),
                    validator: (val) =>
                        (val!.length == 0 ? 'This Field is Required' : null),
                  ),
                  TextFormField(
                      controller: _ctrlDirector,
                      decoration: InputDecoration(
                          labelStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          labelText: "Director"),
                      onSaved: (val) =>
                          setState(() => _contact.director = val!)),
                  TextFormField(
                    decoration: InputDecoration(
                        labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        labelText: "Movie Poster url"),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      child: Text("Submit"),
                      onPressed: () => _onSubmit(),
                    ),
                  )
                ],
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30)),
      );
  _refreshContactLst() async {
    List<Contact> x = await _dbHelper.fetchContacts();
    setState(() {
      _contacts = x;
    });
  }

  _onSubmit() async {
    var form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      if (_contact.id == null)
        await _dbHelper.insertContact(_contact);
      else
        await _dbHelper.updateContact(_contact);
      await _refreshContactLst();
      _resetForm();
    }
  }

  _resetForm() {
    setState(() {
      _formKey.currentState!.reset();
      _ctrlName.clear();
      _ctrlDirector.clear();
      _contact.id = null;
    });
  }

  _list() => Expanded(
        child: Card(
          color: Colors.black,
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      selectedTileColor: Colors.blue,
                      title: Text(
                        "Movie : " + _contacts[index].name.toUpperCase(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Director : " + _contacts[index].director,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onTap: () {
                        setState(() {
                          _contact = _contacts[index];
                          _ctrlName.text = _contacts[index].name;
                          _ctrlDirector.text = _contacts[index].director;
                        });
                      },
                      leading: IconButton(
                        icon: Image.asset(
                          "assets/images/bossbaby.png",
                        ),
                        iconSize: 100,
                        onPressed: () {},
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, size: 20),
                        onPressed: () async {
                          //int inde = index;
                          int? id2 = _contacts[index].id;
                          await _dbHelper.deleteContact(id2!);
                          _resetForm();
                          _refreshContactLst();
                        },
                      ),
                    ),
                  ),
                  Divider(
                    height: 5.0,
                  )
                ],
              );
            },
            itemCount: _contacts.length,
          ),
          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
        ),
      );
}

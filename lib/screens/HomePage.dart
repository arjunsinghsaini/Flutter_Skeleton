import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_skeleton/model/Item.dart';
import 'package:flutter_app_skeleton/screens/MixinState.dart';
import 'package:flutter_app_skeleton/screens/index.dart';
import 'package:flutter_app_skeleton/services/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with MixinState {
  List<Item> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromServer();
  }

  void getDataFromServer() async {
    setLoader(true);
    var response = await ApiRepository.apiRepository.getRequest(URL.DUMMY_API, context);
    setLoader(false);
    List<Item> list = [];
    response.forEach((member) {
      var obj = Item.fromJson(member);
      list.add(obj);
    });
    setState(() {
      items = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Padding(
                padding:  const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  title: Text(
                    item.title.substring(0, 1).toUpperCase() + item.title.substring(1),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.0),
                  ),
                  subtitle: Text(item.body.substring(0, 1).toUpperCase() + item.body.substring(1),
                      style: TextStyle(letterSpacing: 1.0, color: Colors.black87)),
                ),
              );
            },
          ),
          Visibility(
            visible: loading,
            child: Align(
              child: GestureDetector(
                  child: Loading(),
                  onTap: () {
                    setLoader(false);
                  }),
              alignment: FractionalOffset.center,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getDataFromServer,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  handleScreenNavigation(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('');
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import './detail.dart';

void main() {
  runApp(MaterialApp(
    title: "Flutter CRUD",
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List future untuk menyimpan atau mengambil data pada json/http
  Future<List> getData() async {
    final response =
        await http.get("http://192.168.43.69/flutter_crud/getData.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.computer),
        title: Text("Rez Official Store"),
        backgroundColor: Colors.purple[900],
      ),

      // membuat list yang berasal dari getData
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          // membuat penanganan u/ error
          // jika snapshot ada erronya maka print error
          if (snapshot.hasError) print(snapshot.error);
          // menampilkan nilai balik
          return snapshot.hasData
              ? ItemList(
                  list: snapshot.data,
                ) // jika dta ada akan menampilkan listdata
              : Center(
                  child: CircularProgressIndicator(),
                ); // jika tidak ada akan menmpilkan loading
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // jika list = null maka item countnya ada 0 jika tidak maka list.length
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
          child: GestureDetector(
            // ketika di tap akan menampilkan halaman detail
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Detail(
                      list: list,
                      index: i,
                    ))),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.widgets),
                title: Text(list[i]['item_name']),
                subtitle: Text("Stock : ${list[i]['stock']}"),
              ),
            ),
          ),
        );
      },
    );
  }
}

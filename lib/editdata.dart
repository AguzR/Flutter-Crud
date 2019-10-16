import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  // membuat textediting controller pada setiap field
  TextEditingController controllerCode;
  TextEditingController controllerName;
  TextEditingController controllerPrice;
  TextEditingController controllerStock;

  void saveData() {
    var url = "http://192.168.43.69/flutter_crud/editdata.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "itemcode": controllerCode.text,
      "itemname": controllerName.text,
      "price": controllerPrice.text,
      "stock": controllerStock.text,
    });
  }

  @override
  void initState() {
    controllerCode =
        new TextEditingController(text: widget.list[widget.index]['item_code']);
    controllerName =
        new TextEditingController(text: widget.list[widget.index]['item_name']);
    controllerPrice =
        new TextEditingController(text: widget.list[widget.index]['price']);
    controllerStock =
        new TextEditingController(text: widget.list[widget.index]['stock']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data"),
        backgroundColor: Colors.purple[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: controllerCode,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Item Code",
                      labelText: "Item Code",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                TextField(
                  controller: controllerName,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "Item Name",
                      labelText: "Item Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                TextField(
                  controller: controllerPrice,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Price",
                      labelText: "Price",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                ),
                TextField(
                  controller: controllerStock,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Stock",
                      labelText: "Stock",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.purple[900],
                  onPressed: () {
                    saveData();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Home(),
                    ));
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

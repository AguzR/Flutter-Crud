import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './main.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  // membuat textediting controller pada setiap field
  TextEditingController controllerCode = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerPrice = new TextEditingController();
  TextEditingController controllerStock = new TextEditingController();

  void addData() {
    var url = "http://192.168.43.69/flutter_crud/adddata.php";

    http.post(url, body: {
      "itemcode" : controllerCode.text,
      "itemname" : controllerName.text,
      "price" : controllerPrice.text,
      "stock" : controllerStock.text,
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
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
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),

                Padding(padding: EdgeInsets.only(bottom: 10.0),),

                TextField(
                  controller: controllerName,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Item Name",
                    labelText: "Item Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),

                Padding(padding: EdgeInsets.only(bottom: 10.0),),

                TextField(
                  controller: controllerPrice,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),

                Padding(padding: EdgeInsets.only(bottom: 10.0),),

                TextField(
                  controller: controllerStock,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Stock",
                    labelText: "Stock",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),

                Padding(padding: const EdgeInsets.all(10.0),),

                RaisedButton(
                  child: Text("Add Data", style: TextStyle(color: Colors.white),),
                  color: Colors.purple[900],
                  onPressed: (){
                    addData();
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
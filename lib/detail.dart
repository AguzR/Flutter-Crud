import 'package:flutter/material.dart';
import './editdata.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['item_name']}"),
        backgroundColor: Colors.purple[900],
      ),
      body: Container(
        height: 240.0,
        padding: EdgeInsets.all(10.0),
        child: Card(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "${widget.list[widget.index]['item_name']}",
                    style: TextStyle(fontSize: 22.0),
                  ),
                  Text(
                    "Code Item : ${widget.list[widget.index]['item_code']}",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "Price Item : ${widget.list[widget.index]['price']}",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    "Stock Item : ${widget.list[widget.index]['stock']}",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        child: Text("EDIT"),
                        color: Colors.green,
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => EditData(
                            list: widget.list,
                            index: widget.index,
                          ),
                        )),
                      ),
                      RaisedButton(
                        child: Text("DELETE"),
                        color: Colors.red,
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

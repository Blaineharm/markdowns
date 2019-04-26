import 'package:flutter/material.dart';
import 'package:markdowns/main.dart';

class Sync extends StatefulWidget {
  MyHomePageState parent;

  Sync(this.parent);

  @override
  State<StatefulWidget> createState() => SyncState(this);
}

class SyncState extends State<Sync> {
  Sync parent;

  SyncState(this.parent);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    setState(() {
      parent.parent.title = "Sync";
    });

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Sync", textAlign: TextAlign.center)),
      ),
      body: ListView(
        children: <Widget>[
          Padding(child:  Image.asset(
            'images/sync_black_48dp.png',
            width: 600,
            height: 240,
            fit: BoxFit.contain,
          ),padding: EdgeInsets.only(top: 15.0)),
          Padding(
              padding: EdgeInsets.only(top: 25, bottom: 15.0),
              child: buttonSection),
        ],
      ),
    );
  }
}

Widget buttonSection = Container(
  child: Center(
    child: _buildButtonColumn(Icons.update, "Sync"),
  ),
);

Widget titleSection = Container(
  child: Center(
      child: Text(
    "Sync Data",
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 25.0),
  )),
);

Column _buildButtonColumn(IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      RaisedButton(
        child: const Text("Sync Data",style: TextStyle(color: Colors.white),),
        onPressed: null,
        color: Colors.green,

      )
    ],
  );
}

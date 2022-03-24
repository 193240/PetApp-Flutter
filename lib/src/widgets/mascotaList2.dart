import 'package:flutter/material.dart';
import 'package:mvp/src/styles/colors.dart';

class SwipeList extends StatefulWidget {
  SwipeList({Key? key}) : super(key: key);

  @override
  State<SwipeList> createState() => _SwipeListState();
}

class _SwipeListState extends State<SwipeList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: new EdgeInsets.all(10.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new ListTile(
                title: new Text(
                    "Name : ${widgets[i].username}"
                ),
                subtitle: new Text(
                    "Decription : You may go now!!"
                ),
              ),
              new ButtonTheme.bar(
                child: new ButtonBar(
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('Accept'),
                      onPressed: () { /* ... */ },
                    ),
                    new FlatButton(
                      child: const Text('Reject'),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
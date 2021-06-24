import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database_helpers.dart';

class DB extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DBtate();
  }
}

class _DBtate extends State<DB> {
  String valuenya = "";
  _read() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    int rowId = 2;
    Word word = await helper.queryWord(rowId);
    if (word == null) {
      print('read row $rowId: empty');
    } else {
      setState(() {
        valuenya = 'read row $rowId: ${word.word} ${word.frequency}';
      });
      print('read row $rowId: ${word.word} ${word.frequency}');
    }
  }

  _save() async {
    Word word = Word();
    word.word = 'hello';
    word.frequency = 15;
    DatabaseHelper helper = DatabaseHelper.instance;
    int id = await helper.insert(word);
    print('inserted row: $id');
    await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Berhasil Disimpan'),
        //content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.pop(context),
            child: new Text('Ok'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saving data'),
      ),
      body: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text('Read'),
              onPressed: () {
                _read();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text('Save'),
              onPressed: () {
                _save();
              },
            ),
          ),
          Text('$valuenya')
        ],
      ),

    );
  }
}


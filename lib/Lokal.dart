import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skrim/Button.dart';

import 'DecoCard.dart';

class Lokal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LokalState();
  }
}

class _LokalState extends State<Lokal> {
  int valuenya = 0;

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    final value = prefs.getInt(key) ?? 0;
    print('read: $value');
    setState(() {
      valuenya =  value;
    });
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'my_int_key';
    final value = 42;
    prefs.setInt(key, value);
    print('saved $value');
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
      // appBar: AppBar(
      //   title: Text('Saving data'),
      // ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Button(
              text: "Read",
              onTap: () {
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DecoCard(
              child: Text('$valuenya'),
            ),
          )
        ],
      ),
    );
  }
}


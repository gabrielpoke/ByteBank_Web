import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_form.dart';

class ContactLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conatos'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                'Gabriel Victor Leite Prestes',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              subtitle: Text(
                '123456',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              )
              .then((newContact) => debugPrint(newContact.toString()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

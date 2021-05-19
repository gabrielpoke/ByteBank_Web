import 'package:bytebankweb/DataBase/app_database.dart';
import 'package:bytebankweb/models/contact.dart';
import 'package:flutter/material.dart';
import 'contact_form.dart';


class ContactLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: FutureBuilder(
        future: findAll(),
        builder: (context, snapshot) {

          final List<Contact> Contacts = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              final Contact contact = Contacts[index];
              return _ContactItem(contact);
            },
            itemCount: Contacts.length,
          );
        },
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

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

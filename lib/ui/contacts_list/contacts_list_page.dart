import 'package:flutter/material.dart';
import 'package:faker/faker.dart' as faker_lib;

class ContactsListPage extends StatelessWidget {
  const ContactsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final faker = faker_lib.Faker(); // ✅ Create an instance of Faker

    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, int index) {
          return ListTile(
            leading: CircleAvatar(
              child: Text(
                faker.person.firstName()[0],
              ), // First letter as avatar
            ),
            title: Text(
              '${faker.person.firstName()} ${faker.person.lastName()}',
              style: const TextStyle(fontSize: 18),
            ),
            subtitle: Text(faker.phoneNumber.us()),
          );
        },
      ),
    );
  }
}

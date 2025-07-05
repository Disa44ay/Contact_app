import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:contact_app/data/contact.dart';

class ContactsListPage extends StatefulWidget {
  const ContactsListPage({super.key});

  @override
  State<ContactsListPage> createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  late final List<Contact> contacts;

  @override
  void initState() {
    super.initState();

    final fakerInstance = Faker();

    // Generate fake contacts once during initialization
    contacts = List.generate(50, (index) {
      return Contact(
        name:
            '${fakerInstance.person.firstName()} ${fakerInstance.person.lastName()}',
        email: fakerInstance.internet.email(),
        phoneNumber: fakerInstance.randomGenerator.numbers(9, 10).join(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.name, style: const TextStyle(fontSize: 20)),
            subtitle: Text('${contact.email}\n${contact.phoneNumber}'),
            trailing: IconButton(
              icon: Icon(
                contact.isFavourite ? Icons.star : Icons.star_border,
                color: contact.isFavourite ? Colors.amber : null,
              ),
              onPressed: () {
                setState(() {
                  contact.isFavourite = !contact.isFavourite;
                  contacts.sort((a, b) {
                    if (a.isFavourite && !b.isFavourite) {
                      return -1;
                    } else if (!a.isFavourite && b.isFavourite) {
                      return 1;
                    } else {
                      return 0;
                    }
                  });
                });
              },
            ),
            isThreeLine: true,
          );
        },
      ),
    );
  }
}

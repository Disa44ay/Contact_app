class Contact {
  final String name;
  final String email;
  final String phoneNumber;
  bool isFavourite;

  Contact({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.isFavourite = false,
  });
}

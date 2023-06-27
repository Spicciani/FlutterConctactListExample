class Contact {
  int id;
  String name;
  String number;

  Contact(this.id, this.name, this.number);
  Contact.simple(this.name, this.number, [this.id = 0]);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
    };
  }
}

class Character {
  String name;
  String status;
  String species;
  String image;
  String gender;

  Character.fromMap(Map<String, dynamic> map)
      : name = map['name'] ?? "",
        status = map['status'] ?? "",
        species = map['species'] ?? "",
        image = map['image'] ?? "",
        gender = map['gender'] ?? "";
}

class Cases {
  final String id;
  final String name;
  final String lastname;
  final String birthdate;
  final int age;
  final String salarary;
  final String description;
 

  Cases({ this.id, this.name, this.lastname, this.birthdate, this.age, this.salarary, this.description });

  factory Cases.fromJson(Map<String, dynamic> json) {
    return Cases(
      id: json['_id'] as String,
      name: json['name'] as String,
      lastname: json['lastname'] as String,
      birthdate: json['birthdate'] as String,
      age: json['age'] as int,
      salarary: json['salarary'] as String,
      description: json['description'] as String,
    );
  }

  @override
  String toString() {
    return 'Trans{id: $id, name: $name, lastname: $lastname, birthdate: $birthdate, age: $age, salarary: $salarary, description: $description}';
  }
}
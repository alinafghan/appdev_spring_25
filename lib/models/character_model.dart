class Character {
  String name;
  String imageUrl;
  List<dynamic> affiliation;
  PhysicalDescription physicalDescription;
  Bio bio;

  Character({
    required this.name,
    required this.imageUrl,
    required this.affiliation,
    required this.physicalDescription,
    required this.bio,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
        bio: Bio.fromJson(json['bio']),
        name: json['name'] ?? 'NA',
        imageUrl: json['image'] ?? 'NA',
        affiliation: json['politicalInformation']?['affiliations'] == 'NA'
            ? ['NA']
            : json['politicalInformation']['affiliations'],
        physicalDescription:
            PhysicalDescription.fromJson(json['physicalDescription']));
  }
}

class PhysicalDescription {
  String gender;
  String eyeColor;
  String hairColor;

  PhysicalDescription(
      {required this.gender, required this.eyeColor, required this.hairColor});

  factory PhysicalDescription.fromJson(Map<String, dynamic> json) {
    return PhysicalDescription(
        eyeColor: json['eyeColor'] ?? 'NA',
        gender: json['gender'] ?? 'NA',
        hairColor: json['hairColor'] ?? 'NA');
  }
}

class Bio {
  List<dynamic> alternativeNames;
  List<dynamic> ages;

  Bio({
    required this.alternativeNames,
    required this.ages,
  });

  factory Bio.fromJson(Map<String, dynamic> json) {
    return Bio(
      alternativeNames:
          json['alternativeNames'] == 'NA' ? ['NA'] : json['alternativeNames'],
      ages: json['ages'] == 'NA' ? ['NA'] : json['ages'],
    );
  }
}

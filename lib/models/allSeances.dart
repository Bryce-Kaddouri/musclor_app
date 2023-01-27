class AllSeances {
  String? titre;
  String? description;
  List<Exos>? exos;

  AllSeances({this.titre, this.description, this.exos});

  AllSeances.fromJson(Map<String, dynamic> json) {
    titre = json['titre'];
    description = json['description'];
    if (json['exos'] != null) {
      exos = <Exos>[];
      json['exos'].forEach((v) {
        exos!.add(new Exos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titre'] = this.titre;
    data['description'] = this.description;
    if (this.exos != null) {
      data['exos'] = this.exos!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  // function to add a new exercise to the list the seance

}

class Exos {
  String? titre;
  String? description;

  Exos({this.titre, this.description});

  Exos.fromJson(Map<String, dynamic> json) {
    titre = json['titre'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titre'] = this.titre;
    data['description'] = this.description;
    return data;
  }
}

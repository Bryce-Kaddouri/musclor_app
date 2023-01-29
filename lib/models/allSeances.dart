class AllSeances {
  String? titre;
  String? description;
  List<Exo>? exos;

  AllSeances({this.titre, this.description, this.exos});

  AllSeances.fromJson(Map<String, dynamic> json) {
    titre = json['titre'];
    description = json['description'];
    if (json['exos'] != null) {
      exos = <Exo>[];
      json['exos'].forEach((v) {
        exos!.add(new Exo.fromJson(v));
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

class Exo {
  String? titre;
  String? nbRep;
  String? poids;
  String? duree;

  Exo({required this.titre, required this.nbRep, this.poids, this.duree});

  Exo.fromJson(Map<String, dynamic> json) {
    titre = json['titre'];
    nbRep = json['nbRep'];
    poids = json['poids'];
    duree = json['duree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titre'] = titre;
    data['nbRep'] = nbRep;
    data['poids'] = poids;
    data['duree'] = duree;
    return data;
  }
}

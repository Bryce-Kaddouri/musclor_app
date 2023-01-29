import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:appmuscuui/models/allSeances.dart';

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    // print('directory: ${directory.path}');
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    print('path: $path');
    return File('$path/training.json');
  }

  Future<File> get _localFileExos async {
    final path = await _localPath;
    print('path: $path');
    return File('$path/exos.json');
  }

  Future<File> writeJson(String titre, String desc, List<Exo> exos) async {
    final file = await _localFile;

    var map =
        jsonEncode(AllSeances(titre: titre, description: desc, exos: exos));

    if (await file.exists() && await file.readAsString() != '') {
      var content = await file.readAsString();
      // enlever le dernier caractère
      content = content.substring(0, content.length - 1);

      return file.writeAsString('$content,$map]');
    }

    return file.writeAsString('[$map]');
  }

  Future<Object> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      // return a json object
      return json.decode(contents);

      //return int.parse(contents);
    } catch (e) {
      // If we encounter an error, return objet json vide {}

      return json.encode({});
    }
  }

  // function to add an exercice on a exos list of a seance object by its index

  Future<File> addExo(int index, Exo exo) async {
    final file = await _localFile;

    var content = await file.readAsString();

    // enlever le dernier caractère
    content = content.substring(0, content.length - 1);

    // convertir le contenu du fichier en une liste de map
    var list = json.decode(content) as List;

    // ajouter l'exercice à la liste des exercices de la séance
    list[index]['exos'].add(exo.toJson());

    // convertir la liste de map en une chaine de caractère
    var newContent = json.encode(list);

    // ajouter le dernier caractère
    newContent = '$newContent]';

    return file.writeAsString(newContent);
  }

  readJson() {
    readCounter().then((value) {
      print('value: $value');
      value = value as String;
      var list = json.decode(value) as List;
      print('list: $list');
      list.forEach((element) {
        print('element: $element');
        print('titre: ${element['titre']}');
        print('description: ${element['description']}');
        print('exos: ${element['exos']}');
      });
    });
  }

  Future<File> addExoTest() async {
    final file = await _localFile;

    // use writeFrom

    file.open(mode: FileMode.writeOnlyAppend).then((value) {
      value.setPosition(2).then((value) => print('value: $value'));
    }); // positionne le curseur à la position 2 du fichier (après le premier caractère '[')

    return file.writeAsString('test', mode: FileMode.writeOnlyAppend);

    // var content = await file.readAsString();

    // // enlever le dernier caractère
    // content = content.substring(0, content.length - 1);

    // // convertir le contenu du fichier en une liste de map
    // var list = json.decode(content) as List;

    // // ajouter l'exercice à la liste des exercices de la séance
    // list[index]['exos'].add(exo.toJson());

    // // convertir la liste de map en une chaine de caractère
    // var newContent = json.encode(list);

    // // ajouter le dernier caractère
    // newContent = '$newContent]';

    // return file.writeAsString(newContent, mode: FileMode.);
  }
}

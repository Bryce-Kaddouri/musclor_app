import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:appmuscuui/models/exercice.dart';

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    // print('directory: ${directory.path}');
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    // print('path: $path');
    return File('$path/training.json');
  }

  Future<File> writeJson(String json) async {
    final file = await _localFile;

    if (await file.exists() && await file.readAsString() != '') {
      // Read the file
      final contents = await file.readAsString();
      var test = jsonDecode(contents);

      print('test:');
      print(test);
      print('json:');
      print(json);

      var jsonFinal = [test, json];

      // print('json: $json');

      // // print(json);
      // print('test: $test');

      // return a json object
      // var jsonFile = jsonDecode(contents);

      // jsonFile += json;

      // print('jsonFile: $jsonFile');

      // ajouter le json dans le fichier json existant

      // Write the file
      return file.writeAsString(jsonEncode(jsonFinal));
    }

    // Write the file
    return file.writeAsString(json);

// rajouter un json dans le fichier json existant ou créer un fichier json si il n'existe pas encore et y ajouter le json

    // final file = await _localFile;

    // // Write the file
    // return file.writeAsString(json);
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

  Future<File> addJson(
      String title, String description, List<Exercice?> exercices) {
    var directory = getApplicationDocumentsDirectory();

    String jsonString = jsonEncode(
        {"title": title, "description": description, "exercices": exercices});

    // afficher le json

    // setState(() {
    //   // _counter++;
    //   jsonString = jsonEncode(
    //       {"title": title, "description": description, "exercices": exercices});

    //   print(jsonString);
    // });

    // Write the variable as a string to the file.
    // return widget.storage.writeCounter(_counter);
    return writeJson(jsonString);
  }
}

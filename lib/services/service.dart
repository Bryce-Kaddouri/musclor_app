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

  // exos

  Future<File> get _localFileExos async {
    final pathExo = await _localPath;
    print('path: $pathExo');
    return File('$pathExo/exos.json');
  }

  Future<void> addToJSONFile(String title, String nbReps, String poids,
      String duree, String index) async {
    final fileExos = await _localFileExos;

    // Create a map with the data to be added to the JSON file
    Map<String, dynamic> data = {
      'title': title,
      'nbReps': nbReps,
      'poids': poids,
      'duree': duree
    };

    // Open the JSON file for reading

    if (!await fileExos.exists() || await fileExos.readAsString() == '') {
      // Create the JSON file if it doesn't exist
      Map<String, dynamic> initialData = {};
      initialData['0'] = [data];
      fileExos.writeAsString(jsonEncode(initialData));
    } else {
      String jsonString = await fileExos.readAsString();

      // Parse the JSON string into a dynamic object
      dynamic jsonData = jsonDecode(jsonString);

      // Check if the index already exists in the JSON
      if (jsonData.containsKey(index)) {
        // Add the new data to the existing list of exercises at the index
        jsonData[index].add(data);
      } else {
        // Create a new list of exercises at the index
        jsonData[index] = [data];
      }

      // Encode the dynamic object back into a JSON string
      String updatedJsonString = jsonEncode(jsonData);

      // Write the updated JSON string back to the file
      await fileExos.writeAsString(updatedJsonString);
    }
  }

  Future<List<Map<String, String>>> readExosByIndex(String index) async {
    final fileExos = await _localFileExos;

    // Open the JSON file for reading
    String jsonString = await fileExos.readAsString();

    // Parse the JSON string into a dynamic object

    dynamic jsonData = jsonDecode(jsonString);

    // Check if the index already exists in the JSON

    if (jsonData.containsKey(index)) {
      // Add the new data to the existing list of exercises at the index
      print('jsonData[index]: ${jsonData[index]}');
    } else {
      // Create a new list of exercises at the index
      print('index inexistant');
    }

    // Encode the dynamic object back into a JSON string

    return jsonData[index];
  }

  // fin exo

  Future<File> get _localFile async {
    final path = await _localPath;
    print('path: $path');
    return File('$path/training.json');
  }

  Future<Object> writeJson(String titre, String desc, List<Exo> exos) async {
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
}

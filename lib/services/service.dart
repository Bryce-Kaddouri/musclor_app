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

  Future<File> writeJson(String titre, String desc, List<Exos> exos) async {
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

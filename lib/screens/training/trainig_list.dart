import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

class TrainigList extends StatefulWidget {
  String title;
  String subTitle;
  int index;

  TrainigList({
    super.key,
    required this.title,
    required this.subTitle,
    required this.index,
  });

  @override
  State<TrainigList> createState() => _TrainigListState();
}

class _TrainigListState extends State<TrainigList> {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('flutter $path/counter.json');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Read the file
      final contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$counter');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1, // soften the shadow
            offset: Offset(0, 2 /* vertical, horizontal */),
          ),
        ],
      ),
      child: ListTile(
        // if index == 2 contentPadding: EdgeInsets.only(left: 100),
        title: const Text(
          'Séance Pectoraux',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          textAlign: TextAlign.left,
          strutStyle: StrutStyle(
            forceStrutHeight: true,
            height: 1.5,
          ),
        ),

        subtitle: const Text('premiere version de la seance de pectoraux'),
        leading: CircleAvatar(
          child: Text('${widget.index}'),
        ),
        trailing:
            // icon 3 points
            PopupMenuButton(
          onSelected: (String value) {
            print(value);
          },
          icon: const Icon(Icons.more_vert, color: Colors.black),
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                  value: 'info',
                  child: Row(
                    children: const [
                      Icon(Icons.info),
                      SizedBox(width: 10),
                      Text('Info'),
                    ],
                  )),
              PopupMenuItem(
                value: 'edit',
                child: Row(
                  children: const [
                    Icon(Icons.edit),
                    SizedBox(width: 10),
                    Text('Edit'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: const [
                    Icon(Icons.delete),
                    SizedBox(width: 10),
                    Text('Delete'),
                  ],
                ),
              ),
            ];
          },
        ),
        onTap: () async {
          // Map project = allTasks[index];
          // String name = project['name'];
          // print(project);
          Navigator.push(
            context,
            MaterialPageRoute<Widget>(builder: (BuildContext context) {
              // list tasks
              // const int numItems = 10;
              // List<bool> selected = List<bool>.generate(
              //     numItems, (int _index) => false);

              bool trainingisStarted = false;
              // task page for a project
              return Scaffold(
                appBar: AppBar(title: const Text('Training n° x')),
                body: Center(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          // container to start the training (start button) //  si le training est deja commencé, afficher le temps restant et le bouton pause (pause button) // si le training est en pause, afficher le temps restant et le bouton reprendre (resume button) // si le training est fini, afficher le temps total et le bouton recommencer (restart button)

                          Container(
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    "Temps restant :",
                                    style: TextStyle(fontSize: 30),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: const Text(
                                    "02:00:00",
                                    style: TextStyle(fontSize: 30),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: IconButton(
                                    icon: Icon(trainingisStarted
                                        // ignore: dead_code
                                        ? Icons.pause
                                        : Icons.play_arrow),
                                    onPressed: () {
                                      print('play');
                                      trainingisStarted = true;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              "Titre du projet :",
                              style: TextStyle(fontSize: 30),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      // const MyStatefulWidget(),
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

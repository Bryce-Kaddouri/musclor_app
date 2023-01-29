import 'package:appmuscuui/screens/training/new_exo.dart';
import 'package:flutter/material.dart';
import 'package:appmuscuui/services/service.dart';

class DetailTraining extends StatefulWidget {
  int index;
  String title;
  // List exos;
  DetailTraining({
    super.key,
    required this.index,
    required this.title,
  });

  @override
  State<DetailTraining> createState() => _DetailTrainingState();
}

class _DetailTrainingState extends State<DetailTraining> {
  bool trainingisStarted = false;
  bool trainingisPaused = false;
  bool trainingisFinished = false;

  bool isListMode = false;

  List<dynamic> exos = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // test in array of exos in json
    // print('test: ${test[0]["title"]}');$
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Training n° ${widget.index + 1}',
          ),
        ),
        actions: [
          // action pour changer de mode de visualisation (fullscreen ou liste)
          isListMode
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isListMode = false;
                    });
                  },
                  icon: const Icon(Icons.list_alt_outlined, size: 30),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isListMode = true;
                    });
                  },
                  icon: const Icon(Icons.fullscreen, size: 30),
                ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Column(
              children: [
                // container to start the training (start button) //  si le training est deja commencé, afficher le temps restant et le bouton pause (pause button) // si le training est en pause, afficher le temps restant et le bouton reprendre (resume button) // si le training est fini, afficher le temps total et le bouton recommencer (restart button)
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: Text(
                    widget.title,
                    style: const TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),

                Container(
                  color: Colors.red,
                  width: MediaQuery.of(context).size.width,
                  child: Visibility(
                    visible: exos.isEmpty,
                    replacement: const Center(
                      child: Text(
                        'No Item in todo',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: exos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(exos[index]["title"]),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<Widget>(builder: (BuildContext context) {
              // list tasks
              // const int numItems = 10;
              // List<bool> selected = List<bool>.generate(
              //     numItems, (int _index) => false);

              bool trainingisStarted = false;
              // task page for a project
              return AjouterExercice(titre: widget.title, index: widget.index);

              // DetailTraining(
              //   index: widget.index,q
              //   title: widget.title,
              //   exos: widget.exos,
              // );
            }),
          );
        },
        child: const Icon(Icons.add),
      ),

      // bottom nav bar to start the training with a slider to scroll through the exercises (start button) //  si le training est deja commencé, afficher le temps restant et le bouton pause (pause button) // si le training est en pause, afficher le temps restant et le bouton reprendre (resume button) // si le training est fini, afficher le temps total et le bouton recommencer (restart button)
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // bouton start
              IconButton(
                onPressed: () {
                  setState(() {
                    trainingisStarted = true;
                  });
                },
                icon: const Icon(Icons.skip_previous_rounded),
              ),
              // bouton pause
              IconButton(
                  onPressed: () {
                    setState(() {
                      // start the training if it's not started yet (start button) sinon, mettre en pause (pause button)
                      if (!trainingisStarted) {
                        trainingisStarted = true;
                      } else {
                        trainingisPaused = true;
                      }
                    });
                  },
                  // si trainingisStarted ou trainingisPaused =  true, afficher le bouton pause (pause button)
                  icon: trainingisStarted || trainingisPaused
                      ? const Icon(Icons.pause)
                      : const Icon(Icons.play_arrow)),
              // bouton reprendre
              IconButton(
                onPressed: () {
                  setState(() {
                    trainingisPaused = false;
                  });
                },
                icon: const Icon(Icons.skip_next_rounded),
              ),
              // bouton recommencer
              IconButton(
                onPressed: () {
                  setState(() {
                    trainingisStarted = false;
                    trainingisPaused = false;
                    trainingisFinished = false;
                  });
                },
                icon: const Icon(Icons.replay),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

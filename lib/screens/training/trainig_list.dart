import 'package:appmuscuui/models/allSeances.dart';
import 'package:appmuscuui/screens/training/details_train.dart';
import 'package:appmuscuui/screens/training/new_exo.dart';
import 'package:appmuscuui/services/service.dart';
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
  get sessions => null;

  @override
  void initState() {
    super.initState();
  }

  // function to display exos in a list
  // Widget _buildExosList() {
  //   return ListView.builder(
  //     itemCount: widget.exos!.length,
  //     itemBuilder: (context, index) {
  //       // print('exos: ${widget.exos![index]}');
  //       return ListTile(
  //         title: Text(widget.exos![index]),
  //       );
  //     },
  //   );
  // }

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
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
          textAlign: TextAlign.left,
          strutStyle: const StrutStyle(
            forceStrutHeight: true,
            height: 1.5,
          ),
        ),

        subtitle: Text(widget.subTitle,
            style: const TextStyle(fontSize: 15, color: Colors.black54)),
        leading: CircleAvatar(
          child: Text('${widget.index + 1}'),
        ),
        trailing:
            // icon 3 points
            PopupMenuButton(
          onSelected: (String value) {
            if (value == 'info') {
              // show info
            } else if (value == 'edit') {
              // edit
            } else if (value == 'delete') {
              print('delete');
              print(widget.index);

              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Supprimer la séance'),
                    content: const Text(
                        'Voulez-vous vraiment supprimer cette séance ?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          print('annuler');
                        },
                        child: const Text('Annuler'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          print('supprimer');
                          // setState(() {
                          //   // supprimer seance de la var session dans Training
                          //   sessions.removeAt(widget.index);
                          // });
                        },
                        child: const Text('Supprimer'),
                      ),
                    ],
                  );
                },
              );
              // supprimer la séance de la listview

              // saveToFile(allTasks);

              // showSnackBar(context, 'Séance supprimée');

            }

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
          //
          print(widget.index);

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
              return DetailTraining(
                index: widget.index,
                title: widget.title,
                // exos: ,
              );
            }),
          );
        },
      ),
    );
  }
}

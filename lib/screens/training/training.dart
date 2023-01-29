import 'package:appmuscuui/services/service.dart';
import 'package:flutter/material.dart';
import 'package:appmuscuui/screens/training/trainig_list.dart';

class Training extends StatefulWidget {
  // recup data from json file

  const Training({
    super.key,
  });

  @override
  State<Training> createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  List sessions = [];
  List exos = [];

  @override
  void initState() {
    super.initState();
    // read json file
    CounterStorage().readCounter().then((value) {
      print('value: ${value.toString()}');
      setState(() {
        // object json to list;
        sessions = value as List;
        // pour chaque session on recupere les exos
        sessions.forEach((element) {
          exos.add(element['exos']);
          // print('Exos: ${exos.toString()}');
        });
        print('sessions: $sessions');
        print('exos: $exos');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Visibility(
        visible: sessions.isNotEmpty,
        replacement: const Center(
          child: Text(
            'No Item in todo',
            style: TextStyle(fontSize: 20),
          ),
        ),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                TrainigList(
                  title: sessions[index]['titre'],
                  subTitle: sessions[index]['description'],
                  index: index,
                  exos: exos[index],
                ),
              ],
            );
          },
          itemCount: sessions.length,
        ),
      ),
    );
  }
}

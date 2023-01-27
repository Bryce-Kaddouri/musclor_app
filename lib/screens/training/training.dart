import 'package:flutter/material.dart';
import 'package:appmuscuui/screens/training/trainig_list.dart';

class Training extends StatelessWidget {
  const Training({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              TrainigList(
                title: 'Titre test',
                subTitle: 'Sous-titre test',
                index: index,
              ),
            ],
          );
        },
        itemCount: 10,
      ),
    );
  }
}

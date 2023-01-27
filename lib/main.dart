import 'package:appmuscuui/screens/training/add_training.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

// import all the screens we are going to use in our app
import 'package:appmuscuui/screens/home/home.dart';
import 'package:appmuscuui/screens/notification/notification.dart';
import 'package:appmuscuui/screens/training/training.dart';
import 'package:appmuscuui/screens/profil/profil.dart';
import 'package:appmuscuui/screens/recette/recette.dart';
import 'package:appmuscuui/screens/setting/setting.dart';
import 'package:appmuscuui/services/service.dart';

void main() {
  runApp(MyApp(
    storage: CounterStorage(),
  ));
}

// classe path_provider

// fin classe path_provider

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.storage}) : super(key: key);

  final CounterStorage storage;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String jsonString = jsonEncode({});

  int currentPageIndex = 0;
  int indexBody = 0;

  void navBody(int index) {
    setState(() {
      if (index > 3) {
        indexBody = index;
      } else {
        currentPageIndex = index;
        indexBody = index;
      }

      print('indexBody: $indexBody');
      print('currentPageIndex: $currentPageIndex');
    });
  }

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((value) {
      setState(() {
        jsonString = value as String;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _titles = <String>[
      'Accueil',
      'Training',
      'Recette',
      'Profil',
      'Notification',
      'Paramètres',
      'Ajouter un training'
    ];

    return MaterialApp(
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      title: 'My Training App',
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 100),
            child: Text(
              _titles[indexBody],
            ),
          ),
          actions: [
            Container(
              alignment: Alignment.center,
              width: 100,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      // display notification page here
                      navBody(4);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      // display settings page here
                      navBody(5);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            navBody(index);
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            NavigationDestination(
              icon: Icon(Icons.fitness_center_outlined),
              label: 'Trainig',
            ),
            NavigationDestination(
              icon: Icon(Icons.fastfood),
              label: 'Recette',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle),
              label: 'Profil',
            ),
          ],
        ),
        body: <Widget>[
          HomePage(),
          Training(),
          Recette(),
          Profil(),
          NotificationPage(),
          SettingPage(),
          NewTrainig(),
        ][indexBody],
        floatingActionButton: indexBody == 1
            ? FloatingActionButton(
                splashColor: Colors.white,
                tooltip: 'Ajouter un projet',
                backgroundColor: Colors.green[400],
                onPressed: () {
                  // print(project);
                  navBody(6);
                },
                child: const Icon(Icons.add))
            : null,
      ),
    );
  }
}

// class exercice

class CardTrain extends StatefulWidget {
  String title;
  String description;
  int index;

  CardTrain(
      {super.key,
      required this.title,
      required this.description,
      required this.index});

  @override
  State<CardTrain> createState() => _CardTrainState();
}

class _CardTrainState extends State<CardTrain> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

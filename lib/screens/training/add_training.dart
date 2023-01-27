import 'package:flutter/material.dart';
import 'package:appmuscuui/services/service.dart';

class NewTrainig extends StatefulWidget {
  const NewTrainig({super.key});

  @override
  State<NewTrainig> createState() => _NewTrainigState();
}

class _NewTrainigState extends State<NewTrainig> {
  final _formKey = GlobalKey<FormState>();
  // controller pour les champs de saisie de texte (TextFormField)
  final titreController = TextEditingController();
  final descriptionController = TextEditingController();
  // valeur par défaut nb de séries
  String nbSeries = '1';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      alignment: Alignment.center,
      child: Column(
        children: [
          const Text(
            'Nouvelle séance',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    controller: titreController,
                    decoration: const InputDecoration(
                      fillColor: Color.fromRGBO(224, 224, 224, 1),
                      hintText: 'Saisir le titre de la séance',
                      labelText: 'Titre *',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      helperStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      //bordure du champ de saisie grisée
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Veulliez saisir un titre';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    minLines: 2,
                    maxLines: 5,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description *',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      helperStyle: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(158, 158, 158, 1),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez saisir une description';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // info pour dire que les exercice seront a ajouter dans la séance en cliquant sur le bouton ajouter exercice (voir plus bas)
                  Row(children: const [
                    Icon(
                      Icons.info_outline,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        'Les exercices seront ajoutés dans la séance en cliquant sur le bouton "Ajouter un exercice" une fois la séance créée',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ]),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16.0,
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: Size(90, 50),
                            maximumSize: Size(
                                MediaQuery.of(context).size.width * 0.35, 50),
                          ),
                          onPressed: () {
                            setState(() {
                              titreController.clear();
                              descriptionController.clear();
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.cancel, color: Colors.white),
                              Text('Annuler',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(
                                vertical: 18, horizontal: 5),
                            minimumSize: Size(90, 50),
                            maximumSize: Size(
                                MediaQuery.of(context).size.width * 0.35, 50),
                          ),
                          onPressed: () {
                            // Validate will return true if the form is valid, or false if
                            // the form is invalid.
                            if (_formKey.currentState!.validate()) {
                              // print('titre : ${titreController.text}');
                              // print(
                              //     'description : ${descriptionController.text}');
                              // Process data.
                              CounterStorage().addJson(titreController.text,
                                  descriptionController.text, []);
                              // print(titreController.text);
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.save, color: Colors.white),
                              Text('Enregistrer',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

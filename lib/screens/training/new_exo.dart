import 'package:appmuscuui/models/allSeances.dart';
import 'package:appmuscuui/services/service.dart';
import 'package:appmuscuui/utils/snackbar.dart';
import 'package:flutter/material.dart';

class AjouterExercice extends StatefulWidget {
  final String titre;
  final int index;

  const AjouterExercice({
    super.key,
    required this.titre,
    required this.index,
  });

  @override
  State<AjouterExercice> createState() => _AjouterExerciceState();
}

class _AjouterExerciceState extends State<AjouterExercice> {
  final _formKey = GlobalKey<FormState>();
  final titreController = TextEditingController();
  final poidsController = TextEditingController();
  final nbRepetController = TextEditingController();
  final tempsController = TextEditingController();

  // // etat de lexercice
  // bool isDone = false;
  // // final imageController = TextEditingController();
  // // final videoController = TextEditingController();
  // final nbSeriesController = TextEditingController();
  // final nbRepetitionsController = TextEditingController();
  // final tempsReposController = TextEditingController();
  // final tempsReposSeriesController = TextEditingController();
  // final tempsReposExerciceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Ajouter un exercice')),
      ),
      body: Container(
        color: Colors.white24,
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              widget.titre,
              style: const TextStyle(
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
                    // titre de l'exercice
                    TextFormField(
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      controller: titreController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            titreController.clear();
                          },
                          icon: const Icon(Icons.clear, color: Colors.black),
                        ),
                        fillColor: const Color.fromRGBO(224, 224, 224, 1),
                        hintText: 'Saisir le titre de l\'exercice',
                        labelText: 'Titre *',
                        labelStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        helperStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
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
                    // nombre de séries
                    TextFormField(
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      controller: nbRepetController,
                      decoration: InputDecoration(
                        // sufixIcon croix pour effacer le champ
                        suffixIcon: IconButton(
                          onPressed: () {
                            nbRepetController.clear();
                          },
                          icon: const Icon(Icons.clear, color: Colors.black),
                        ),
                        fillColor: const Color.fromRGBO(224, 224, 224, 1),
                        hintText: 'Saisir le nombre de répétitions',
                        labelText: 'Nombre de répétitions*',
                        labelStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        helperStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        //bordure du champ de saisie grisée
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Veulliez saisir un nombre de séries';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // poids de l'exercice
                    TextFormField(
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      controller: poidsController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            nbRepetController.clear();
                          },
                          icon: const Icon(Icons.clear, color: Colors.black),
                        ),
                        fillColor: const Color.fromRGBO(224, 224, 224, 1),
                        hintText: 'Saisir le poids de l\'exercice',
                        labelText: 'Poids (Kg)*',
                        labelStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        helperStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        //bordure du champ de saisie grisée
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Veulliez saisir un poids';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // durée de l'exercice
                    TextFormField(
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      controller: tempsController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            nbRepetController.clear();
                          },
                          icon: const Icon(Icons.clear, color: Colors.black),
                        ),
                        fillColor: const Color.fromRGBO(224, 224, 224, 1),
                        hintText: 'Saisir la durée de l\'exercice',
                        labelText: 'Durée (sec)*',
                        labelStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        helperStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        //bordure du champ de saisie grisée
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Veulliez saisir une durée';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 40.0, horizontal: 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 5),
                              minimumSize: const Size(90, 50),
                              maximumSize: Size(
                                  MediaQuery.of(context).size.width * 0.35, 50),
                            ),
                            onPressed: () {
                              // dispose le clavier
                              FocusScope.of(context).unfocus();
                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState!.validate()) {
                                print('titre : ${titreController.text}');
                                print('poids : ${poidsController.text}');
                                print('temps : ${tempsController.text}');
                                print('nbRepet : ${nbRepetController.text}');

                                var newExo = Exo(
                                  titre: titreController.text,
                                  poids: poidsController.text,
                                  nbRep: nbRepetController.text,
                                  duree: tempsController.text,
                                );

                                CounterStorage().addToJSONFile(
                                  titreController.text,
                                  poidsController.text,
                                  tempsController.text,
                                  nbRepetController.text,
                                  '${widget.index}',
                                );

                                // reset les champs de saisie
                                setState(() {
                                  titreController.clear();
                                  poidsController.clear();
                                  tempsController.clear();
                                  nbRepetController.clear();
                                });

                                shoSuccessMessage(
                                    context, 'Séance enregistrée');
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
      ),
    );
  }
}

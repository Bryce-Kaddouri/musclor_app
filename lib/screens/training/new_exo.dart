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
              'Ajouter un exercice à la séance ${widget.titre} (n° ${widget.index + 1})})',
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
                      decoration: const InputDecoration(
                        fillColor: Color.fromRGBO(224, 224, 224, 1),
                        hintText: 'Saisir le titre de l\'exercice',
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
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
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
                      decoration: const InputDecoration(
                        fillColor: Color.fromRGBO(224, 224, 224, 1),
                        hintText: 'Saisir le nombre de séries',
                        labelText: 'Nombre de séries *',
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
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
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
                      decoration: const InputDecoration(
                        fillColor: Color.fromRGBO(224, 224, 224, 1),
                        hintText: 'Saisir le poids de l\'exercice',
                        labelText: 'Poids *',
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
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
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
                      decoration: const InputDecoration(
                        fillColor: Color.fromRGBO(224, 224, 224, 1),
                        hintText: 'Saisir la durée de l\'exercice',
                        labelText: 'Durée *',
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
                          borderSide:
                              BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
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
                                poidsController.clear();
                                tempsController.clear();
                                nbRepetController.clear();
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
                                print('titre : ${titreController.text}');
                                print('poids : ${poidsController.text}');
                                print('temps : ${tempsController.text}');
                                print('nbRepet : ${nbRepetController.text}');

                                // print(
                                //     'description : ${descriptionController.text}');
                                // Process data.
                                // CounterStorage().writeJson(titreController.text,
                                //     descriptionController.text, List.empty());

                                // reset les champs de saisie
                                setState(() {
                                  titreController.clear();
                                  poidsController.clear();
                                  tempsController.clear();
                                  nbRepetController.clear();
                                });

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => AjouterExercice(
                                //         titre: titreController.text,
                                //         titre: poidsController.text,
                                //         tempsController.text,
                                //         nbRepetController.text),
                                //   ),
                                // );

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
      ),
    );
  }
}

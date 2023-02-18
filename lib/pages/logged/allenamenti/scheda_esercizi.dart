import 'package:flutter/material.dart';
import 'package:mcproject/components/my-session.dart';
import 'package:mcproject/constants/constants.dart';
import 'package:mcproject/data/allenamenti_data.dart';
import 'package:mcproject/model/esercizio.dart';
import 'package:provider/provider.dart';

import '../../../data/workout_data.dart';

class SchedaEsercizi extends StatefulWidget {

  final String nomeSessione;
  final String nomeScheda;

  const SchedaEsercizi({
    Key? key,
    required this.nomeSessione,
    required this.nomeScheda,
  }) : super(key: key);

  @override
  State<SchedaEsercizi> createState() => _SchedaEserciziState();
}

class _SchedaEserciziState extends State<SchedaEsercizi> {

  /* controllers */
  final nomeEsercizioController = TextEditingController();
  final numeroSetsController = TextEditingController();
  final numeroRepsController = TextEditingController();
  final pesoController = TextEditingController();

  /* key form */
  final _formKey = GlobalKey<FormState>();


  //crea nuovo esercizio
  void aggiungiEsercizio() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Aggiungi esercizio'),

          //input nome esercizio
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: TextFormField(
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return '* Obbligatorio';
                            }
                            return null;
                          },
                          controller: nomeEsercizioController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Nome esercizio'
                          ),
                        ),
                      ),

                      //input numero sets
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: TextFormField(
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return '* Obbligatorio';
                            }
                            return null;
                          },
                          controller: numeroSetsController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Numero set'
                          ),
                        ),
                      ),

                      //input numero reps
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: TextFormField(
                          validator: (value) {
                            if(value == null || value.isEmpty) {
                              return '* Obbligatorio';
                            }
                            return null;
                          },
                          controller: numeroRepsController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Numero reps'
                          ),
                        ),
                      ),

                      //input peso
                      TextFormField(
                        validator: (value) {
                          if(value == null || value.isEmpty) {
                            return '* Obbligatorio';
                          }
                          return null;
                        },
                        controller: pesoController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Peso (KG)'
                        ),
                      ),
                    ],
                  )

              )
              //input nome esercizio

            ],
          ),

          actions: [
            Center(
              child: Material(
                color: Colors.black,
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0) ),
                elevation: 18.0,
                clipBehavior: Clip.antiAlias,
                child: MaterialButton(
                    child: Text(
                      'Salva',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    onPressed: salvaEsercizio
                ),
              ),
            ),
          ],
        ));

  }

  /* metodo per salvare esercizio */
  void salvaEsercizio() {
    String nomeEsercizio = nomeEsercizioController.text;
    String numeroSets = numeroSetsController.text;
    String numeroReps = numeroRepsController.text;
    String peso = pesoController.text;

    if(_formKey.currentState!.validate()) {
      Provider.of
      <AllenamentiData>(context, listen:false)
          .addEsercizio(widget.nomeScheda, widget.nomeSessione, nomeEsercizio, numeroSets, numeroReps, peso);

      Navigator.pop(context);
      clear();
    }
  }

  //elimina esercizio
  void deleteEsercizio(int index) {

  }

  //metodo per effettuare un clear dei controller
  void clear() {
    nomeEsercizioController.clear();
    numeroRepsController.clear();
    numeroSetsController.clear();
    pesoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AllenamentiData>(
      builder: (context, value, child) =>
          Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              centerTitle: true,
              title: Text(widget.nomeSessione,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: const BackButton(
                color: Colors.black,
              ),
              backgroundColor: Colors.grey[300],
              elevation: 0,
            ),

            body:
            ListView.builder(
              itemCount: value.getSessioneCorrente(widget.nomeScheda, widget.nomeSessione).esercizi.length,
              itemBuilder: (context, index) {
                return MySessione(
                  nomeEsercizio:
                  value.getSessioneCorrente(widget.nomeScheda, widget.nomeSessione).esercizi[index].nome,
                  sets:
                  value.getSessioneCorrente(widget.nomeScheda, widget.nomeSessione).esercizi[index].sets,
                  reps:
                  value.getSessioneCorrente(widget.nomeScheda, widget.nomeSessione).esercizi[index].reps,
                  peso:
                  value.getSessioneCorrente(widget.nomeScheda, widget.nomeSessione).esercizi[index].peso,
                  deleteFunction: (context) => deleteEsercizio,
                );
              },
            ),

            floatingActionButton: FloatingActionButton(
              backgroundColor: textColor,
              onPressed: aggiungiEsercizio,
              child: Icon(Icons.add),
            ),
          ),
    );
  }
}

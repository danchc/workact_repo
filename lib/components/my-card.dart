import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {

  final String descrizione;
  final Color? colore;
  final IconData? icona;
  final String numero;

  const MyCard({Key? key, required this.descrizione, required this.colore, required this.icona, required this.numero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35),
      child: Container(
        width: 350,
        decoration: BoxDecoration(
          color: colore,
          borderRadius: BorderRadius.circular(30),
            boxShadow: [
                BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(4, 8), // changes position of shadow
              ),
            ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Container(
                alignment: Alignment.center,
                child: Icon(
                    icona,
                  size: 30,
                ),
              ),

              Expanded(
                child: Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      descrizione,
                      style: const TextStyle(
                        fontFamily: 'Barlow',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),

              Chip(
                backgroundColor: Colors.blueAccent,
                label: Text(
                  numero,
                  style: const TextStyle(
                    fontFamily: 'Barlow',
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {

  final String descrizione;
  final Color? colore;
  final IconData? icona;
  final Function()? onTap;

  const MyCard({Key? key, required this.descrizione, required this.colore, required this.icona,
  required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 35),
        child: Container(
          width: 350,
          decoration: BoxDecoration(
            color: colore,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [

                Icon(
                    icona,
                  size: 30,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: Text(
                    descrizione,
                    style: const TextStyle(
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
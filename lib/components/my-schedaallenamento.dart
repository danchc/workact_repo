import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';


class MySchedaAllenamento extends StatelessWidget {

  final String nomeScheda;


  const MySchedaAllenamento({
    Key? key,
    required this.nomeScheda
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 80,
        width: 500,
        child: Row(
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Icon(
                LineIcons.dumbbell,
                size: 34,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0,vertical: 15),
              child: Text(
                nomeScheda,
                style: const TextStyle(
                fontFamily: 'Barlow',
                fontSize: 22,
                fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

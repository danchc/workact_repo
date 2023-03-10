import 'package:flutter/material.dart';

class SquareImage extends StatelessWidget {

  final Function()? onTap;
  final String image;

  const SquareImage({Key? key, required this.image,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0,1)
            )]
        ),
        child: SizedBox(
            height: 40,
            child: Image.asset(image)
        ),
      ),
    );
  }
}

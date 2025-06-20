import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class StartPage extends StatelessWidget {
  const StartPage(this.startquiz,{super.key});
  final  void Function() startquiz;
  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/quizzlogo.png",
            width: 200,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
        ),
        SizedBox(height: 50),
        Text(
          "Learn Flutter The Fun Way!",
          style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
        ),
        SizedBox(height: 50),
        ElevatedButton.icon(
          onPressed: () {
            startquiz();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 28, 1, 138),
          ),
          label: Text(
            "start quiz",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          icon: Icon(Icons.arrow_right_alt),
        ),
      ],
    );
  }
}

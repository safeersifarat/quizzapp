import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summery, {super.key});
  final List<Map<String, Object>> summery;
  @override
  Widget build(BuildContext context) {
    bool iscorrect;
    return Column(
      children:
          summery.map((data) {
            if (data['user-answer'] == data['correct-answer']) {
              iscorrect = true;
            } else {
              iscorrect = false;
            }
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:
                        iscorrect
                            ? const Color.fromARGB(255, 8, 232, 232)
                            : const Color.fromARGB(255, 176, 4, 170),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    (data['question-index'] as int).toString(),
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        data['user-answer'] as String,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          color:
                              iscorrect
                                  ? const Color.fromARGB(255, 8, 232, 232)
                                  : const Color.fromARGB(255, 176, 4, 170),
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        data['correct-answer'] as String,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 8, 232, 232),
                          fontSize: 13,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
    );
  }
}

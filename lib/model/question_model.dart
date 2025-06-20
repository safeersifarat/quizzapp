class Questionmodel {
  const Questionmodel(this.questionText, this.answerText);
  final String questionText;
  final List<String> answerText;
  List<String> getsuffledlist(){
   final shuffledlist = List.of(answerText);
    shuffledlist.shuffle();
    return shuffledlist;
  }
}


class Question {
  final String questionText;
  final List<Answer> answersList;
  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;
  final int answerScore;

  Answer(this.answerText, this.isCorrect, this.answerScore);
}

  List<Question> getQuestions() {
  List<Question> list = [];
  //ADD questions and answer here
  list.add(Question(
    "Did you experience teasing or bullying of any kind?",
    [
      Answer("Yes", false,0),
      Answer("No", true,1),
    ],
  ));
    list.add(Question(
    "Do you think you have good memory?",
    [
      Answer("Yes", true,1),
      Answer("No", false,0),
    ],
  ));
    list.add(Question(
    "Do you have a therapist or counsellor assisting you when required?",
    [
      Answer("Yes", true,1),
      Answer("No", false,0),
    ],
  ));
    list.add(Question(
    "Are you easily frustrated?",
    [
        Answer("Yes", false,0),
      Answer("No", true,1),
    ],
  ));
    list.add(Question(
    "Do you face difficulty in starting a new project/assignment?",
    [
         Answer("Yes", false,0),
       Answer("No", true,1),
    ],
  ));

  return list;
}

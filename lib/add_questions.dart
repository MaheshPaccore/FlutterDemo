
import 'dart:convert';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz/question_model.dart';
import 'package:quiz/widgets/nav-drawer.dart';

class AddQuestionScreen extends StatefulWidget {
  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  //define the datas
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Simple Quiz App'),
      ),
      backgroundColor: Color.fromARGB(255, 184, 191, 243),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            "Simple Quiz App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ]),
      ),
    );
  }
}

class CsvToList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return CsvToListState();
  }

}
class CsvToListState extends State<CsvToList>{
  late List<List<dynamic>> questionData;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<PlatformFile>? _paths;
  String? _extension="csv";
  FileType _pickingType = FileType.custom;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questionData  = List<List<dynamic>>.empty(growable: true);
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          title: const Text('Simple Quiz App'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.green,
                height: 30,
                child: TextButton(
                  child: Text("CSV To List",style: TextStyle(color: Colors.white),),
                  onPressed: _openFileExplorer,
                ),
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: questionData.length,
                itemBuilder: (context,index){
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(questionData[index][0]),
                          Text(questionData[index][1]),
                        ],
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
  openFile(filepath) async
  {
    File f = new File(filepath);
    print("CSV to List");
    final input = f.openRead();
    final fields = await input.transform(utf8.decoder).transform(new CsvToListConverter()).toList();
    print(fields);
    setState(() {
      questionData=fields;
    });
  }

  void _openFileExplorer() async {

    try {

      _paths = (await FilePicker.platform.pickFiles(
        type: _pickingType,
        allowMultiple: false,
        allowedExtensions: (_extension?.isNotEmpty ?? false)
            ? _extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      openFile(_paths![0].path);
      print(_paths);
      print("File path ${_paths![0]}");
      print(_paths!.first.extension);

    });
  }
}


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

  return list;
}
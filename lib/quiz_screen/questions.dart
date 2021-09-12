import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:key2iq_quiz/classes/main_screen_class.dart';
import 'package:key2iq_quiz/classes/question_class.dart';
import 'package:key2iq_quiz/main_screen/main_screen.dart';
import 'package:key2iq_quiz/quiz_screen/quiz_app_bar.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> with SingleTickerProviderStateMixin {
  var questions = MainScreenClass().questionBank;
  int _selectedIndex = 0;
  int _radioButtonSelectedValue = 0;
  String _radioButtonAnswer = '';
  String _submitOrContinue = 'Submit';
  bool correctAnswer = false;
  bool wrongAnswer = false;
  int submitCounter = 0;
  List<bool> correctAnswersList = [false,false,false,false,false,false];


  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 5,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: TabBar(
              controller: _tabController,
              onTap: (index) {
                _selectedIndex = index;
              },
              indicatorPadding: EdgeInsets.zero,
              isScrollable: true,
              labelPadding: EdgeInsets.symmetric(horizontal: 2),
              unselectedLabelColor: Colors.orangeAccent,
              indicatorColor: Colors.transparent,
              tabs: [
                buildTab(0),
                buildTab(1),
                buildTab(2),
                buildTab(3),
                buildTab(4),
                buildTab(5)
                // Tab(
                //   child: Container(
                //     width: 50,
                //     height: _tabController.index == 1?10: 8,
                //     decoration: BoxDecoration(
                //         color: _selectedIndex == 1
                //             ? Colors.orange
                //             : correctAnswersList[1]?Colors.black:Colors.grey),
                //   ),
                // ),
                // Tab(
                //   child: Container(
                //     width: 50,
                //     height: _tabController.index == 2?10: 8,
                //     decoration: BoxDecoration(
                //         color: _selectedIndex == 2
                //             ? Colors.orange
                //             : correctAnswersList[2]?Colors.black:Colors.grey),
                //   ),
                // ),
                // Tab(
                //   child: Container(
                //     width: 50,
                //     height: _tabController.index == 3?10: 8,
                //     decoration: BoxDecoration(
                //         color: _selectedIndex == 3
                //             ? Colors.orange
                //             :correctAnswersList[3]?Colors.black:Colors.grey),
                //   ),
                // ),
                // Tab(
                //   child: Container(
                //     width: 50,
                //     height: _tabController.index  == 4?10: 8,
                //     decoration: BoxDecoration(
                //         color: _selectedIndex == 4
                //             ? Colors.orange
                //             : correctAnswersList[4]?Colors.black:Colors.grey),
                //   ),
                // ),
                // Tab(
                //   child: Container(
                //     width: 50,
                //     height: _tabController.index == 5?10: 8,
                //     decoration: BoxDecoration(
                //         color: _selectedIndex == 5
                //             ? Colors.orange
                //             : correctAnswersList[5]?Colors.black:Colors.grey),
                //   ),
                // ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          controller: _tabController,
          children: [
            questionPageBody(0),
            questionPageBody(1),
            questionPageBody(2),
            questionPageBody(3),
            questionPageBody(4),
            questionPageBody(5),
          ],
        ));
  }

  Tab buildTab(int index) {
    return Tab(
                child: Container(
                  width: 50,
                  height: _tabController.index == index?12: 8,
                  decoration: BoxDecoration(
                      color: _selectedIndex == index
                          ? Colors.orange
                          : correctAnswersList[index]?Colors.black:Colors.grey),
                ),
              );
  }

  Padding questionPageBody(int selectedIndex) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage('images/quiz_img1.png'),
                          fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' LOGIC WARMUPS',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ' Logic Puzzles - Intermediate \n Warmup',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Text(
                questions[selectedIndex].statement,
                maxLines: 15,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                questions[selectedIndex].question,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                height: 2,
                thickness: 1,
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                  itemCount: questions[selectedIndex].options.length,
                  itemBuilder: (context, index) {
                    return correctAnswer
                        ? correctAnswerTile(context, index, selectedIndex)
                        : normalRadioTile(index, selectedIndex);
                  }),
            ),
            InkWell(
              onTap: () {
                if(submitCounter==0){
                  if (_radioButtonAnswer == questions[selectedIndex].answer) {
                    setState(() {
                      submitCounter+=1;
                      _submitOrContinue = 'Continue';
                      correctAnswer = true;
                      correctAnswersList[selectedIndex] = correctAnswer;
                    });
                  }else{
                    setState(() {
                      wrongAnswer = true;
                      _submitOrContinue='Wrong Answer';
                    });

                  }

                }else if(submitCounter==1){
                    setState(() {
                      correctAnswer=false;
                      _submitOrContinue = 'Submit';
                      submitCounter=0;
                      _selectedIndex+=1;
                      _tabController.index+=1;
                      print(correctAnswer);
                    });

                }
                },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: correctAnswer ? Colors.black :Colors.grey),
                child: Center(
                  child: Text(
                    _submitOrContinue,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget correctAnswerTile(BuildContext context, int index, int selectedIndex) {
    return _radioButtonSelectedValue==index?Card(
      elevation: 20,
      child: Row(
        children: [
          Icon(
            Ionicons.ios_checkmark,
            size: 50,
            color: Colors.black,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: normalRadioTile(index, selectedIndex),
            ),
          ),
        ],
      ),
    ):RadioListTile(
        value: index,
        title: Text(questions[selectedIndex].options[index],
        style: TextStyle(
          color: Colors.grey,
        ),),
        groupValue: _radioButtonSelectedValue,
        onChanged: (index){});
  }

  RadioListTile<int> normalRadioTile(int index, int selectedIndex) {
    return RadioListTile(
        value: index,
        groupValue: _radioButtonSelectedValue,
        activeColor: Colors.black,
        title: Text(questions[selectedIndex].options[index]),
        onChanged: (int? value) {
          setState(() {
            _submitOrContinue='Submit';
            _radioButtonSelectedValue = value!;
            _radioButtonAnswer = questions[selectedIndex].options[index];
            print(_radioButtonAnswer);
          });
        });
  }
}

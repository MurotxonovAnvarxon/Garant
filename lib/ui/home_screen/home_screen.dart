import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data/question_data/question_data.dart';
import 'package:untitled/presentation/home/home_bloc.dart';
import 'package:untitled/presentation/theme/theme_bloc.dart';
import 'package:untitled/ui/answer_screen/answer_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    questionList = [];
    bloc.close();
    timer?.cancel();

    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    // TODO: implement initState
    questionList = [
      QuestionData(
          question: 'O\'zbekistonning poytaxti qayerda joylashgan?',
          options: {
            'A': 'Toshkent',
            'B': 'Samarqand',
            'C': 'Buxoro',
            'D': "Barcha Javoblar to'g'ri",
          },
          answer: 'A',
          selectedAnswer: ""),
      QuestionData(
        question: 'Dunyoning eng uzun daryosi qaysi?',
        options: {
          'A': 'Amazonka',
          'B': 'Nayl',
          'C': 'Yangtse',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'B',
        selectedAnswer: '',
      ),
      QuestionData(
        question: 'Quyidagi elementlardan qaysi biri gaz holida mavjud?',
        options: {
          'A': 'Temir',
          'B': 'Oltin',
          'C': 'Kislorod',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'C',
        selectedAnswer: '',
      ),
      QuestionData(
        question: '"Hamlet" tragediyasining muallifi kim?',
        options: {
          'A': 'Leo Tolstoy',
          'B': 'William Shakespeare',
          'C': 'Charles Dickens',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'B',
        selectedAnswer: '',
      ),
      QuestionData(
        question: 'Kambodjaning milliy valyutasi nima?',
        options: {
          'A': 'Dollor',
          'B': 'Euro',
          'C': 'Riel',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'C',
        selectedAnswer: '',
      ),
      QuestionData(
        question: ' Qaysi mashhur ixtirochi lampani ixtiro qildi?',
        options: {
          'A': 'Nikola Tesla',
          'B': 'Alexander Graham Bell',
          'C': 'Thomas Edison',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'C',
        selectedAnswer: '',
      ),
      QuestionData(
        question: 'Yer yuzidagi eng katta sahro qaysi?',
        options: {
          'A': 'Gobi',
          'B': 'Sahra',
          'C': 'Antarktida',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'B',
        selectedAnswer: '',
      ),
      QuestionData(
        question: ' Kim "O\'zbekiston" so‘zini birinchi bo\'lib ishlatgan?',
        options: {
          'A': 'Amir Temur',
          'B': 'Mirzo Ulughbek',
          'C': 'Zahiriddin Muhammad Bobur',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'C',
        selectedAnswer: '',
      ),
      QuestionData(
        question:
            'Qaysi mamlakatda kengaytirilgan qonun bo\'yicha davlatchilik mavjud?',
        options: {
          'A': 'Fransiya',
          'B': 'Rossiya',
          'C': 'Xitoy',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'B',
        selectedAnswer: '',
      ),
      QuestionData(
        question: ' Erdagi eng katta okean qaysi?',
        options: {
          'A': 'Tinch okean',
          'B': 'Atlantika okeani',
          'C': 'Hind okeani',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'A',
        selectedAnswer: '',
      ),
      QuestionData(
        question: ' Qaysi rang to\'rtinchi rangli turkiy bayroqda mavjud?',
        options: {
          'A': 'Qizil',
          'B': 'Oq',
          'C': 'Yashil',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'D',
        selectedAnswer: '',
      ),
      QuestionData(
        question:
            ' Haqiqiy tayyorlanishi uchun qancha vaqt kerak bo\'lgan mahsulot nima?',
        options: {
          'A': 'Pitsa',
          'B': 'Makaroni',
          'C': 'Osh',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'D',
        selectedAnswer: '',
      ),
      QuestionData(
        question: ' Fizikada "elektron" nima uchun ishlatiladi?',
        options: {
          'A': 'Magnetizmni o\'rganish',
          'B': 'Tezlikni o\'lchash',
          'C': 'Yorug\'likni o\'lchash',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'D',
        selectedAnswer: '',
      ),
      QuestionData(
        question:
            ' Etnik guruhlar uchun qaysi davlat ijtimoiy davrlarni tashkil qiladi?',
        options: {
          'A': 'Kanada',
          'B': 'Buyuk Britaniya',
          'C': 'Avstraliya',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'D',
        selectedAnswer: '',
      ),
      QuestionData(
        question: ' Qaysi mamlakatda quyosh chiqadi?',
        options: {
          'A': 'O\'zbekiston',
          'B': 'Yaponiya',
          'C': 'Fransiya',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'B',
        selectedAnswer: '',
      ),
      QuestionData(
        question: ' Kim kimyo ilmiy sohaga katta hissa qo\'shgan?',
        options: {
          'A': 'Marie Curie',
          'B': 'Isaac Newton',
          'C': 'James Watt',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'A',
        selectedAnswer: '',
      ),
      QuestionData(
        question: ' Qaysi yil Dasturchi ilk kompyuterni ixtiro qildi?',
        options: {
          'A': '1822',
          'B': '1945',
          'C': '1971',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'B',
        selectedAnswer: '',
      ),
      QuestionData(
        question:
            ' So\'nggi Jahon Kubogi qaysi mamlakat tomonidan g\'alaba qozondi?',
        options: {
          'A': 'Braziliya',
          'B': 'Fransiya',
          'C': 'Jaboniya',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'B',
        selectedAnswer: '',
      ),
      QuestionData(
        question: ' Uchinchi o\'rindagi raqam nima?',
        options: {
          'A': '2',
          'B': '3',
          'C': '4',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'B',
        selectedAnswer: '',
      ),
      QuestionData(
        question: ' Fizikada eng katta energiya qayerda namoyon bo\'ladi?',
        options: {
          'A': 'Kainat',
          'B': 'Yer yuzasi',
          'C': 'Okeanlar',
          'D': "Barcha Javoblar to'g'ri",
        },
        answer: 'A',
        selectedAnswer: '',
      ),
    ];
    super.initState();
  }
  final bloc = HomeBloc();
  Timer? timer;

  static const int initialTime = 1 * 60; // 5 minutes in seconds
  int remainingTime = initialTime;
  void startTimer() {
    timer?.cancel();  // Clear any existing timer
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        bloc.add(EndQuestion(end: true));

      }
    });
  }

  void resetTimer() {
    timer?.cancel();
    setState(() {
      remainingTime = initialTime;
    });
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: BlocProvider.value(
          value: bloc,
          child: BlocConsumer<HomeBloc, HomeState>(
            listener: (context, state) {
              if(state.end==true){
                var x = questionList.length -
                    (state.trueCount ?? 0) -
                    (state.falseCount ?? 0);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ResultScreen(
                                (state.trueCount ??
                                    0),
                                (state.falseCount ??
                                    0) +
                                    x)));
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 56),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            iconSize: 30,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Column(
                                      children: [
                                        Center(
                                            child: Icon(
                                          Icons.question_mark,
                                          color: Colors.blue,
                                          size: 60,
                                        )),
                                        Center(
                                          child: Text(
                                            "Haqiqatda ham testni yakunlashni hohlaysizmi? Belgilanmagan test javoblari xato deb hisobga olinadi Qaytish Yakunlash",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(height: 50),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                width: 100,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.7),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: Center(
                                                  child: const Text(
                                                    "Qaytish",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                var x = questionList.length -
                                                    (state.trueCount ?? 0) -
                                                    (state.falseCount ?? 0);

                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ResultScreen(
                                                                (state.trueCount ??
                                                                    0),
                                                                (state.falseCount ??
                                                                        0) +
                                                                    x)));
                                              },
                                              child: Container(
                                                width: 100,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: Colors.red
                                                        .withOpacity(0.7),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10))),
                                                child: Center(
                                                  child: Text(
                                                    "Yakunlash",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    content: Text(
                                      "",
                                    ),
                                    actions: <Widget>[],
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.exit_to_app),
                          ),
                          IconButton(
                            iconSize: 30,
                            onPressed: () {},
                            icon: const Icon(Icons.message),
                          ),
                          IconButton(
                            iconSize: 30,
                            onPressed: () {
                              context.read<ThemeBloc>().add(ToggleThemeEvent());

                            },
                            icon: const Icon(Icons.nightlight_outlined),
                          ),
                          Container(
                            width: 100,
                            height: 35,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                            ),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 30,
                                  color: Colors.blue,
                                ),
                                Text(
                                    formatTime(remainingTime),

                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 70, // Specified height for the container
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: questionList.length,
                          itemBuilder: (context, index) {
                            // Colors for each box
                            Color backgroundColor;

                            if (questionList[index].selectedAnswer ==
                                questionList[index].answer) {
                              backgroundColor = Colors.green; // Correct answer
                            } else {
                              backgroundColor = Colors.red; // Incorrect answer
                            }
                            if (questionList[index].selectedAnswer == "") {
                              backgroundColor =
                                  Colors.white; // Incorrect answer
                            }

                            // Determine text color based on background color
                            Color textColor =
                                Colors.white; // Default text color
                            if (backgroundColor == Colors.white) {
                              textColor = Colors.black;
                            }

                            return InkWell(
                              onTap: () {
                                setState(() {
                                  bloc.add(
                                      SelectQuestionEvent(selectIndex: index));
                                  // selectIndex = index;
                                });
                              },
                              child: Column(
                                children: [
                                  Builder(builder: (context) {
                                    if ((state.selectIndex ?? 0) == index) {
                                      return Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.blue,
                                      );
                                    }
                                    return SizedBox();
                                  }),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.grey, width: 1),
                                      ),
                                      child: Center(
                                        child: Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(22.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Savol:\n${questionList[state.selectIndex ?? 0 ?? 0].question}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Javoblar',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          SizedBox(height: 8),
                          _buildAnswerContainer(
                              'A',
                              '${questionList[state.selectIndex ?? 0].options["A"]}',
                              Colors.white,
                              questionList[state.selectIndex ?? 0]
                                          .selectedAnswer ==
                                      'A'
                                  ? questionList[state.selectIndex ?? 0]
                                              .answer ==
                                          'A'
                                      ? Colors.green
                                      : Colors.red
                                  : Colors.black,
                              bloc),
                          _buildAnswerContainer(
                              'B',
                              '${questionList[state.selectIndex ?? 0].options["B"]}',
                              Colors.white,
                              questionList[state.selectIndex ?? 0]
                                          .selectedAnswer ==
                                      'B'
                                  ? questionList[state.selectIndex ?? 0]
                                              .answer ==
                                          'B'
                                      ? Colors.green
                                      : Colors.red
                                  : Colors.black,
                              bloc),
                          _buildAnswerContainer(
                              'C',
                              '${questionList[state.selectIndex ?? 0].options["C"]}',
                              Colors.white,
                              questionList[state.selectIndex ?? 0]
                                          .selectedAnswer ==
                                      'C'
                                  ? questionList[state.selectIndex ?? 0]
                                              .answer ==
                                          'C'
                                      ? Colors.green
                                      : Colors.red
                                  : Colors.black,
                              bloc),
                          _buildAnswerContainer(
                              'D',
                              'Barcha javoblar noto’g’ri',
                              Colors.white,
                              questionList[state.selectIndex ?? 0]
                                          .selectedAnswer ==
                                      'D'
                                  ? questionList[state.selectIndex ?? 0]
                                              .answer ==
                                          'D'
                                      ? Colors.green
                                      : Colors.red
                                  : Colors.black,
                              bloc),
                          SizedBox(height: 20),
                          // Added a SizedBox to provide space before the Spacer
                          Builder(builder: (context) {
                            if ((state.selectIndex ?? 0) + 1 ==
                                questionList.length) {
                              return Center(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if ((state.selectIndex ?? 0) > 0)
                                              bloc.add(SelectQuestionEvent(
                                                  selectIndex:
                                                      state.selectIndex ??
                                                          0 - 1));

                                            // state.selectIndex??0--;
                                          });
                                        },
                                        icon: Icon(Icons.arrow_back),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          var x = questionList.length -
                                              (state.trueCount ?? 0) -
                                              (state.falseCount ?? 0);

                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ResultScreen(
                                                          (state.trueCount ??
                                                              0),
                                                          (state.falseCount ??
                                                                  0) +
                                                              x)));
                                        },
                                        child: Container(
                                          width: 150,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Center(
                                              child: Text(
                                            "Yakunlash",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                        ),
                                      ),
                                    ]),
                              );
                            }
                            return Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if ((state.selectIndex ?? 0) > 0)
                                              bloc.add(PreviousButtonEvent(
                                                  count:
                                                      (state.selectIndex ?? 0) -
                                                          1));
                                          });
                                        },
                                        icon: Icon(Icons.arrow_back),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  '${(state.selectIndex ?? 0) + 1}/${questionList.length}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if ((state.selectIndex ?? 0) <
                                                questionList.length - 1) {
                                              bloc.add(NextButtonEvent(
                                                  count:
                                                      (state.selectIndex ?? 0) +
                                                          1));
                                            }
                                          });
                                        },
                                        icon: Icon(Icons.arrow_forward),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildAnswerContainer(String answerKey, String answerText, Color bgColor,
    Color textColor, HomeBloc bloc) {
  return BlocConsumer<HomeBloc, HomeState>(
    bloc: bloc,
    listener: (context, state) {},
    builder: (context, state) {
      bool isSelected =
          questionList[state.selectIndex ?? 0].selectedAnswer == answerKey;
      bool isCorrect = questionList[state.selectIndex ?? 0].answer == answerKey;
      bool isAnswered =
          questionList[state.selectIndex ?? 0].selectedAnswer.isNotEmpty;

      // Determine background color
      Color backgroundColor;
      if (isAnswered) {
        if (isCorrect) {
          backgroundColor = Colors.green;
        } else if (isSelected) {
          backgroundColor = Colors.red;
        } else {
          backgroundColor = Colors.white;
        }
      } else {
        backgroundColor = Colors.white;
      }

      // Determine text color
      Color answerTextColor =
          isAnswered && (isSelected || isCorrect) ? Colors.white : Colors.black;

      return InkWell(
        onTap: () {
          if (!isAnswered) {
            // Handle answer selection
            // setState(() {
            questionList[state.selectIndex ?? 0].selectedAnswer = answerKey;

            int trueCount = 0;
            int falseCount = 0;

            // Update counts
            for (var question in questionList) {
              if (question.selectedAnswer.isNotEmpty) {
                if (question.selectedAnswer == question.answer) {
                  trueCount++;
                } else {
                  falseCount++;
                }
              }
            }

            // Update the bloc with the new counts
            bloc.add(TruCountEvent(trueCount: trueCount));
            bloc.add(FalseCountEvent(falseCount: falseCount));
            // });
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(
                '$answerKey  ',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: Text(
                  answerText,
                  style: TextStyle(
                    fontSize: 16,
                    color: answerTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

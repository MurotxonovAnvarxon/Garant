part of 'home_bloc.dart';

class HomeState {
  int? selectIndex;
  List<QuestionData>? questionList;
  int? trueCount;
  int? falseCount;

  HomeState(
      {this.selectIndex, this.questionList, this.trueCount, this.falseCount});

  HomeState copyWith(
          {int? selectIndex,
          List<QuestionData>? questionList,
          int? trueCount,
          int? falseCount}) =>
      HomeState(
          selectIndex: selectIndex ?? this.selectIndex,
          questionList: questionList ?? this.questionList,
          trueCount: trueCount ?? this.trueCount,
          falseCount: falseCount ?? this.falseCount);
}

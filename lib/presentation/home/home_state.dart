part of 'home_bloc.dart';

class HomeState {
  int? selectIndex;
  List<QuestionData>? questionList;
  int? trueCount;
  int? falseCount;
  bool? end;

  HomeState(
      {this.selectIndex, this.questionList, this.trueCount, this.falseCount,this.end});

  HomeState copyWith(
          {int? selectIndex,
          List<QuestionData>? questionList,
          int? trueCount,
          int? falseCount,
          bool? end
          }) =>
      HomeState(
          selectIndex: selectIndex ?? this.selectIndex,
          questionList: questionList ?? this.questionList,
          trueCount: trueCount ?? this.trueCount,
          falseCount: falseCount ?? this.falseCount,
      end:end??this.end
      );
}

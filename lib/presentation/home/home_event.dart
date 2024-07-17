part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class SelectQuestionEvent extends HomeEvent {
  final int selectIndex;

  SelectQuestionEvent({required this.selectIndex});
}

class TruCountEvent extends HomeEvent {
  final int trueCount;

  TruCountEvent({required this.trueCount});
}

class FalseCountEvent extends HomeEvent {
  final int falseCount;

  FalseCountEvent({required this.falseCount});
}

class NextButtonEvent extends HomeEvent {
  final int count;

  NextButtonEvent({required this.count});
}

class PreviousButtonEvent extends HomeEvent {
  final int count;

  PreviousButtonEvent({required this.count});
}

class BackButtonEvent extends HomeEvent{
  final bool hasBack;

  BackButtonEvent({required this.hasBack});
}



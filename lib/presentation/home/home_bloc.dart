import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/question_data/question_data.dart';
import 'package:untitled/ui/home_screen/home_screen.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<SelectQuestionEvent>((event, emit) async {
      emit(state.copyWith(selectIndex: event.selectIndex));
    });
    on<TruCountEvent>((event, emit) async {
      emit(state.copyWith(trueCount: event.trueCount));
    });
    on<FalseCountEvent>((event, emit) async {
      emit(state.copyWith(falseCount: event.falseCount));
    });
    on<NextButtonEvent>((event, emit) async {
      emit(state.copyWith(selectIndex: event.count));
    });
    on<PreviousButtonEvent>((event, emit) async {
      emit(state.copyWith(selectIndex: event.count));
    });
  }
}

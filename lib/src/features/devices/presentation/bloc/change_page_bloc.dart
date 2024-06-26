import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_page_event.dart';

class ChangePageBloc extends Bloc<ChangePageEvent, int> {
  ChangePageBloc() : super(0) {
    on<ChangeIndexEvent>((event, emit) {
      emit(event.index);
    });
  }
}

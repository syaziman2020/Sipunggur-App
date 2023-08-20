part of 'change_page_bloc.dart';

sealed class ChangePageEvent extends Equatable {
  const ChangePageEvent();

  @override
  List<Object> get props => [];
}

class ChangeIndexEvent extends ChangePageEvent {
  final int index;
  ChangeIndexEvent(this.index);

  @override
  List<Object> get props => [index];
}

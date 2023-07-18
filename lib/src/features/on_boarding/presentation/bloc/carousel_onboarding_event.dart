part of 'carousel_onboarding_bloc.dart';

@immutable
abstract class CarouselOnboardingEvent {}

class ChangeContentEvent extends CarouselOnboardingEvent {
  final int index;
  ChangeContentEvent(this.index);
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'carousel_onboarding_event.dart';

class CarouselOnboardingBloc extends Bloc<CarouselOnboardingEvent, int> {
  CarouselOnboardingBloc() : super(0) {
    on<ChangeContentEvent>((event, emit) {
      emit(event.index);
    });
  }
}

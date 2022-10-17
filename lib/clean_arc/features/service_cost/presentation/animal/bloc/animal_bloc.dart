import 'package:bloc/bloc.dart';
import 'animal_event.dart';

class GroomingBloc extends Bloc<AnimalEvent, bool> {
  GroomingBloc() : super(false) {
    on<ChangeGroomingEvent>((event, emit) => emit(!state));
  }
}

class HotelBloc extends Bloc<AnimalEvent, bool> {
  HotelBloc() : super(false) {
    on<ChangeHotelEvent>((event, emit) => emit(!state));
  }
}

class NightsBloc extends Bloc<AnimalEvent, int> {
  NightsBloc() : super(0) {
    on<IncrementEvent>((event, emit) => emit(state + 1));
    on<DecrementEvent>((event, emit) => emit(state - 1));
  }
}

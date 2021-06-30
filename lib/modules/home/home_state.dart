import 'package:split_it/shared/models/event_model.dart';

abstract class HomeState {}

class HomeStateEmpty extends HomeState {}

class HomeStateSucess extends HomeState {
  List<EventModel> events;
  HomeStateSucess({
    required this.events,
  });
}

class HomeStateFailure extends HomeState {
  String message;
  HomeStateFailure({
    required this.message,
  });
}

class HomeStateLoading extends HomeState {}

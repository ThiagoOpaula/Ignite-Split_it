import 'package:split_it/modules/home/models/dashboard_model.dart';

abstract class AppBarState {}

class AppBarStateEmpty extends AppBarState {}

class AppBarStateSucess extends AppBarState {
  DashboardModel dashboard;
  AppBarStateSucess({
    required this.dashboard,
  });
}

class AppBarStateFailure extends AppBarState {
  String message;
  AppBarStateFailure({
    required this.message,
  });
}

class AppBarStateLoading extends AppBarState {}

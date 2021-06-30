import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modules/home/models/dashboard_model.dart';
import 'package:split_it/modules/home/repositories/home_repository.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_controller.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_state.dart';

class HomeRepositoryMock extends Mock implements HomeRepository {}

void main() {
  late AppBarController controller;
  late HomeRepository repository;
  setUp(() {
    repository = HomeRepositoryMock();
    controller = AppBarController(repository: repository);
  });

  test("Testando o getDashboard - Sucess", () async {
    expect(controller.state, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    controller.listen((state) => states.add(state));
    when(repository.getDashboard)
        .thenAnswer((_) async => DashboardModel(send: 100, receive: 50));
    await controller.getDashboard(() {});
    expect(states[0], isInstanceOf<AppBarStateLoading>());
    expect(states[1], isInstanceOf<AppBarStateSucess>());
    expect(states.length, 2);
  });

  test("Testando o getDashboard - Failure", () async {
    expect(controller.state, isInstanceOf<AppBarStateEmpty>());
    final states = <AppBarState>[];
    controller.listen((state) => states.add(state));
    when(repository.getDashboard).thenThrow("Deu error");
    await controller.getDashboard(() {});
    expect(states[0], isInstanceOf<AppBarStateLoading>());
    expect(states[1], isInstanceOf<AppBarStateFailure>());
    expect((states[1] as AppBarStateFailure).message, "Deu error");
    expect(states.length, 2);
  });
}

import 'package:mobx/mobx.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';

part 'check_rounded_controller.g.dart';

enum CheckRoundedStatus { empty, loading, error, sucess }

class CheckRoundedController = _CheckRoundedControllerBase
    with _$CheckRoundedController;

abstract class _CheckRoundedControllerBase with Store {
  final FirebaseRepository repository;
  final EventModel event;
  var isPaid = false;
  _CheckRoundedControllerBase({required this.repository, required this.event});

  @observable
  CheckRoundedStatus status = CheckRoundedStatus.empty;

  @action
  Future<void> update(FriendModel friend) async {
    try {
      status = CheckRoundedStatus.loading;
      final friends = event.friends;
      final indexWhere =
          event.friends.indexWhere((element) => element == friend);
      isPaid = !friends[indexWhere].isPaid;
      friends[indexWhere] = friends[indexWhere].copyWith(isPaid: isPaid);
      final newPaid = event.value -
          event.paid +
          (isPaid ? -event.valueSplit : event.valueSplit);
      final model = event.copyWith(friends: friends, paid: newPaid);
      await repository.update(
          id: event.id, collection: "/events", model: model);
      if (isPaid) {
        status = CheckRoundedStatus.sucess;
      } else {
        status = CheckRoundedStatus.empty;
      }
    } catch (e) {
      status = CheckRoundedStatus.error;
    }
  }
}

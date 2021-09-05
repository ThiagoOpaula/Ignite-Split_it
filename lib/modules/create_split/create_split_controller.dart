import 'package:mobx/mobx.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/models/item_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';

part 'create_split_controller.g.dart';

class CreateSplitController = _CreateSplitController
    with _$CreateSplitController;

abstract class _CreateSplitController with Store {
  final FirebaseRepository repository;
  _CreateSplitController({required this.repository});

  @observable
  int currentPage = 0;

  @action
  void nextPage() {
    if (currentPage < 3) {
      currentPage++;
    }
  }

  void backPage() {
    if (currentPage > 0) {
      currentPage--;
    }
  }

  @observable
  EventModel event = EventModel();

  @computed
  bool get enableNavigateButton {
    if (event.name.isNotEmpty && currentPage == 0) {
      return true;
    } else if (event.friends.isNotEmpty && currentPage == 1) {
      return true;
    } else if (event.items.isNotEmpty && currentPage == 2) {
      return true;
    } else {
      return false;
    }
  }

  @action
  void onChanged(
      {String? name, List<ItemModel>? items, List<FriendModel>? friends}) {
    event = event.copyWith(name: name, items: items, friends: friends);
  }

  @observable
  String status = "empty";

  @action
  Future<void> saveEvent() async {
    try {
      status = "loading";
      final response = await repository.create(event);
      status = "sucess";
      nextPage();
    } catch (e) {
      status = "error";
    }
  }
}

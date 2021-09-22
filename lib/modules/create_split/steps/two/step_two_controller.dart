import 'package:mobx/mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
part 'step_two_controller.g.dart';

class StepTwoController = _StepTwoControllerBase with _$StepTwoController;

abstract class _StepTwoControllerBase with Store {
  final CreateSplitController controller;
  final repository = FirebaseRepository();
  late ReactionDisposer _disposer;
  _StepTwoControllerBase({required this.controller}) {
    _disposer = autorun((_) {
      controller.onChanged(friends: _selectedFriends);
    });
  }

  @observable
  List<FriendModel> _friends = [];

  @observable
  ObservableList<FriendModel> _selectedFriends = ObservableList.of([]);

  List<FriendModel> get selectedFriends => _selectedFriends;

  @observable
  String search = "";

  @action
  void onChange(String value) {
    search = value;
  }

  @action
  void addFriend(FriendModel friend) {
    _selectedFriends.add(friend);
  }

  @action
  void removeFriend(FriendModel friend) {
    _selectedFriends.remove(friend);
  }

  @computed
  List<FriendModel> get items {
    if (_selectedFriends.isNotEmpty) {
      final filteredList = _friends.where((element) {
        final validadeName = element.name
            .toString()
            .toLowerCase()
            .contains(search.toLowerCase());
        final notExistIsSelectedFriends = !_selectedFriends.contains(element);
        return validadeName && notExistIsSelectedFriends;
      }).toList();
      return filteredList;
    }
    if (search.isEmpty) {
      return _friends;
    } else {
      final filteredList = _friends
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(search.toLowerCase()))
          .toList();
      return filteredList;
    }
  }

  @action
  Future<void> getFriends() async {
    final response = await this.repository.get("/friends");
    _friends = response.map((e) => FriendModel.fromMap(e)).toList();
  }

  void dispose() {
    _disposer();
  }
}

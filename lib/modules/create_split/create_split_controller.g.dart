// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_split_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateSplitController on _CreateSplitController, Store {
  Computed<bool>? _$enableNavigateButtonComputed;

  @override
  bool get enableNavigateButton => (_$enableNavigateButtonComputed ??=
          Computed<bool>(() => super.enableNavigateButton,
              name: '_CreateSplitController.enableNavigateButton'))
      .value;

  final _$currentPageAtom = Atom(name: '_CreateSplitController.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$eventAtom = Atom(name: '_CreateSplitController.event');

  @override
  EventModel get event {
    _$eventAtom.reportRead();
    return super.event;
  }

  @override
  set event(EventModel value) {
    _$eventAtom.reportWrite(value, super.event, () {
      super.event = value;
    });
  }

  final _$statusAtom = Atom(name: '_CreateSplitController.status');

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$saveEventAsyncAction =
      AsyncAction('_CreateSplitController.saveEvent');

  @override
  Future<void> saveEvent() {
    return _$saveEventAsyncAction.run(() => super.saveEvent());
  }

  final _$_CreateSplitControllerActionController =
      ActionController(name: '_CreateSplitController');

  @override
  void nextPage() {
    final _$actionInfo = _$_CreateSplitControllerActionController.startAction(
        name: '_CreateSplitController.nextPage');
    try {
      return super.nextPage();
    } finally {
      _$_CreateSplitControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChanged(
      {String? name, List<ItemModel>? items, List<FriendModel>? friends}) {
    final _$actionInfo = _$_CreateSplitControllerActionController.startAction(
        name: '_CreateSplitController.onChanged');
    try {
      return super.onChanged(name: name, items: items, friends: friends);
    } finally {
      _$_CreateSplitControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage},
event: ${event},
status: ${status},
enableNavigateButton: ${enableNavigateButton}
    ''';
  }
}

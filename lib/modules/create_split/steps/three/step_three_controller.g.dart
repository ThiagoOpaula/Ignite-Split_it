// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_three_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StepThrreController on _StepThrreControllerBase, Store {
  Computed<bool>? _$ShowButtonComputed;

  @override
  bool get ShowButton =>
      (_$ShowButtonComputed ??= Computed<bool>(() => super.ShowButton,
              name: '_StepThrreControllerBase.ShowButton'))
          .value;
  Computed<int>? _$currentIndexComputed;

  @override
  int get currentIndex =>
      (_$currentIndexComputed ??= Computed<int>(() => super.currentIndex,
              name: '_StepThrreControllerBase.currentIndex'))
          .value;

  final _$itemsAtom = Atom(name: '_StepThrreControllerBase.items');

  @override
  ObservableList<ItemModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<ItemModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$itemAtom = Atom(name: '_StepThrreControllerBase.item');

  @override
  ItemModel get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(ItemModel value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  final _$_StepThrreControllerBaseActionController =
      ActionController(name: '_StepThrreControllerBase');

  @override
  void onChanged({String? name, double? value}) {
    final _$actionInfo = _$_StepThrreControllerBaseActionController.startAction(
        name: '_StepThrreControllerBase.onChanged');
    try {
      return super.onChanged(name: name, value: value);
    } finally {
      _$_StepThrreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem() {
    final _$actionInfo = _$_StepThrreControllerBaseActionController.startAction(
        name: '_StepThrreControllerBase.addItem');
    try {
      return super.addItem();
    } finally {
      _$_StepThrreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(int index) {
    final _$actionInfo = _$_StepThrreControllerBaseActionController.startAction(
        name: '_StepThrreControllerBase.removeItem');
    try {
      return super.removeItem(index);
    } finally {
      _$_StepThrreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editItem(int index, {String? name, double? value}) {
    final _$actionInfo = _$_StepThrreControllerBaseActionController.startAction(
        name: '_StepThrreControllerBase.editItem');
    try {
      return super.editItem(index, name: name, value: value);
    } finally {
      _$_StepThrreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
item: ${item},
ShowButton: ${ShowButton},
currentIndex: ${currentIndex}
    ''';
  }
}

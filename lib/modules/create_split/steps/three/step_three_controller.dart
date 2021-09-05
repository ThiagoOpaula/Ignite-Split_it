import 'package:mobx/mobx.dart';
import 'package:split_it/shared/models/item_model.dart';
part 'step_three_controller.g.dart';

class StepThrreController = _StepThrreControllerBase with _$StepThrreController;

abstract class _StepThrreControllerBase with Store {
  @observable
  ObservableList<ItemModel> items = ObservableList.of([]);

  @observable
  ItemModel item = ItemModel();

  @computed
  bool get ShowButton => item.name.isNotEmpty && item.value > 0;

  @computed
  int get currentIndex => items.length + 1;

  @action
  void onChanged({String? name, double? value}) {
    item = item.copyWith(name: name, value: value);
  }

  @action
  void addItem() {
    items.add(item);
    item = ItemModel();
  }

  @action
  void removeItem(int index) {
    items.removeAt(index);
  }

  @action
  void editItem(int index, {String? name, double? value}) {
    items[index] = items[index].copyWith(name: name, value: value);
  }
}

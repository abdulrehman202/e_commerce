import 'dart:async';

import 'package:e_commerce/presentation/base/BaseViewModel.dart';
import 'package:e_commerce/presentation/resources/strings_manager.dart';

class Category {
  String name, imgUrl;
  Category(this.name, this.imgUrl);
}

class Item {
  String name, imgUrl, category;
  int price;
  Item(this.name, this.imgUrl, this.price, this.category);
}

class ProductsScreenViewModel extends BaseViewModel
    with ProductsScreenBaseViewModelInputs, ProductsScreenBaseViewModelOutputs {
  final StreamController _streamController = StreamController<ViewObject>();
  late List<Category> _categoryList;
  late List<Item> _allItemsList;
  int currentIndex = 0;

  @override
  start() {
    //Category list will come from database initially
    _categoryList = [
      Category('Chair', AppStrings.categoryImage),
      Category('Desk', AppStrings.categoryImage),
      Category('Sofa', AppStrings.categoryImage),
      Category('Table', AppStrings.categoryImage),
      Category('Bed', AppStrings.categoryImage),
    ];

    /**
     * For this list 2 approaches can be used:
     * First approach is to directly populate with only the selected category items
     * Second approach is to populate all the items at once (as done here)
     */
    _allItemsList = [
      Item('Office Chair', AppStrings.img1, 500, 'Chair'),
      Item('Hanging Chair', AppStrings.img1, 500, 'Chair'),
      Item('Dinning Chair', AppStrings.img1, 500, 'Chair'),
      Item('Wooden Desk 2 Drawer', AppStrings.img1, 500, 'Desk'),
      Item('Wooden Desk 3 Drawer', AppStrings.img1, 500, 'Desk'),
      Item('Laptop Stand', AppStrings.img1, 500, 'Desk'),
    ];

    _postDataToView();
  }

  @override
  dispose() {
    _streamController.close();
  }

  @override
  void onCategoryChange(index) {
    currentIndex = index;
    _postDataToView();
  }

  @override
  // TODO: implement inputViewObject
  Sink get inputViewObject => _streamController.sink;

  @override
  // TODO: implement outputViewObject
  Stream<ViewObject> get outputViewObject =>
      _streamController.stream.map((viewObject) => viewObject);

  void _postDataToView() {
    inputViewObject.add(ViewObject(
        _categoryList,
        _allItemsList
            .where((element) =>
                element.category == _categoryList.elementAt(currentIndex).name)
            .toList(),
        currentIndex));
  }
}

abstract class ProductsScreenBaseViewModelInputs {
  void onCategoryChange(index);

  Sink get inputViewObject;
}

abstract class ProductsScreenBaseViewModelOutputs {
  Stream<ViewObject> get outputViewObject;
}

class ViewObject {
  late List<Category> categoryList;
  late List<Item> itemsList;
  late int selectedCategoryIndex;

  ViewObject(this.categoryList, this.itemsList, this.selectedCategoryIndex);
}

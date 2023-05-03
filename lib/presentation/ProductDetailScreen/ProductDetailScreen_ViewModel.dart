import 'dart:async';
import 'dart:ui';

import 'package:e_commerce/presentation/base/BaseViewModel.dart';
import 'package:e_commerce/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class Item {
  String img, name, description;
  int price;
  List<Color> colors = [
    Colors.blue,
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.pink,
  ];

  Item(this.img, this.name, this.description, this.price);
}

class ProductDetailScreenViewModel extends BaseViewModel
    with
        ProductDetailScreenBaseViewModelInputs,
        ProductDetailScreenBaseViewModelOutputs {
  final StreamController _streamController = StreamController<ViewObject>();
  int _selectedColorIndex = -1;

  @override
  start() {
    _postDataToView();
  }

  @override
  dispose() {
    _streamController.close();
  }

  @override
  // TODO: implement inputViewObject
  Sink get inputViewObject => _streamController.sink;

  @override
  // TODO: implement outputViewObject
  Stream<ViewObject> get outputViewObject =>
      _streamController.stream.map((viewObject) => viewObject);

  onColorChange(int index) {
    _selectedColorIndex = index;
    _postDataToView();
  }

  void _postDataToView() {
    inputViewObject.add(ViewObject(
        Item(AppStrings.img1, 'Chair', AppStrings.description, 1000),
        _selectedColorIndex));
  }
}

abstract class ProductDetailScreenBaseViewModelInputs {
  Sink get inputViewObject;
}

abstract class ProductDetailScreenBaseViewModelOutputs {
  Stream<ViewObject> get outputViewObject;
}

class ViewObject {
  late Item item;
  late int selectedColorIndex;

  ViewObject(this.item, this.selectedColorIndex);
}

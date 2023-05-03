import 'dart:async';
import 'dart:ui';

import 'package:e_commerce/presentation/base/BaseViewModel.dart';
import 'package:e_commerce/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class CartItem {
  String img, name, color;
  int quantity;
  double price;

  CartItem(this.img, this.name, this.color, this.quantity, this.price);
}

class Invoice {
  final List<CartItem> cartItems = [
    CartItem(AppStrings.img1, 'Hanging Chair', 'blue', 3, 200.0),
    CartItem(AppStrings.img1, 'Hanging Chair', 'blue', 3, 200.0),
    CartItem(AppStrings.img1, 'Hanging Chair', 'blue', 3, 200.0),
    CartItem(AppStrings.img1, 'Hanging Chair', 'blue', 3, 200.0),
    CartItem(AppStrings.img1, 'Hanging Chair', 'blue', 3, 200.0),
    CartItem(AppStrings.img1, 'Hanging Chair', 'blue', 3, 200.0),
    CartItem(AppStrings.img1, 'Hanging Chair', 'blue', 3, 200.0),
  ];

  double subTotal, discount = 0, total;

  Invoice(this.subTotal, this.discount, this.total);
}

class CartScreenViewModel extends BaseViewModel
    with CartScreenBaseViewModelInputs, CartScreenBaseViewModelOutputs {
  final StreamController _streamController = StreamController<ViewObject>();

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

  void _postDataToView() {
    inputViewObject.add(ViewObject(Invoice(1299, 0, 1299)));
  }
}

abstract class CartScreenBaseViewModelInputs {
  Sink get inputViewObject;
}

abstract class CartScreenBaseViewModelOutputs {
  Stream<ViewObject> get outputViewObject;
}

class ViewObject {
  Invoice invoice;
  ViewObject(this.invoice);
}

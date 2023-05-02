import 'dart:async';

import 'package:e_commerce/presentation/base/BaseViewModel.dart';

class SplashViewModel extends BaseViewModel
    with SplasBaseViewModelInputs, SplasBaseViewModelOutputs {
  final StreamController _streamController = StreamController<ViewObject>();

  @override
  dispose() {
    _streamController.close();
  }

  @override
  start() {
    _postDataToView();
  }

  @override
  bool validateCredentials(email, password) {
    return true;
    // TODO: implement validateCredentials
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
      'https://img.freepik.com/free-photo/loft-home-office-interior-design_53876-143117.jpg?w=740&t=st=1679565431~exp=1679566031~hmac=c9a4494b52979e0cb71d88ac49de9c21770f6f3fec17e11a578c4d46feadb5ba',
    ));
  }
}

abstract class SplasBaseViewModelInputs {
  void validateCredentials(email, password);

  Sink get inputViewObject;
}

abstract class SplasBaseViewModelOutputs {
  Stream<ViewObject> get outputViewObject;
}

class ViewObject {
  late String imgUrl;

  ViewObject(this.imgUrl);
}

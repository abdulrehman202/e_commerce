import 'package:flutter/cupertino.dart';
import 'package:e_commerce/presentation/resources/font_manager.dart';

TextStyle _getTextSTyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color);
}

//regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextSTyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.regular, color);
}

//light style
TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextSTyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.light, color);
}

//bold style
TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextSTyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}

//semi-bold style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextSTyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.semiBold, color);
}

TextStyle getMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextSTyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

extension BuildContextX on BuildContext {
  bool get isFormValid => FormBuilder.of(this)?.validate() == true;
  bool isFormFieldValid(String fieldName) =>
      FormBuilder.of(this)?.fields[fieldName]?.validate() == true;
}

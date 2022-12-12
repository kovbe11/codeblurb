import 'package:codeblurb/generated/l10n.dart';
import 'package:codeblurb/presentation/extensions/build_context_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

typedef Validator<T> = String? Function(T? value);

abstract class Validators {
  static void onFocusChanged(
    BuildContext context,
    bool isFocused,
    String fieldName,
  ) {
    if (isFocused) {
      final field = FormBuilder.of(context)?.fields[fieldName];
      final value = field?.value;
      field
        ?..reset()
        ..didChange(value);
    } else {
      context.isFormFieldValid(fieldName);
    }
  }

  static final Validator required = FormBuilderValidators.required(
    errorText: S.current.validationRequired,
  );
  static final Validator<String> email = FormBuilderValidators.compose(
    [
      required,
      FormBuilderValidators.email(errorText: S.current.validationEmail),
    ],
  );

  static final password = FormBuilderValidators.compose(
    [
      required,
      FormBuilderValidators.minLength(8,
          errorText: S.current.validationPasswordLength),
    ],
  );

  static Validator confirmPassword(String value) {
    return FormBuilderValidators.compose(
      [
        required,
        password,
        FormBuilderValidators.equal(
          value,
          errorText: S.current.validationPasswordMatch,
        )
      ],
    );
  }
}

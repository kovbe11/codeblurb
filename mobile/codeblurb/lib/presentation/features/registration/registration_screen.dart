import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:codeblurb/presentation/extensions/async_value_ui.dart';
import 'package:codeblurb/presentation/features/registration/notifier/registration_notifier_provider.dart';
import 'package:codeblurb/presentation/utils/validators.dart';
import 'package:codeblurb/presentation/widgets/entry_form_wrapper.dart';
import 'package:codeblurb/presentation/widgets/input_field.dart';
import 'package:codeblurb/presentation/widgets/primary_button.dart';
import 'package:codeblurb/presentation/widgets/secondary_button.dart';
import 'package:codeblurb/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../generated/l10n.dart';

part 'components/registration_form.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const EntryFormWrapper(form: _RegistrationForm());
  }
}

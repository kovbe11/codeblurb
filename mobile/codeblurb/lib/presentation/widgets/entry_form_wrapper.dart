import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EntryFormWrapper extends StatelessWidget {
  const EntryFormWrapper({super.key, required this.form});

  final Widget form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: FocusTraversalGroup(
              child: FormBuilder(child: form),
            ),
          ),
        ),
      ),
    );
  }
}

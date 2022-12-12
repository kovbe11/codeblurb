// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hu locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'hu';

  static String m0(percentage) => "${percentage}% completed";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "completed": MessageLookupByLibrary.simpleMessage("completed"),
        "createAccount":
            MessageLookupByLibrary.simpleMessage("Create An Account"),
        "hide": MessageLookupByLibrary.simpleMessage("hide"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "percentageComplete": m0,
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "show": MessageLookupByLibrary.simpleMessage("show"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "validationEmail": MessageLookupByLibrary.simpleMessage(
            "This field requires a valid email address"),
        "validationPasswordLength": MessageLookupByLibrary.simpleMessage(
            "Password length must be at least 8 characters long"),
        "validationPasswordMatch":
            MessageLookupByLibrary.simpleMessage("Passwords must match"),
        "validationRequired":
            MessageLookupByLibrary.simpleMessage("This field cannot be empty"),
        "welcomeMessage":
            MessageLookupByLibrary.simpleMessage("Welcome to CodeBlurb!")
      };
}

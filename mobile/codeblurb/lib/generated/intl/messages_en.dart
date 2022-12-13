// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(challengeCount, videoCount) =>
      "${challengeCount} challenges · ${videoCount} videos";

  static String m1(percentageOff, daysCount) =>
      "${percentageOff} off - ${daysCount} left at this price";

  static String m2(date) => "Last updated ${date}";

  static String m3(percentage) => "${percentage}% completed";

  static String m4(count) => "out of ${count} ratings";

  static String m5(count) => "${count} students total";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "buyNow": MessageLookupByLibrary.simpleMessage("Buy now"),
        "coding": MessageLookupByLibrary.simpleMessage("Coding"),
        "completed": MessageLookupByLibrary.simpleMessage("completed"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm Password"),
        "createAccount":
            MessageLookupByLibrary.simpleMessage("Create An Account"),
        "createdBy": MessageLookupByLibrary.simpleMessage("Created by"),
        "curriculum": MessageLookupByLibrary.simpleMessage("Curriculum"),
        "curriculumContent": m0,
        "deal": m1,
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "enterCredentials":
            MessageLookupByLibrary.simpleMessage("Enter Your Credentials"),
        "german": MessageLookupByLibrary.simpleMessage("German"),
        "hide": MessageLookupByLibrary.simpleMessage("hide"),
        "hungarian": MessageLookupByLibrary.simpleMessage("Hungarian"),
        "lastUpdated": m2,
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "percentageComplete": m3,
        "quiz": MessageLookupByLibrary.simpleMessage("Quiz"),
        "ratingsCount": m4,
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "show": MessageLookupByLibrary.simpleMessage("show"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "startChallenge":
            MessageLookupByLibrary.simpleMessage("Start the challenge"),
        "studentsCount": m5,
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "validationEmail": MessageLookupByLibrary.simpleMessage(
            "This field requires a valid email address"),
        "validationPasswordLength": MessageLookupByLibrary.simpleMessage(
            "Password length must be at least 8 characters long"),
        "validationPasswordMatch":
            MessageLookupByLibrary.simpleMessage("Passwords must match"),
        "validationRequired":
            MessageLookupByLibrary.simpleMessage("This field cannot be empty"),
        "video": MessageLookupByLibrary.simpleMessage("Video"),
        "welcomeMessage":
            MessageLookupByLibrary.simpleMessage("Welcome to CodeBlurb!")
      };
}

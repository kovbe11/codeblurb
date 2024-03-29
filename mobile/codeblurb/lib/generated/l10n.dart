// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `{percentage}% completed`
  String percentageComplete(int percentage) {
    return Intl.message(
      '$percentage% completed',
      name: 'percentageComplete',
      desc: '',
      args: [percentage],
    );
  }

  /// `completed`
  String get completed {
    return Intl.message(
      'completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `show`
  String get show {
    return Intl.message(
      'show',
      name: 'show',
      desc: '',
      args: [],
    );
  }

  /// `hide`
  String get hide {
    return Intl.message(
      'hide',
      name: 'hide',
      desc: '',
      args: [],
    );
  }

  /// `This field cannot be empty`
  String get validationRequired {
    return Intl.message(
      'This field cannot be empty',
      name: 'validationRequired',
      desc: '',
      args: [],
    );
  }

  /// `This field requires a valid email address`
  String get validationEmail {
    return Intl.message(
      'This field requires a valid email address',
      name: 'validationEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password length must be at least 8 characters long`
  String get validationPasswordLength {
    return Intl.message(
      'Password length must be at least 8 characters long',
      name: 'validationPasswordLength',
      desc: '',
      args: [],
    );
  }

  /// `Passwords must match`
  String get validationPasswordMatch {
    return Intl.message(
      'Passwords must match',
      name: 'validationPasswordMatch',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to CodeBlurb!`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to CodeBlurb!',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Create An Account`
  String get createAccount {
    return Intl.message(
      'Create An Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Credentials`
  String get enterCredentials {
    return Intl.message(
      'Enter Your Credentials',
      name: 'enterCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `{count} students total`
  String studentsCount(int count) {
    return Intl.message(
      '$count students total',
      name: 'studentsCount',
      desc: '',
      args: [count],
    );
  }

  /// `out of {count} ratings`
  String ratingsCount(int count) {
    return Intl.message(
      'out of $count ratings',
      name: 'ratingsCount',
      desc: '',
      args: [count],
    );
  }

  /// `Created by`
  String get createdBy {
    return Intl.message(
      'Created by',
      name: 'createdBy',
      desc: '',
      args: [],
    );
  }

  /// `Last updated {date}`
  String lastUpdated(String date) {
    return Intl.message(
      'Last updated $date',
      name: 'lastUpdated',
      desc: '',
      args: [date],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `German`
  String get german {
    return Intl.message(
      'German',
      name: 'german',
      desc: '',
      args: [],
    );
  }

  /// `Hungarian`
  String get hungarian {
    return Intl.message(
      'Hungarian',
      name: 'hungarian',
      desc: '',
      args: [],
    );
  }

  /// `Buy now`
  String get buyNow {
    return Intl.message(
      'Buy now',
      name: 'buyNow',
      desc: '',
      args: [],
    );
  }

  /// `{percentageOff} off - {daysCount} left at this price`
  String deal(int percentageOff, int daysCount) {
    return Intl.message(
      '$percentageOff off - $daysCount left at this price',
      name: 'deal',
      desc: '',
      args: [percentageOff, daysCount],
    );
  }

  /// `Curriculum`
  String get curriculum {
    return Intl.message(
      'Curriculum',
      name: 'curriculum',
      desc: '',
      args: [],
    );
  }

  /// `Video`
  String get video {
    return Intl.message(
      'Video',
      name: 'video',
      desc: '',
      args: [],
    );
  }

  /// `Coding`
  String get coding {
    return Intl.message(
      'Coding',
      name: 'coding',
      desc: '',
      args: [],
    );
  }

  /// `Quiz`
  String get quiz {
    return Intl.message(
      'Quiz',
      name: 'quiz',
      desc: '',
      args: [],
    );
  }

  /// `{challengeCount} challenges · {videoCount} videos`
  String curriculumContent(int challengeCount, int videoCount) {
    return Intl.message(
      '$challengeCount challenges · $videoCount videos',
      name: 'curriculumContent',
      desc: '',
      args: [challengeCount, videoCount],
    );
  }

  /// `Start the challenge`
  String get startChallenge {
    return Intl.message(
      'Start the challenge',
      name: 'startChallenge',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'hu'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

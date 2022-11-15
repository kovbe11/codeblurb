// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_content_bundles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyContentBundlesResponse _$MyContentBundlesResponseFromJson(
        Map<String, dynamic> json) =>
    MyContentBundlesResponse(
      (json['contentBundles'] as List<dynamic>)
          .map((e) => ContentBundleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

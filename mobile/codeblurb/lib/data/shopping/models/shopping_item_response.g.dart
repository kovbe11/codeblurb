// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_item_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingItemResponse _$ShoppingItemResponseFromJson(
        Map<String, dynamic> json) =>
    ShoppingItemResponse(
      json['id'] as int,
      json['title'] as String,
      (json['price'] as num).toDouble(),
      MinimalContentBundleResponse.fromJson(
          json['contentBundle'] as Map<String, dynamic>),
    );

import 'package:bloc_prac/data/network/base_api_service.dart';
import 'package:bloc_prac/data/network/network_api_service.dart';
import 'package:bloc_prac/models/post_model.dart';
import 'package:flutter/material.dart';

class PostRepository {
  final BaseApiService _baseApiService = NetworkApiService();

  Future<List<PostModel>?> fetchPosts(String url) async {
    try {
      dynamic response = await _baseApiService.getGetApiResponse(url);
      final body = response as List;
      return body.map<PostModel>((json) {
        return PostModel.fromJson(json);
      }).toList();
    } catch (e) {
      debugPrint('Post Repository Error: $e');
      rethrow;
    }
  }
}

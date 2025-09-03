import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/model/labtob.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://dummyjson.com/",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  Future<List<Recipe>> getRecipes() async {
    try {
      final response = await _dio.get("recipes");

      if (response.statusCode == 200) {
        List recipesJson = response.data['recipes'];
        return recipesJson.map((e) => Recipe.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load recipes");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  final Dio _dioAuth = Dio(BaseOptions(baseUrl: "https://dummyjson.com/"));

  Future<List<dynamic>> getUsers() async {
    try {
      final response = await _dioAuth.get("users");
      if (response.statusCode == 200) {
        return response.data['users'];
      } else {
        throw Exception("Failed to fetch users");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        throw Exception("Server error: ${e.response?.data}");
      } else {
        throw Exception("Connection error: ${e.message}");
      }
    }
  }

  // API Register مع Base64 Image
  final Dio _dioRegester = Dio(
    BaseOptions(
      baseUrl: "https://elwekala.onrender.com",
    ),
  );

  Future<Map<String, dynamic>> regesterUser({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String gender,
    required String nationalId,
    required File profileImage,
  }) async {
    try {
      
      final bytes = await profileImage.readAsBytes();
      final base64Image = base64Encode(bytes);
      final ext = profileImage.path.split('.').last;

      final data = {
        "email": email,
        "password": password,
        "name": name,
        "phone": phone,
        "gender": gender,
        "nationalId": nationalId,
        "profileImage": "data:image/$ext;base64,$base64Image",
      };

      final response = await _dioRegester.post("/user/register", data: data);

      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        throw Exception("Server error: ${e.response?.data}");
      } else {
        throw Exception("Connection error: ${e.message}");
      }
    } catch (e) {
      throw Exception("Register failed : $e");
    }
  }
}

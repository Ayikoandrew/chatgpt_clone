import 'dart:convert';

import 'package:chatgpt_clone/core/constants/app_constants.dart';
import 'package:chatgpt_clone/core/failure/app_failure.dart';
import 'package:chatgpt_clone/feature/auth/model/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class AuthRemoteRepository {
  Future<Either<AppFailure, UserModel>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConstants.url}/signup'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            "name": name,
            "email": email,
            "password": password,
          },
        ),
      );

      final res = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        return Left(AppFailure(response.body));
      }
      return Right(UserModel.fromMap(res));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }

  Future<Either<AppFailure, UserModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('${AppConstants.url}/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
          {
            'email': email,
            'password': password,
          },
        ),
      );

      final res = jsonDecode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 202) {
        return Left(AppFailure(response.body));
      }
      return Right(UserModel.fromMap(res));
    } catch (e) {
      return Left(AppFailure(e.toString()));
    }
  }
}

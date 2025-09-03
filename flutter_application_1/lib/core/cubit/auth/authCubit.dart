import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/api/servecs/apiServes.dart';
import 'authState.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiService apiService;
  AuthCubit(this.apiService) : super(LoginInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final users = await apiService.getUsers();

      final user = users.cast<Map<String, dynamic>>().firstWhere(
            (u) => u['email'] == email && u['password'] == password,
            orElse: () => {},
          );

      if (user.isNotEmpty) {
        emit(LoginSuccess(user));
      } else {
        emit(LoginFailure("Invalid email or password"));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required String phone,
    required String gender,
    required String nationalId,
    required File profileImage,
  }) async {
    emit(RegisterLoading());
    try {
      final data = await apiService.regesterUser(
        email: email,
        password: password,
        name: name,
        phone: phone,
        gender: gender,
        nationalId: nationalId, 
        profileImage: profileImage,
      );

      print(" Register Response: $data");

      if (data["status"] == "success") {
        emit(RegisterSuccess(data));
      } else {
        emit(RegisterFailure(data["message"] ?? "Register failed"));
      }
    } catch (e) {
      print(" Register Exception: $e");
      emit(RegisterFailure(e.toString()));
    }
  }
}

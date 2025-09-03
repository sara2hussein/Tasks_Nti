

abstract class AuthState {}


class LoginInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final Map<String, dynamic> data;
  LoginSuccess(this.data);
}

class LoginFailure extends AuthState {
  final String error;
  LoginFailure(this.error);
}

class RegisterInitial extends AuthState {}
class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final Map<String, dynamic> data;
  RegisterSuccess(this.data);
}

class RegisterFailure extends AuthState {
  final String error;
  RegisterFailure(this.error);
}

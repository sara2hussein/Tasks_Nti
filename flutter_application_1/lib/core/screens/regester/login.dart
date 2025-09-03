import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cubit/auth/authCubit.dart';
import 'package:flutter_application_1/core/cubit/auth/authState.dart';
import 'package:flutter_application_1/core/functions/myApp.dart';
import 'package:flutter_application_1/core/functions/validator.dart';
import 'package:flutter_application_1/core/screens/regester/sinup.dart';
import 'package:flutter_application_1/core/widgets/button.dart';
import 'package:flutter_application_1/core/widgets/textFeiled.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();
  bool isPassVisible = false;
  final GlobalKey<FormState> formField = GlobalKey();

  void _showSnackBar(BuildContext context, String message, bool isSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        content: Row(
          children: [
            Icon(
              isSuccess ? Icons.check_circle : Icons.error,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(message),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formField,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFeild(
                controller: email,
                hintText: "Enter your Email ",
                perfexIcon: Icons.email,
                validator: (value) => MyValidators.emailValidator(value),
              ),
              const SizedBox(height: 25),
              CustomTextFeild(
                controller: pass,
                hintText: "Enter your Password ",
                perfexIcon: Icons.lock,
                ispassword: true,
                obscureText: !isPassVisible,
                visibility: () {
                  setState(() {
                    isPassVisible = !isPassVisible;
                  });
                },
                validator: (value) => MyValidators.passwordValidator(value),
              ),
              const SizedBox(height: 50),

              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    _showSnackBar(context, "Login success", true);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const MainScreen()),
                    );
                  } else if (state is LoginFailure) {
                    _showSnackBar(context, state.error, false);
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      CustomButton(
                        text: "Login",
                        isLoading: state is LoginLoading,
                        onpres: () {
                          if (formField.currentState!.validate()) {
                            context.read<AuthCubit>().login(
                                  email: email.text,
                                  password: pass.text,
                                );
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account ? "),
                          GestureDetector(
                            onTap: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignUp(),
                                ),
                              );
                              if (result == "succes") {
                                _showSnackBar(
                                    context, "Register success", true);
                              }
                            },
                            child: const Text(
                              "Sign Up!",
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cubit/auth/authCubit.dart';
import 'package:flutter_application_1/core/cubit/auth/authState.dart';
import 'package:flutter_application_1/core/functions/myApp.dart';
import 'package:flutter_application_1/core/functions/validator.dart';
import 'package:flutter_application_1/core/widgets/button.dart';
import 'package:flutter_application_1/core/widgets/gender.dart';
import 'package:flutter_application_1/core/widgets/textFeiled.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController nationalId = TextEditingController();

  bool isPassVisible = false;
  bool isConfirmPassVisible = false;
  final GlobalKey<FormState> formKey = GlobalKey();

  File? profileImage;

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.deepOrange),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.deepOrange.withOpacity(0.3),
                    backgroundImage:
                        profileImage != null ? FileImage(profileImage!) : null,
                    child: profileImage == null
                        ? const Icon(Icons.camera_alt,
                            size: 40, color: Colors.white)
                        : null,
                  ),
                ),
                const SizedBox(height: 25),
                CustomTextFeild(
                  controller: name,
                  hintText: "Full Name",
                  perfexIcon: Icons.person,
                  validator: (value) =>
                      MyValidators.displayNamevalidator(value),
                ),
                const SizedBox(height: 20),
                CustomTextFeild(
                  controller: email,
                  hintText: "Email",
                  perfexIcon: Icons.email,
                  validator: (value) => MyValidators.emailValidator(value),
                ),
                const SizedBox(height: 20),
                CustomTextFeild(
                  controller: phone,
                  hintText: "Phone Number",
                  perfexIcon: Icons.phone,
                  validator: (value) => MyValidators.phoneValidator(value),
                ),
                const SizedBox(height: 20),
                CustomTextFeild(
                  controller: nationalId,
                  hintText: "National ID",
                  perfexIcon: Icons.credit_card,
                  validator: (value) =>
                      value == null || value.length != 14
                          ? "National ID must be 14 digits"
                          : null,
                ),
                const SizedBox(height: 20),
                CustomTextFeild(
                  controller: pass,
                  hintText: "Password",
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
                const SizedBox(height: 20),
                CustomTextFeild(
                  controller: confirmPass,
                  hintText: "Confirm Password",
                  perfexIcon: Icons.lock,
                  ispassword: true,
                  obscureText: !isConfirmPassVisible,
                  visibility: () {
                    setState(() {
                      isConfirmPassVisible = !isConfirmPassVisible;
                    });
                  },
                  validator: (value) =>
                      MyValidators.repeatPasswordValidator(
                          value: value, password: pass.text),
                ),
                const SizedBox(height: 20),
                GenderSelection(genderController: genderController),
                const SizedBox(height: 30),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Register success"),
                          backgroundColor: Colors.green,
                        ),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const MainScreen(),
                        ),
                      );
                    } else if (state is RegisterFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    return CustomButton(
                      text: "Sign Up",
                      isLoading: state is RegisterLoading,
                      onpres: () {
                        if (formKey.currentState!.validate()) {
                          if (profileImage == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Please select a profile image"),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          context.read<AuthCubit>().register(
                                email: email.text,
                                password: pass.text,
                                name: name.text,
                                phone: phone.text,
                                gender: genderController.text,
                                nationalId: nationalId.text,
                                profileImage: profileImage!,
                              );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cubit/auth/authCubit.dart';
import 'package:flutter_application_1/core/cubit/auth/authState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.deepOrange,
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          Map<String, dynamic>? user;

          if (state is LoginSuccess) {
            user = state.data;
          } else if (state is RegisterSuccess) {
            user = state.data["user"] ?? state.data;
          }

          if (user == null) {
            return const Center(
              child: Text(
                "No user data available",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.deepOrange.withOpacity(0.3),
                  backgroundImage: user["profileImage"] != null
                      ? NetworkImage(user["profileImage"])
                      : null,
                  child: user["profileImage"] == null
                      ? const Icon(Icons.person,
                          size: 60, color: Colors.white)
                      : null,
                ),
                const SizedBox(height: 20),

                Text(
                  user["name"] ?? "No Name",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(height: 10),

                _buildInfoRow(Icons.email, "Email", user["email"] ?? ""),
                const Divider(),
                _buildInfoRow(Icons.phone, "Phone", user["phone"] ?? ""),
                const Divider(),
                _buildInfoRow(Icons.person, "Gender", user["gender"] ?? ""),
                const Divider(),
                _buildInfoRow(Icons.badge, "National ID", user["nationalId"] ?? ""),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepOrange),
      title: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(value.isNotEmpty ? value : "Not provided"),
    );
  }
}

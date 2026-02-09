import 'package:api_learning/Bloc/ProfileBloc/profile_state.dart';
import 'package:api_learning/data/api_client.dart';
import 'package:api_learning/data/repository.dart';
import 'package:api_learning/globall/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/ProfileBloc/profile_bloc.dart';
import '../models/models.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = AuthRepository(ApiClient());

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: FutureBuilder<ProfileModel>(
        future: repo.profile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final profile = snapshot.data!;
          return Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(profile.image ?? ""),
              ),
              const SizedBox(height: 10),
              Text(profile.firstName ?? ""),
              Text(profile.lastName ?? ""),
            ],
          );
        },
      ),
    );
  }
}

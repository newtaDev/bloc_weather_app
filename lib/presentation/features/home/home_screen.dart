import 'package:bloc_weather_app/presentation/features/home/widgets/add_new_user_layout.dart';
import 'package:bloc_weather_app/presentation/features/home/widgets/user_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_weather_app/presentation/features/home/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.read<HomeCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather app'),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => BlocProvider.value(
                    value: homeCubit,
                    child: const AddNewUserLayout(),
                  ),
                );
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20),
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              final user = state.users[index];
              return UserListTile(
                user: user,
                index: index,
              );
            },
          );
        },
      ),
    );
  }
}

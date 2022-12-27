import 'package:bloc_weather_app/presentation/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_weather_app/data/models/dto/user_model.dart';
import 'package:bloc_weather_app/presentation/features/home/cubit/home_cubit.dart';
import 'package:bloc_weather_app/shared/extensions/extentions.dart';
import 'package:bloc_weather_app/shared/validators/form_validator.dart';
import 'package:go_router/go_router.dart';

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

class UserListTile extends StatelessWidget {
  const UserListTile({
    Key? key,
    required this.user,
    required this.index,
  }) : super(key: key);

  final UserModel user;
  final int index;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final homeCubit = context.read<HomeCubit>();
    final name = '${user.firstName} ${user.lastName}';

    return Column(
      children: [
        Dismissible(
          direction: DismissDirection.endToStart,
          background: const ColoredBox(
              color: Colors.red,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              )),
          key: UniqueKey(),
          onDismissed: (direction) => homeCubit.removeUser(index),
          child: ListTile(
            onTap: () {
              context.goNamed(Routes.weatherForcastScreen.name, params: {
                'city': user.place,
              });
            },
            leading: CircleAvatar(
              backgroundColor: Colors.black12,
              child: Text(
                name.getInitials(takeUpto: 2),
                style: textTheme.titleSmall,
              ),
            ),
            title: Text(name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.email),
                Text(user.place),
              ],
            ),
          ),
        ),
        const Divider(indent: 60),
      ],
    );
  }
}

class AddNewUserLayout extends StatefulWidget {
  const AddNewUserLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNewUserLayout> createState() => _AddNewUserLayoutState();
}

class _AddNewUserLayoutState extends State<AddNewUserLayout> {
  final _formKey = GlobalKey<FormState>();
  late String firstName, lastName, email, place;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final homeCubit = context.read<HomeCubit>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Add new User',
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Enter the first name'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormValidator.requiredFieldValidator,
                onChanged: (value) => firstName = value,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Enter the last name'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormValidator.requiredFieldValidator,
                onChanged: (value) => lastName = value,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Enter email address'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormValidator.validateEmail,
                onChanged: (value) => email = value,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Enter name of the city'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormValidator.requiredFieldValidator,
                onChanged: (value) => place = value,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(55),
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (!isValidFormInput(_formKey)) {
                    return;
                  }
                  homeCubit.addUser(UserModel(firstName.trim(), lastName.trim(),
                      email.trim(), place.trim()));
                  Navigator.of(context).pop();
                },
                child: const Text('Add'),
              ),
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              )
            ],
          ),
        ),
      ),
    );
  }

  bool isValidFormInput(GlobalKey<FormState> formKey) {
    if (formKey.currentState?.validate() ?? false) {
      return true;
    }
    return false;
  }
}

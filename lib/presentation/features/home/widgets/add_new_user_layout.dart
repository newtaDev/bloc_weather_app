
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/dto/user_model.dart';
import '../../../../shared/validators/form_validator.dart';
import '../cubit/home_cubit.dart';

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

import 'package:bloc_weather_app/shared/extensions/extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../data/models/dto/user_model.dart';
import '../../../routers/routes.dart';
import '../cubit/home_cubit.dart';

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

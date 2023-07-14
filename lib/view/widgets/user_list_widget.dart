import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/user_bloc.dart';

class UserListWidget extends StatefulWidget {
  final Function(String) onUserSelected;
  const UserListWidget({super.key, required this.onUserSelected});

  @override
  State<UserListWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is UserSuccess) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: state.data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final user = state.data[index];
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      widget
                          .onUserSelected('${user.firstName} ${user.lastName}');
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar ?? ''),
                    ),
                    title: Text('${user.firstName} ${user.lastName}'),
                    subtitle: Text(user.email ?? ''),
                  ),
                  const Divider(
                    color: Colors.grey,
                  )
                ],
              );
            },
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}

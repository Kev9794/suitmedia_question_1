import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia_question_1/view/widgets/user_list_widget.dart';

import '../../bloc/user_bloc.dart';

class ThirdScreen extends StatefulWidget {
  final Function(String) onUserSelected;
  const ThirdScreen({super.key, required this.onUserSelected});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<UserBloc>().add(GetUserEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const ImageIcon(
            AssetImage('assets/images/backArrow.png'),
            color: Color(0xFF2B637B),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.grey,
            height: 0.5,
          ),
        ),
      ),
      body: UserListWidget(onUserSelected: widget.onUserSelected),
    );
  }
}

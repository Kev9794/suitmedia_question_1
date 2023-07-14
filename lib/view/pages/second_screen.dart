import 'package:flutter/material.dart';
import 'package:suitmedia_question_1/view/pages/third_screen.dart';
import 'package:suitmedia_question_1/view/widgets/form_button_widget.dart';

class SecondScreen extends StatefulWidget {
  final String nameFromFirstScreen;
  const SecondScreen({super.key, required this.nameFromFirstScreen});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedUserName = 'Selected User Name';

  void onUserSelected(String userName) {
    setState(() {
      selectedUserName = userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen',
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Welcome,',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.nameFromFirstScreen,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  selectedUserName,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FormButton(
          height: 55.0,
          label: 'Choose a User',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ThirdScreen(
                  onUserSelected: onUserSelected,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

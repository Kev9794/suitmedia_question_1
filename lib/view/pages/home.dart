import 'package:flutter/material.dart';
import 'package:suitmedia_question_1/view/pages/second_screen.dart';
import 'package:suitmedia_question_1/view/widgets/form_button_widget.dart';
import 'package:suitmedia_question_1/view/widgets/form_input_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool isError = false;
    TextEditingController name = TextEditingController();
    TextEditingController palindrome = TextEditingController();
    bool isPalindrome(String text) {
      String deletedSpaceText = text.replaceAll(' ', '').toLowerCase();
      String reversedText = deletedSpaceText.split('').reversed.join('');
      return deletedSpaceText == reversedText;
    }

    void checkPalindrome(BuildContext context) {
      String sentence = palindrome.text;
      bool palindromeCheck = isPalindrome(sentence);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(palindromeCheck ? 'Is Palindrome' : 'Not Palindrome'),
            content: Text('Your Sentence : $sentence'),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/user.png', height: 116.0),
              Container(
                padding: const EdgeInsets.fromLTRB(20.0, 55.0, 20.0, 20.0),
                child: FormInput(
                  hint: 'Name',
                  controller: name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        isError == true;
                      });
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 25.0),
                child: FormInput(
                  hint: 'Palindrome',
                  controller: palindrome,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20.0, 35.0, 20.0, 0.0),
                child: FormButton(
                  height: 55.0,
                  label: 'CHECK',
                  onPressed: () {
                    checkPalindrome(context);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: FormButton(
                  height: 55.0,
                  label: 'NEXT',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondScreen(
                            nameFromFirstScreen: name.text,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

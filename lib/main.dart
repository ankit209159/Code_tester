import 'package:code_test/color_and_theme.dart';
import 'package:flutter/material.dart';

import 'compiler_ide.dart';
import 'questions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<CodeLanguageTile> getQuestions() {
      List<CodeLanguageTile> items = [];
      for (String qus in questions) {
        items.add(CodeLanguageTile(text: qus));
      }
      return items;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AppBackgroundContainer(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 85,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: appBlack.withOpacity(0.3),
                      blurRadius: 20,
                      blurStyle: BlurStyle.outer,
                    )
                  ],
                ),
                child: Center(
                    child: Text(
                  'CODE TEST',
                  style: headingTextStyle(),
                )),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: getQuestions(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CodeLanguageTile extends StatelessWidget {
  final String text;

  const CodeLanguageTile({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Compiler(text: text);
          }));
        },
        child: AppDefaultContainer(
          width: double.infinity,
          height: 70,
          child: ClipRect(
            clipBehavior: Clip.hardEdge,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                color: appWhite,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
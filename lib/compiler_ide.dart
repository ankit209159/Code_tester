import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';

import 'color_and_theme.dart';

class Compiler extends StatefulWidget {
  final String? text;
  const Compiler({super.key, required this.text});

  @override
  State<Compiler> createState() => _CompilerState();
}

class _CompilerState extends State<Compiler> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: AppBackgroundContainer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, right: 8, left: 8),
                  width: double.infinity,
                  height: 100,
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
                    '${widget.text}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17,
                      color: appWhite,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      AppDefaultContainer(
                        h: 0,
                        v: 0,
                        child: CodeField(
                          lineNumberStyle: const LineNumberStyle(
                            textStyle: TextStyle(
                              color: bl2,
                            ),
                          ),
                          controller: CodeController(),
                          maxLines: 20,
                          cursorColor: bl2,
                          background: Colors.transparent,
                          textStyle: const TextStyle(color: appWhite),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SegmentedButtonExample(),
                      const SizedBox(height: 20),
                      const ValueContainer(text: 'Input Values :'),
                      const SizedBox(height: 20),
                      TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: dg2,
                            disabledBackgroundColor: appWhite,
                            fixedSize: const Size(150, 50),
                            foregroundColor: bl2,
                            shadowColor: dg2,
                            elevation: 5,
                            side: const BorderSide(width: 1, color: lg1),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: bl2,
                              fontSize: 15,
                            ),
                          )),
                      const SizedBox(height: 20),
                      const ValueContainer(text: 'Output Values :'),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SegmentedButtonExample extends StatefulWidget {
  const SegmentedButtonExample({super.key});
  @override
  State<SegmentedButtonExample> createState() => _SegmentedButtonExampleState();
}

enum Language { c, cPlus, java, python }

class _SegmentedButtonExampleState extends State<SegmentedButtonExample> {
  Language languageView = Language.c;
  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Language>(
      showSelectedIcon: false,
      style: SegmentedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          side: const BorderSide(width: 1, color: lg1),
          backgroundColor: dg2,
          foregroundColor: bl2,
          selectedForegroundColor: appWhite,
          selectedBackgroundColor: lg2,
          textStyle: const TextStyle(fontSize: 14)),
      segments: const <ButtonSegment<Language>>[
        ButtonSegment<Language>(
          value: Language.c,
          label: Text('C'),
        ),
        ButtonSegment<Language>(
          value: Language.cPlus,
          label: Text('C++'),
        ),
        ButtonSegment<Language>(
          value: Language.java,
          label: Text('Java'),
        ),
        ButtonSegment<Language>(
          value: Language.python,
          label: Text('Python'),
        ),
      ],
      selected: <Language>{languageView},
      onSelectionChanged: (Set<Language> newSelection) {
        setState(() {
          languageView = newSelection.first;
        });
      },
    );
  }
}

class ValueContainer extends StatelessWidget {
  final String? text;
  const ValueContainer({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$text',
          style: const TextStyle(color: bl2, fontSize: 15),
        ),
        const SizedBox(height: 5),
        AppDefaultContainer(
          height: 100,
          width: double.infinity,
          child: ListView(
            padding: const EdgeInsets.only(top: 0),
            children: const <Widget>[
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  border: InputBorder.none,
                ),
                cursorColor: bl2,
                style: TextStyle(
                  color: appWhite,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 4,
              ),
            ],
          ),
        )
      ],
    );
  }
}

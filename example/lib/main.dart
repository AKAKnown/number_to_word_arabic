import 'package:flutter/material.dart';
import 'package:number_to_words/number_to_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(NumberToWords.numberToWords(1)),
              ),
              Center(
                child: Text(NumberToWords.numberToWords(222222)),
              ),
              Center(
                child: Text(NumberToWords.numberToWords(56080)),
              ),
              Center(
                child: Text(NumberToWords.numberToWords(22222222,language: Language.EGP)),
              ),
              Center(
                child: Text(NumberToWords.numberToWords(102)),
              ),
              Center(
                child: Text(NumberToWords.numberToWords(30000)),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

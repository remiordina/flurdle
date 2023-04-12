import 'package:flutter/material.dart';

enum LetterStatus {
  wrongPlace(color: Color(0xFFFFF9C4)),
  rightPlace(color: Color.fromARGB(255, 166, 202, 168)),
  notIn(color: Color.fromARGB(255, 210, 201, 201)),
  initial();

  const LetterStatus({this.color = Colors.white});

  final Color color;
}

class LetterModel {
  LetterModel({
    required this.value,
    this.status = LetterStatus.initial,
  });

  LetterModel.rightPlace({required value})
      : this(value: value, status: LetterStatus.rightPlace);
  LetterModel.wrongPlace({required value})
      : this(value: value, status: LetterStatus.wrongPlace);
  LetterModel.notIn({required value})
      : this(value: value, status: LetterStatus.notIn);

  final String value;
  final LetterStatus status;
}

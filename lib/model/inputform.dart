import 'package:hive_flutter/adapters.dart';

part 'inputform.g.dart';

// 하이브타입 괄호 안에 있는 타입아이디 숫자는 유니크해야해.
@HiveType(typeId: 1)
class InputForm {
  InputForm({
    required this.name,
    required this.age,
  });

// 하이브필드 괄호 사이에 있는 숫자는 유니크해야해.
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;
}
import 'package:hive/hive.dart';

part 'ToDo.g.dart';

@HiveType(typeId: 0)
class ToDo {
  @HiveField(0)
   int id;
  @HiveField(1)
   int color;
  @HiveField(2)
   String todo;
  ToDo(this.id, this.color, this.todo);
}


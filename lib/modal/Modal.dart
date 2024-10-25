import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BookModal {
  String? title, author, status;
  // bool status = false;
  int? id;

  BookModal({required this.title, required this.author, required this.status});

  factory BookModal.fromJson(Map m1) {
    return BookModal(
      title: m1['title'],
      author: m1['author'],
      status: m1['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'status': status == true ? 1 : 0,
    };
  }
}

final String tableTodo = 'todo';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnDone = 'status';

// class TodoProvider {
//   Database? db;
//
//   Future open(String path) async {
//     db = await openDatabase(path, version: 1,
//         onCreate: (Database db, int version) async {
//       await db.execute('''
// create table $tableTodo (
//   $columnId integer primary key autoincrement,
//   $columnTitle text not null,
//   $columnDone integer not null)
// ''');
//     });
//   }
//
//   Future<BookModal> insert(BookModal todo) async {
//     todo.id = await db!.insert(tableTodo, todo.toMap());
//     return todo;
//   }
//
//   Future<BookModal> getTodo(int id) async {
//     List<Map> maps = await db!.query(tableTodo,
//         columns: [columnId, columnDone, columnTitle],
//         where: '$columnId = ?',
//         whereArgs: [id]);
//     if (maps.length > 0) {
//       return BookModal.fromJson(maps.first);
//     }
//     return todo;
//   }
//
//   Future<int> delete(int id) async {
//     return await db!.update(tableTodo, todo.toMap(),
//         where: '$columnId = ?', whereArgs: [todo.id]);
//   }
//
//   Future close() async => db!.close();
// }

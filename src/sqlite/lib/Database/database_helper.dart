
import 'package:path/path.dart';
import '../Models/note.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class DatabaseHelper{
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._();

  DatabaseHelper._();

  //Getter để lấy instance cua Database
  Future<Database> get database async{
    if(_database!=null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Khởi tạo database:
  // version để quản lý phiên bản database
  // onCreate sẽ được gọi khi database được tạo lần đầu
  Future<Database> _initDB() async{
    String path = join(await getDatabasesPath(), 'notes.db');
    var factory = databaseFactoryFfiWeb;
    return await factory.openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

// Tạo bảng trong database:
  Future<void> _createDB(Database db, int version) async{
    await db.execute('''
    CREATE TABLE notes(
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    createdAt TEXT NOT NULL
    ''');
  }

  //Add note
  Future<int> insertNote(Note note) async{
    final db = await database;
    return await db.insert('notes', note.toMap());
  }

  //Get all notes
  Future<List<Note>> getNotes() async{
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes', orderBy: 'createdAt DESC');
    return List.generate(maps.length, (i) => Note.fromMap(maps[i]));
  }

  //Delete note
  Future<int> deleteNote(int id) async{
    final db = await database;
    return await db.delete(
      'notes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
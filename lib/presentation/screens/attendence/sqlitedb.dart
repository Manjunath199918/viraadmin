part of 'view.dart';

class SqliteService {
  final persistentStorage = KPersistentStorage();

  Future<Database> initializeDB(String schoolCode) async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'studentsList.db'),
      onCreate: (database, version) async {
        onCreate(database, version, schoolCode);
      },
      version: 1,
    );
  }

  Future<bool> isDatabaseExists() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "studentsList.db");
    return await databaseExists(path);
  }

  Future insertData(String tableName, Map<String, dynamic> data) async {
    final UserModel? userInfo = await persistentStorage.retrieve(
        key: 'user_details',
        decoder: (val) {
          return UserModel.fromJson(jsonDecode(val));
        });
    Database db = await initializeDB(userInfo!.schoolCode);
    var tables = await db.rawQuery('SELECT * FROM $tableName ');
    try {
    if (tables.isEmpty) {

        await db.execute(
          "CREATE TABLE IF NOT EXISTS $tableName(id TEXT,crtdAt TEXT,dob TEXT,emercnct TEXT,fstname TEXT,lstname TEXT,pasWrd TEXT,schCode TEXT,schId TEXT,sclname TEXT,updtAt TEXT,bldgrp TEXT,UIN TEXT,clsId TEXT,fterName TEXT,mterName TEXT,section TEXT)",
        );

        await db.insert(tableName, data);

    } else {
      await db.insert(tableName, data);
    }
  } catch (e) {
    log('failed to insert beacuse of :$e ');
    }
  }

  Future<List<Map>> getData(String tableName,) async {
    final UserModel? userInfo = await persistentStorage.retrieve(
        key: 'user_details',
        decoder: (val) {
          return UserModel.fromJson(jsonDecode(val));
        });
    Database db = await initializeDB(userInfo!.schoolCode);
    var tables = await db.rawQuery('SELECT * FROM $tableName ');
    return tables;

  }

  onCreate(database, version, schoolCode) async {
    for (int i = 0; i < 10; i++) {
      await database.execute(
        "CREATE TABLE IF NOT EXISTS $schoolCode${Constants.classString[i]}${Constants.students}(id TEXT,crtdAt TEXT,dob TEXT,emercnct TEXT,fstname TEXT,lstname TEXT,pasWrd TEXT,schCode TEXT,schId TEXT,sclname TEXT,updtAt TEXT,bldgrp TEXT,UIN TEXT,clsId TEXT,fterName TEXT,mterName TEXT,section TEXT)",
      );
    }
  }
}

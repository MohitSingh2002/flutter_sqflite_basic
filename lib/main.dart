import 'package:flutter/material.dart';
import 'package:fluttersqflitebasic/databaseHelper/databaseHelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final dbHelper = DatabaseHelperClass.instance;

  void insertData() async {
    Map<String, dynamic> row = {
      DatabaseHelperClass.columnName : "Mohit Singh",
      DatabaseHelperClass.columnAge : 17,
    };
    final id = await dbHelper.insert(row);
    print(id);
  }

  void queryAll() async {
    var allRows = await dbHelper.queryAll();
    allRows.forEach((row) {
      print(row);
    });
  }

  void querySpecific() async {
    var allRows = await dbHelper.queryspecific(17);
    print(allRows);
  }

  void deleteSpecific() async {
    var allRows = await dbHelper.deleteSpecific(17);
    print(allRows);
  }

  void updateSpecific() async {
    var allRows = await dbHelper.updateSpecific(17);
    print(allRows);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SQFLite Database Basic',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50,),
                child: RaisedButton(
                  onPressed: insertData,
                  child: Center(
                    child: Text(
                      'Insert',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50,),
                child: RaisedButton(
                  onPressed: queryAll,
                  child: Center(
                    child: Text(
                      'Query All',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50,),
                child: RaisedButton(
                  onPressed: querySpecific,
                  child: Center(
                    child: Text(
                      'Query Specific',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50,),
                child: RaisedButton(
                  onPressed: updateSpecific,
                  child: Center(
                    child: Text(
                      'Update Specific',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50,),
                child: RaisedButton(
                  onPressed: deleteSpecific,
                  child: Center(
                    child: Text(
                      'Delete Specific',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

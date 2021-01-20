import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'T-Math',
      theme: ThemeData(
        primaryColor: Colors.blue[700],
      ),
      home: HomePage(title: 'T-Math'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Text("Hello, World!"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Back to Top',
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}

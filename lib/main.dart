import 'dart:math';

import 'package:flutter/material.dart';
bool is_square(int n){
  if (n < 0)
    return false;
  double sr = sqrt(n);
  return  (sr*sr == n);
}

bool is_triangular(int n){
  if (n < 0)
    return false;
  int sum =0;
  for(int i=0; i<n; i++)
  {sum = sum + i;
  if(sum==n)
    return true;
  }
  return false;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Shapes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Number Shapes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text='';
  int value=0;

  void onPressed() {
    setState(() {
      text = controller.text;
      value = int.parse(text);

      if (is_square(value)== true && is_triangular(value)==true) {
        _show_square_and_triangular(context);
      }
      if(is_square(value)==true && is_triangular(value)==false) {
        _show_square(context);
      }
      if(is_square(value)==false && is_triangular(value)==true) {
        _show_triangular(context);
      }
      if(is_square(value)==false && is_triangular(value)==false) {
        _show_none(context);
      }


    });
  }
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Please input a number to see if it is a square or triangular.', style: TextStyle(fontSize: 18),
            ),
            TextField(controller: controller,  keyboardType: TextInputType.numberWithOptions(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  void _show_square(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(text),
          content: new Text("Number $value is a SQUARE"),
          actions: <Widget>[
          ],
        );
      },
    );
  }
  void _show_triangular(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(text),
          content: new Text("Number $value is a TRIANGULAR"),
          actions: <Widget>[
          ],
        );
      },
    );
  }
  void _show_square_and_triangular(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(text),
          content: new Text("Number $value is a SQUARE and a TRIANGULAR."),
          actions: <Widget>[
          ],
        );
      },
    );
  }
  void _show_none(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(text),
          content: new Text("Number $value neither TRIANGULAR or SQUARE."),
          actions: <Widget>[
          ],
        );
      },
    );
  }
}





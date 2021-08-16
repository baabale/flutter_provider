import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_test/providers/data.dart';
import 'package:state_management_test/second.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DataProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DataProvider provider;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // provider = Provider.of<DataProvider>(context);
    return Consumer<DataProvider>(
      builder: (context, value, _) => Scaffold(
        appBar: AppBar(
          title: Text('Home Screen: ' + value.counter.toString()),
          actions: [
            IconButton(
              onPressed: () => value.updateCounter(90),
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times: \n ${value.counter}',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SecondScreen(),
              ),
            );
          },
          tooltip: 'Increment',
          child: Icon(Icons.forward),
        ),
      ),
    );
  }
}

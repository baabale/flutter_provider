import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/data.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late DataProvider provider;

  int mData = 0;

  void _incrementCounter() {
    provider.updateCounter(250);
    // setState(() {
    //   mData++;
    // });
  }

  // @override
  // void initState() {
  //   print('initState initiated.');
  //   mData = widget.data;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<DataProvider>(context);
    // mData = provider.counter;
    print('build method executed.');
    return Scaffold(
      appBar: AppBar(
        title: Text('SECOND - ' + provider.counter.toString()),
      ),
      body: Center(
        child: Text('DATA FROM OTHER CLASS: ${provider.counter.toString()}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

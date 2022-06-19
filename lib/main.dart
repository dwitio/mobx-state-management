import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_state_management/mobx/counter.dart';

final CounterMobx counter = CounterMobx();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPageMobx(),
    );
  }
}

class MainPageMobx extends StatelessWidget {
  const MainPageMobx({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MOBX State Management Demo'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Observer(builder: (context) => Text(counter.value.toString(), style: TextStyle(fontSize: 80),)),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(onPressed: () {
                  counter.decrement();
                }, child: Icon(Icons.arrow_downward),),
                SizedBox(width: 20,),
                FloatingActionButton(onPressed: () {
                  counter.increment();
                }, child: Icon(Icons.arrow_upward),),
              ],
            )
          ],
        ),
      ),
    );
  }
}

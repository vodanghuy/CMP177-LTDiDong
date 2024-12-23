import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget{
  CounterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _CounterScreenState();
}
class _CounterScreenState extends State<CounterScreen>
{
  // Local state
  int _counter = 0;

  void _incrementCounter(){
    // Sau moi lan setState thi man hinh se load lai
    setState(() {
      _counter++;
    });
  }

  void _descrementCounter(){
    setState(() {
      if(_counter > 0)
      {
        _counter--;
      }
    });
  }

  void _resetCounter(){
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        actions: [
          IconButton(onPressed: _resetCounter, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Current Counter', style: const TextStyle(fontSize: 20),),
            Text('$_counter', style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red
            )),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: _incrementCounter, child:
                const Icon(Icons.add)
                ),
                const SizedBox(width: 20,),
                ElevatedButton(onPressed: _descrementCounter, child:
                const Icon(Icons.remove)
                ),
              ],
            )
          ],
        ),


      ),
    );
  }
}
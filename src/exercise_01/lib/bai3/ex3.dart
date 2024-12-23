import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProvider extends ChangeNotifier{
  int _count = 0;

  int get count => _count;

  void  increment()
  {
    _count++;
    notifyListeners();
  }

  void descrement()
  {
    if(_count > 0)
      {
        _count--;
      }
    notifyListeners();
  }

  void reset()
  {
    _count = 0;
    notifyListeners();
  }
}

class CounterScreen extends StatelessWidget
{
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(builder: (context, counter, child){
      return Scaffold(
        appBar: AppBar(
          title: const Text('Counter App'),
          actions: [
            IconButton(onPressed: () => counter.reset(), icon: const Icon(Icons.refresh))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Current Counter', style: const TextStyle(fontSize: 20),),
              Text('${counter._count}', style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
              )),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () => counter.increment(), child:
                  const Icon(Icons.add)
                  ),
                  const SizedBox(width: 20,),
                  ElevatedButton(onPressed: () => counter.descrement(), child:
                  const Icon(Icons.remove)
                  ),
                ],
              )
            ],
          ),


        ),
      );
    });
  }
}

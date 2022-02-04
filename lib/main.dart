import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:satoshi_app/stopmodule.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'timer demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Basketball timer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: ChangeNotifierProvider<StopWatchModel>(
          create: (_) => StopWatchModel(),
          child: Consumer<StopWatchModel>(
            builder: (context, model, child) {
              return Column(
                children: [
                  const SizedBox(height: 100.0),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      model.stopWatchTimeDisplay,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 8),
                        child: ElevatedButton(
                          // color: Colors.redAccent,
                          child: const Text('STOP'),
                          onPressed:
                              model.isStopPressed ? null : model.stopStopWatch,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 8,
                        ),
                        child: ElevatedButton(
                          //color: Colors.green,
                          child: const Text('RESET'),
                          onPressed: model.isResetPressed
                              ? null
                              : model.resetStopWatch,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    //color: Colors.orange,
                    child: const Text('START'),
                    onPressed:
                        model.isStartPressed ? model.startStopWatch : null,
                  )
                ],
              );
            },
          ),
        ),
      ),

      /*body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100.0),
            Container(
                alignment: Alignment.center,
                child: Text(model.stopWatchiTimeDisplay,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0)))
          ],

           mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'カウンターを表示',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'STOP',
        child: Icon(Icons.stop),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

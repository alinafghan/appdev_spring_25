import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  final List<String> _data = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Mango',
    'Grape'
  ];

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                _showMyDialog();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ListView.separated(
          separatorBuilder: (context, i) => SizedBox(
                height: 8,
              ),
          itemCount:
              _data.length, //scrolldirection vertical bhi kardo agar karni ho
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.orange,
                elevation: 2,
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.arrow_drop_down_circle),
                      title: Text('Card Title One'),
                      subtitle: Text(
                        'Secondary Text',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Card Body',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6))),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      TextButton(
                          onPressed: () {}, child: const Text('action 1')),
                      TextButton(
                          onPressed: () {}, child: const Text('action 2')),
                    ]),
                    Image.network(
                        'https://images.pexels.com/photos/2325447/pexels-photo-2325447.jpeg'),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Future<void> _showMyDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

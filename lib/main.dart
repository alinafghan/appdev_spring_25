import 'package:appdev_spring_25/product_card.dart';
import 'package:appdev_spring_25/providers/character_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CharacterProvider(), child: MyApp()));
}

//barrel import parhna

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CharacterProvider>(context, listen: false).fetchCharacters();
    });
  }

  @override
  Widget build(BuildContext context) {
    final refProvider = Provider.of<CharacterProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Avatar Characters'),
          centerTitle: true,
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                if (refProvider.isLoading)
                  CircularProgressIndicator()
                else if (refProvider.characters.isNotEmpty) ...[
                  Expanded(
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: refProvider.characters.length,
                        itemBuilder: (context, i) {
                          final character = refProvider.characters[i];
                          return CharacterCard(char: character);
                        }),
                  )
                ]
              ],
            ))
        //       } else {
        //         return GridView.builder(
        //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 2,
        //               crossAxisSpacing: 10,
        //               mainAxisSpacing: 10,
        //               childAspectRatio: 0.7,
        //             ),
        //             itemCount: snapshot.data!.length,
        //             itemBuilder: (context, i) {
        //               final character = snapshot.data![i];
        //               return CharacterCard(char: character);
        //             });
        //       }
        //     })
        );
  }
}

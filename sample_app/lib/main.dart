import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_app/models/Asteroid.dart';
import 'package:sample_app/providers/astroid_provider.dart';
import 'package:sample_app/screens/asteroid_details.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<String, List<NearEarthObject>> details =
        ref.watch(asteroidsProvider) as Map<String, List<NearEarthObject>>;

    final keys = details.keys.toList();
    final values = details.values.toList();

    List<NearEarthObject> asteroidToDisplay = [];

    for (var value in values) {
      asteroidToDisplay = [...asteroidToDisplay, ...value];
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Asteroids"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView.separated(
          itemBuilder: (ctxt, index) {
            return InkWell(
              child: Text(asteroidToDisplay[index].name ?? ""),
              onTap: (){
                ref.read(asteroidIdProvider.notifier).state = asteroidToDisplay[index].id!;
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const AsteroidDetails()));
              },
              );
          },
          separatorBuilder: (_, __) => Container(
            height: 1,
            color: Colors.black,
          ),
          itemCount: asteroidToDisplay.length,
        ),
      ),
    );
  }
}

import 'package:bloc_flutter_learning/counter/counter_app.dart';
import 'package:bloc_flutter_learning/counter_bloc/view/counter_page.dart';
import 'package:bloc_flutter_learning/timer/ticker_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bloc tutorial',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: Colors.black54,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.pinkAccent),
              child: const UserAccountsDrawerHeader(
                accountName: Text('idxxbg'),
                accountEmail: Text('idxxbg@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/wallpaperflare.com_wallpaper.jpg'),
                ),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CounterApp(),
                  ),
                );
              },
              child: const ListTile(
                title: Text('Flutter Counter'),
                subtitle: Text('Cubit litter than Bloc'),
                trailing: Icon(Icons.countertops),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CounterPage(),
                  ),
                );
              },
              child: const ListTile(
                title: Text('Flutter Counter'),
                subtitle: Text('Bloc State Event'),
                trailing: Icon(Icons.add),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const TickerApp()));
              },
              child: const ListTile(
                title: Text('Flutter Timer'),
                subtitle: Text('Bloc State Event'),
                trailing: Icon(Icons.timer),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ListTile(
                title: Text('Flutter Weather'),
                trailing: Icon(Icons.nature_people),
              ),
            ),
          ],
        ),
      ),
      body: const BodyApp(),
    );
  }
}

class BodyApp extends StatelessWidget {
  const BodyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(),
    );
  }
}

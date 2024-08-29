import 'package:bloc_flutter_learning/counter/counter_app.dart';
import 'package:bloc_flutter_learning/counter_bloc/view/counter_page.dart';
import 'package:bloc_flutter_learning/timer/ticker_app.dart';
import 'package:bloc_flutter_learning/weather/weather_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:like_button/like_button.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );
}

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HapticFeedback.lightImpact();
        },
        child: LikeButton(
          animationDuration: const Duration(seconds: 1),
          circleColor: const CircleColor(start: Colors.green, end: Colors.pink),
          // bubblesColor: const BubblesColor(
          //   dotPrimaryColor: Color(0xff33b5e5),
          //   dotSecondaryColor: Color(0xff0099cc),
          // ),
          bubblesColor: const BubblesColor(
              dotPrimaryColor: Color(0xFFFFC107),
              dotSecondaryColor: Color(0xFFFF9800),
              dotThirdColor: Color(0xFFFF5722),
              dotLastColor: Color(0xFFF44336)),
          likeBuilder: (isLiked) {
            Icon(
              CupertinoIcons.sparkles,
              color: isLiked ? Colors.white70 : Colors.white10,
              size: 20,
            );
            return null;
          },
        ),
      ),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          // systemNavigationBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.transparent,
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
            const SizedBox(
              // decoration: const BoxDecoration(color: Colors.pinkAccent),
              child: UserAccountsDrawerHeader(
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
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const WeatherMain()));
              },
              child: const ListTile(
                title: Text('Flutter Weather'),
                trailing: Icon(CupertinoIcons.cloud_sun_fill),
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
    return Center(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    "assets/images/wallpaperflare.com_wallpaper.jpg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

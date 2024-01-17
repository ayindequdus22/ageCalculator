import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      theme: ThemeData(
        primaryColorDark: Colors.brown,
        // platform: PlatForm,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late num realAge = 0;
  double age = 0.0;
  var selectedYear;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showPicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(1800),
      initialDate: DateTime(2024),
      lastDate: DateTime.now(),
    ).then((dt) {
      setState(() {
        selectedYear = dt?.year;
        realAge = DateTime.now().year - selectedYear;
      });
    });
  }

  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Age Calculator',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                  ),
                ),
                child: Text(
                  selectedYear != null
                      ? selectedYear.toString()
                      : 'Select your date of birth',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              onTap: () {
                _showPicker();
              },
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                selectedYear != null
                    ? "You are $realAge years old"
                    : 'Please select your date of birth',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isTrue = !isTrue;
          });
        },
        backgroundColor: Colors.blue,
        tooltip: 'Like me',
        child: Icon(
          isTrue ? CupertinoIcons.heart_solid : CupertinoIcons.heart,
        ),
      ),
    );
  }
}

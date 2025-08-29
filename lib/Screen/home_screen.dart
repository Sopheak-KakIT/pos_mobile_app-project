import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  int currentIndex = 0;

  void decrease() {
    setState(() {
      counter--;
    });
  }

  void increase() {
    setState(() {
      counter++;
    });
  }

  void setIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.amber,
      //   actions: [
      //     IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined)),
      //     IconButton(onPressed: () {}, icon: Icon(Icons.notification_add)),
      //   ],
      // ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 1, 162, 69),
                borderRadius: BorderRadius.circular(10),
              ),

              padding: const EdgeInsets.all(20),
              child: Text(
                "$counter",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 40),
              ),
            ),

            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 63, 22, 212),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: decrease,
                    child: const Text(
                      "-",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(height: 40, width: 60),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 63, 22, 212),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: increase,
                    child: const Text(
                      "+",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

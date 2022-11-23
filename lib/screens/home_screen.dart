import 'package:flutter/material.dart';
import 'package:machine_test_app/screens/checkout_Screen.dart';
import 'package:machine_test_app/utilities/constants.dart';
import 'package:machine_test_app/utilities/widgets/home_tile.dart';


class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const CheckoutScreen())));
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.lightBlueAccent),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    child: Image.asset('images/firebase.png'),
                  ),
                  const Text(
                    'Sooraj Bhooshan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    '9544045567',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'ID',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100),
                  ),
                ],
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.logout,
                size: 30,
                color: Colors.grey,
              ),
              title: Text(logoutText,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w100,
                      color: Colors.grey)),
            )
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [HomeTile(), HomeTile()],
      ),
    );
  }
}

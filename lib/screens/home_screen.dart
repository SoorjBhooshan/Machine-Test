import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_app/controller/auth_controller.dart';
import 'package:machine_test_app/controller/food_controller.dart';
import 'package:machine_test_app/model/food_model.dart';
import 'package:machine_test_app/screens/checkout_Screen.dart';
import 'package:machine_test_app/utilities/constants.dart';
import 'package:machine_test_app/utilities/widgets/home_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryDish>? categoryDishes;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    Provider.of<FoodController>(context, listen: false).getTableMenuList();
    Provider.of<FoodController>(context, listen: false).getProductList();
  }

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
          child: Consumer<AuthController>(
              builder: (context, authController, child) {
            return ListView(
              children: [
                DrawerHeader(
                  decoration:
                      const BoxDecoration(color: Colors.lightBlueAccent),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Image.asset('images/firebase.png'),
                      ),
                      Text(
                        FirebaseAuth.instance.currentUser?.displayName == null
                            ? ''
                            : FirebaseAuth.instance.currentUser!.displayName
                                .toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        FirebaseAuth.instance.currentUser == null
                            ? ''
                            : FirebaseAuth.instance.currentUser!.phoneNumber
                                .toString(),
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'ID',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    authController.signoutUser(context: context);
                  },
                  leading: const Icon(
                    Icons.logout,
                    size: 30,
                    color: Colors.grey,
                  ),
                  title: const Text(logoutText,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                          color: Colors.grey)),
                )
              ],
            );
          }),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const HomeTile();
          },
        ));
  }
}

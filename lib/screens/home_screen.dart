import 'package:flutter/material.dart';
import 'package:machine_test_app/controller/auth_controller.dart';
import 'package:machine_test_app/controller/food_controller.dart';
import 'package:machine_test_app/screens/checkout_Screen.dart';
import 'package:machine_test_app/utilities/constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<FoodController>(context, listen: false)
        .getFoodModel()
        .then((value) {
      Provider.of<FoodController>(context, listen: false).clearAllLists();
      Provider.of<FoodController>(context, listen: false).getTabMenuList();
      Provider.of<FoodController>(context, listen: false).getProductList();
      Provider.of<FoodController>(context, listen: false).getTotalList();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<FoodController>(context, listen: true)
            .tabMenuList
            .isEmpty &&
        Provider.of<FoodController>(context, listen: true)
            .categoryDishes
            .isEmpty) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return DefaultTabController(
        length: Provider.of<FoodController>(context).tabMenuList.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            bottom: TabBar(
                isScrollable: true,
                labelPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                indicatorColor: Colors.green,
                labelStyle: const TextStyle(fontSize: 20.0),
                unselectedLabelStyle: const TextStyle(fontSize: 10.0),
                tabs: Provider.of<FoodController>(context).tabMenuList),
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
                          authController.userName,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          authController.phone,
                          style: const TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          authController.id,
                          style: const TextStyle(
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
          body: TabBarView(
            children:
                Provider.of<FoodController>(context, listen: false).totalList,
          ),
        ),
      );
    }
  }
}

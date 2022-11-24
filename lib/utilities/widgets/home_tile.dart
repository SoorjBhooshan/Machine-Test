import 'package:flutter/material.dart';
import 'package:machine_test_app/utilities/widgets/quantity_button.dart';

class HomeTile extends StatefulWidget {
  const HomeTile({Key? key}) : super(key: key);

  @override
  State<HomeTile> createState() => _HomeTileState();
}

class _HomeTileState extends State<HomeTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          ListTile(
            leading: Container(
                padding: const EdgeInsets.all(3),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.green)),
                height: 22,
                width: 22,
                child: const CircleAvatar(
                  radius: 5,
                  backgroundColor: Colors.green,
                )),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Product Name'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [Text('SAR'), Text('Callories')],
                ),
                const Text(
                    'discription gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg'),
                const QuantityButton(color: Colors.green),
                const Text('Customization Available')
              ],
            ),
            trailing: Image.asset('images/firebase.png'),
          ),
          const SizedBox(
            width: double.infinity,
            child: Divider(thickness: 1,),
          )
        ],
      ),
    );
  }
}

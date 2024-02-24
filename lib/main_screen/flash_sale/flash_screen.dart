import 'package:flutter/material.dart';

class FlashScreen extends StatelessWidget {
  const FlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.builder(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 10, // Number of items
          itemBuilder: (context, index) {
            return Container(
              color: Colors.amber, // Customize the item appearance
              alignment: Alignment.center,
              child: Text('Item $index'),
            );
          },
        )
        ,
      ),
    );
  }
}

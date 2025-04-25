import 'dart:ui'; // For BackdropFilter
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBar extends StatelessWidget {
  const HomeBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text('Home'),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Get.toNamed('/setting');
          },
          tooltip: 'Settings',
        ),
      ],
      floating: true,
      pinned: false,
      stretch: true,
      forceMaterialTransparency: true,
      // Add flexibleSpace for the blurred background effect
      flexibleSpace: FlexibleSpaceBar(
        background: SizedBox(
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 10.0, sigmaY: 10.0), // Apply blur effect
            child: Container(
                // color: Colors.grey.withOpacity(0.1), // Semi-transparent overlay
                ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(120.0),
        child: Container(
          height: 120.0,
          width: MediaQuery.of(context).size.width * .95,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(137, 175, 175, 175),
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                  offset: Offset(4, 10),
                ),
              ]),
          child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/NewScanScreen');
                // Get.to(NewScanScreen(), transition: Transition.cupertinoDialog);
              },
              child: SizedBox(
                height: 120,
                width: double.infinity,
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/imgs/brain.png',
                      height: 50,
                    ),
                    Text(
                      'New Scan',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

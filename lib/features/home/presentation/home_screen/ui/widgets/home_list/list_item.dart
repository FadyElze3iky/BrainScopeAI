import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 22),
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 150,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color:
                    const Color.fromARGB(255, 145, 145, 145).withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 4))
          ]),
      child: Row(
        spacing: 10.0,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            foregroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSW3bfcB9RpimzFiFmo9RINkTPhCKMVrK_LJw&s'),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('List Item Title',
                    style: Theme.of(context).textTheme.bodyLarge),
                Text('This is a description of the list item.',
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              // Action when button is pressed
              print('Button pressed!');
            },
            icon: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}

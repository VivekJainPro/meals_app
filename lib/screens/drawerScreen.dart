import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key, required this.toFilterScreen});
  final void Function() toFilterScreen;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(.2),
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.fastfood,
                      size: 42,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Cooking up',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 42),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.dinner_dining,
              size: 30,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            title: Text(
              'Meals',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 28,
                  ),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.filter_alt_rounded,
              size: 30,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
            title: Text(
              'Filter',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    fontSize: 28,
                  ),
            ),
            onTap: () {
              toFilterScreen();
            },
          )
        ],
      ),
    );
  }
}

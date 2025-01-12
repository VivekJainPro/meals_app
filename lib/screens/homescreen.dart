import 'package:flutter/material.dart';
import 'package:trial_app/data/dummy_data.dart';
import 'package:trial_app/models/mealsmodel.dart';
import 'package:trial_app/widgets/category_widget.dart';

import '../models/catergorey.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      upperBound: 1.0,
      lowerBound: 0.0,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (Categorey availableCategory in availableCategories)
            CategoryWidget(
                availableMeals: widget.availableMeals,
                categorey: availableCategory),
        ],
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: child,
      ),
    );
  }
}

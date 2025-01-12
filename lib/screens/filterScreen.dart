import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trial_app/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currFilter = ref.watch(FilterProvider);

    return Scaffold(
        appBar: AppBar(
          title: Text('Filter Screen'),
        ),
        body: Column(
          children: [
            SwitchListTile(
              value: currFilter[Filter.glutenFree]!,
              onChanged: (isChecked) {
                ref
                    .read(FilterProvider.notifier)
                    .setFilter(Filter.glutenFree, isChecked);
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 25),
              ),
              subtitle: Text(
                'The meal contains no gluten.',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20),
              ),
            ),
            SwitchListTile(
              value: currFilter[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                ref
                    .read(FilterProvider.notifier)
                    .setFilter(Filter.lactoseFree, isChecked);
              },
              title: Text(
                'Lactose-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 25),
              ),
              subtitle: Text(
                'Only include lactose-free meal.',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20),
              ),
            ),
            SwitchListTile(
              value: currFilter[Filter.vegetarian]!,
              onChanged: (isChecked) {
                ref
                    .read(FilterProvider.notifier)
                    .setFilter(Filter.vegetarian, isChecked);
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 25),
              ),
              subtitle: Text(
                'The meal is purely vegetarian.',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20),
              ),
            ),
            SwitchListTile(
              value: currFilter[Filter.vegan]!,
              onChanged: (isChecked) {
                ref
                    .read(FilterProvider.notifier)
                    .setFilter(Filter.vegan, isChecked);
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 25),
              ),
              subtitle: Text(
                'Vegan meals only.',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20),
              ),
            ),
          ],
        ));
  }
}

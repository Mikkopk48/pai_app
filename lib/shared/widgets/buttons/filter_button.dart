import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {
        scaffoldKey.currentState?.openDrawer();
      },
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Color(0xFF0077FF)),
      ),
      icon: const Icon(Icons.filter_list),
      label: const Text('Filtros'),
    );
  }
}

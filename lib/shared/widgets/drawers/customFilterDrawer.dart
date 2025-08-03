import 'package:flutter/material.dart';
import 'package:pai/config/theme/theme.dart';

import '../../../constants/constants.dart';

class CustomFilterDrawer extends StatefulWidget {
  const CustomFilterDrawer({super.key});

  @override
  State<CustomFilterDrawer> createState() => _CustomFilterDrawerState();
}

class _CustomFilterDrawerState extends State<CustomFilterDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFFFFFFF),
      child: Stack(
        children: [
          ListView(
            children: [
              ListTile(
                title: Text(
                  "Tipo",
                  style: Theme.of(context).textTheme.smallBoldText,
                ),
              ),
              Column(
                children:
                    timeMap.keys.map((type) => _tile(type, timeMap)).toList(),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Divider(
                  color: Color.fromARGB(255, 126, 125, 125),
                  thickness: 1,
                  height: 4,
                ),
              ),
              ListTile(
                title: Text(
                  "Nivel de Experiencia",
                  style: Theme.of(context).textTheme.smallBoldText,
                ),
              ),
              Column(
                children: experienceMap.keys
                    .map((level) => _tile(level, experienceMap))
                    .toList(),
                // experienceLevels.keys.map((level) => _tile(level)).toList(),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Divider(
                  color: Color.fromARGB(255, 126, 125, 125),
                  thickness: 1,
                  height: 4,
                ),
              ),
              ListTile(
                title: Text(
                  "Título Requerido",
                  style: Theme.of(context).textTheme.smallBoldText,
                ),
              ),
              Column(
                children: titleRequired.keys
                    .map((title) => _tile(title, titleRequired))
                    .toList(),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Divider(
                  color: Color.fromARGB(255, 126, 125, 125),
                  thickness: 1,
                  height: 4,
                ),
              ),
              ListTile(
                title: Text(
                  "Localización",
                  style: Theme.of(context).textTheme.smallBoldText,
                ),
              ),
              Column(
                children: locationsMap.keys
                    .map((place) => _tile(place, locationsMap))
                    .toList(),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Divider(
                  color: Color.fromARGB(255, 126, 125, 125),
                  thickness: 1,
                  height: 4,
                ),
              ),
              ListTile(
                title: Text(
                  "Tipo",
                  style: Theme.of(context).textTheme.smallBoldText,
                ),
              ),
              Column(
                children:
                    typeMap.keys.map((place) => _tile(place, typeMap)).toList(),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: 16,
            right: 16,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                height: 60,
                child: FilledButton.icon(
                  style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(AppColors.primary)),
                  onPressed: () {},
                  label: const Text(
                    "Buscar",
                    style: TextStyle(fontSize: 22),
                  ),
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tile(String text, Map<String, bool> sourceMap) {
    return Row(
      children: [
        Checkbox(
          value: sourceMap[text],
          onChanged: (bool? value) {
            setState(() {
              sourceMap[text] = value ?? false;
            });
          },
        ),
        Expanded(
          child: ListTile(
            title: Text(text),
          ),
        ),
      ],
    );
  }
}

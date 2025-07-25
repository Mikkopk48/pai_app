import 'package:flutter/material.dart';
import 'package:pai/shared/widgets/widgets.dart';

class FathersHomeScreen extends StatefulWidget {
  static const name = '/fathers_home_screen';

  const FathersHomeScreen({super.key});

  @override
  State<FathersHomeScreen> createState() => _FathersHomeScreenState();
}

class _FathersHomeScreenState extends State<FathersHomeScreen> {
  final Map<String, dynamic> professionalsResonse = {
    'professionals': List.generate(
      20,
      (index) => {
        'id': index + 1,
        'name': 'Profesional ${index + 1}',
        'location': 'Corrientes',
        'stars': 3.2,
        'degree': 'profesional de apoyo a la integración'
      },
    )
  };

  List<dynamic> professionalsList = [];

  @override
  void initState() {
    super.initState();
    _loadProfessionals();
  }

  Future<void> _loadProfessionals() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      professionalsList = professionalsResonse['professionals'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(text: 'Profesionales Disponibles'),
          const SearchBox(),
          Expanded(
            child: professionalsList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : SmallCard(elementsList: professionalsList),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const AiFloatingActionButton(),
      bottomNavigationBar: const CustomButtonAppBar(isFather: true),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pai/config/theme/theme.dart';
import 'package:pai/shared/widgets/alert/CustomJobOfferAlertDialog.dart';
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
    await Future.delayed(const Duration(seconds: 0));
    setState(() {
      professionalsList = professionalsResonse['professionals'];
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomFilterDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(text: 'Profesionales Disponibles'),
          const SearchBox(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                FilledButton.icon(
                  onPressed: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xFF0077FF)),
                  ),
                  icon: const Icon(Icons.menu),
                  label: const Text('Filtros'),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: FilledButton.icon(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => const CustomJobOfferAlertDialog(),
                    ),
                    style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll(Color(0xFF0077FF)),
                    ),
                    icon: const Icon(Icons.add),
                    label: const Text('Crear oferta'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: professionalsList.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ))
                  : ListView.builder(
                      itemCount: professionalsList.length,
                      itemBuilder: (context, index) {
                        final professional = professionalsList[index];
                        return SmallCard(
                          element: professional,
                          route: '/professional_detail_screen',
                        );
                      },
                    )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const AiFloatingActionButton(),
      bottomNavigationBar: const CustomButtonAppBar(isFather: true),
    );
  }
}

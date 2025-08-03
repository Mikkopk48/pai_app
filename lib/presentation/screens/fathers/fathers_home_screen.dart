import 'package:flutter/material.dart';
import 'package:pai/config/theme/app_theme.dart';
import 'package:pai/config/theme/theme.dart';
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
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
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
                    _scaffoldKey.currentState?.openDrawer();
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

class CustomJobOfferAlertDialog extends StatelessWidget {
  const CustomJobOfferAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: const Text('Datos de tu Oferta'),
      content: SingleChildScrollView(
          child: Column(
        children: [
          const CustomTextFormField(
            label: "Título de oferta:",
          ),
          const CustomTextFormField(
            label: "Localización:",
          ),
          const CustomTextFormField(
            label: "Busco:",
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText: "Descripción:",
                hintStyle: Theme.of(context).textTheme.inputTextTextStyle,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      )),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Publicar'),
        ),
      ],
    );
  }
}

class CustomFilterDrawer extends StatefulWidget {
  const CustomFilterDrawer({super.key});

  @override
  State<CustomFilterDrawer> createState() => _CustomFilterDrawerState();
}

class _CustomFilterDrawerState extends State<CustomFilterDrawer> {
  Map<String, bool> experienceLevels = {
    "Pasantía": false,
    "Inicial / Junior 0 a 2 años": false,
    "Intermedio / Semi-senior 2 a 5 años": false,
    "Avanzado / Senior 5 a 10 años": false,
    "Especialista / Experto Más de 10 años": false,
  };
  Map<String, bool> time = {
    "Tiempo Completo": false,
    "Medio Tiempo": false,
  };
  Map<String, bool> remote = {
    "Remoto": false,
    "En sitio": false,
    "Híbrido": false,
  };
  Map<String, bool> titleRequired = {
    "Maestra/o Integradora/o": false,
    "Acompañante Terapéutico (AT)": false,
    "Psicopedagogo/a": false,
    "Docente de Educación Especial": false,
    "Psicólogo/a o Psicólogo/a Social": false,
    "Fonoaudiólogo/a": false,
    "Psicomotricista": false,
    "Terapeuta Ocupacional": false,
  };
  Map<String, bool> location = {
    "Corrientes": false,
    "Buenos Aires": false,
    "Catamarca": false,
    "Chaco": false,
    "Chubut": false,
    "Córdoba": false,
    "Entre Ríos": false,
    "Formosa": false,
    "Jujuy": false,
    "La Pampa": false,
    "La Rioja": false,
    "Mendoza": false,
    "Misiones": false,
    "Neuquén": false,
    "Río Negro": false,
    "Salta": false,
    "San Juan": false,
    "San Luis": false,
    "Santa Cruz": false,
    "Santa Fe": false,
    "Santiago del Estero": false,
    "Tierra del Fuego": false,
    "Tucumán": false,
  };

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
                  "Nivel de Experiencia",
                  style: Theme.of(context).textTheme.smallBoldText,
                ),
              ),
              Column(
                children: time.keys.map((type) => _tile(type, time)).toList(),
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
                children: experienceLevels.keys
                    .map((level) => _tile(level, experienceLevels))
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
                children: location.keys
                    .map((place) => _tile(place, location))
                    .toList(),
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

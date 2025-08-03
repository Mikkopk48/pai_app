import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pai/config/theme/theme.dart';
import '../../../shared/widgets/widgets.dart';

class JobOfferDetailScreen extends StatefulWidget {
  static const name = '/job_offer_detail_screen';
  const JobOfferDetailScreen({super.key});

  @override
  State<JobOfferDetailScreen> createState() => _JobOfferDetailScreenState();
}

class _JobOfferDetailScreenState extends State<JobOfferDetailScreen> {
  final Map<String, dynamic> offerDetailResponse = {
    'profile': {
      'title': 'Titulo de Oferta de Trabajo',
      'fatherName': 'Nombre del Padre que solicita',
      'location': 'Corrientes',
      'degreeRequired': 'Profesional de apoyo a la integración',
      'description': """
 Buscamos:
Un/a profesional con formación y/o experiencia en integración escolar, psicopedagogía, terapia ocupacional, acompañamiento terapéutico o carreras afines.

 Requisitos:
Experiencia previa trabajando con niños con TEA (preferente)

Paciencia, sensibilidad y compromiso

Capacidad para trabajar en equipo con docentes y familia

Disponibilidad de lunes a viernes de 7:30 a 12:30

 Tareas a realizar:
Acompañar a mi hijo durante la jornada escolar

Brindar apoyo en rutinas escolares y momentos de socialización

Favorecer la comunicación y la regulación emocional

Coordinar con familia y equipo terapéutico

 Remuneración:
A convenir según experiencia y disponibilidad. Se ofrece pago mensual por transferencia, posibilidad de continuidad y buen clima de trabajo.
"""
    }
  };

  Map<String, dynamic>? offerData;

  @override
  void initState() {
    super.initState();
    _loadDetailData();
  }

  Future<void> _loadDetailData() async {
    await Future.delayed(const Duration(seconds: 0));
    setState(() {
      offerData = offerDetailResponse['profile'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: offerData == null
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary,))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(text: 'Oferta de Trabajo'),
                  const SizedBox(height: 16),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(offerData!['title'] ?? 'Sin título',
                              style: Theme.of(context)
                                  .textTheme
                                  .cardTitleTextStyle),
                          const SizedBox(height: 8),
                          Text(
                            'Solicitado por: ${offerData!['fatherName'] ?? 'Desconocido'}',
                            style: Theme.of(context).textTheme.smallTextStyle,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 20),
                              const SizedBox(width: 4),
                              Text(offerData!['location'] ?? 'Sin ubicación'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Requiere: ${offerData!['degreeRequired'] ?? ''}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Divider(height: 24),
                          Text(
                            offerData!['description'] ?? '',
                          ),
                          CustomBigButton(
                            text: 'Comunicarme',
                            color: AppColors.primary,
                            onPressed: () => context.push('/professional_father_chat_screen'),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const AiFloatingActionButton(),
      bottomNavigationBar: const CustomButtonAppBar(
        isFather: false,
      ),
    );
  }
}

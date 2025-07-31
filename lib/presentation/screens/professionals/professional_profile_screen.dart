import 'package:flutter/material.dart';
import 'package:pai/config/theme/theme.dart';
import '../../../shared/widgets/widgets.dart';

class ProfessionalsProfileScreen extends StatefulWidget {
  static const name = '/professionals_profile_screen';
  const ProfessionalsProfileScreen({super.key});

  @override
  State<ProfessionalsProfileScreen> createState() =>
      _ProfessionalsProfileScreenState();
}

class _ProfessionalsProfileScreenState extends State<ProfessionalsProfileScreen> {
  final Map<String, dynamic> professionalDetailResponse = {
    'profile': {
      'id': '1',
      'name': 'Nombre profesional',
      'location': 'Corrientes',
      'stars': 3.2,
      'degree': 'Profesional de apoyo a la integración',
      'lookingJob': true,
      'verified': true,
      'aboutProfessional':
          'Hola, soy psicopedagoga especializada en acompañar a niños y adolescentes en su proceso de aprendizaje, brindando herramientas emocionales y cognitivas para potenciar sus habilidades y fortalecer su desarrollo integral.',
      'degreeImage': 'url'
    }
  };

  final Map<String, dynamic> professionalReviewsResponse = {
    'reviews': List.generate(
      20,
      (index) => {
        'stars': '4.5',
        'text':
            'Me pareció que trabajar con este profesional ha sido una gran experiencia.',
        'fromWho': 'Laura Serrano',
      },
    ),
  };

  Map<String, dynamic>? professionalData;
  List<dynamic> reviewsList = [];

  @override
  void initState() {
    super.initState();
    _loadDetailData();
    _loadReviews();
  }

  Future<void> _loadDetailData() async {
    await Future.delayed(const Duration(seconds: 0));
    setState(() {
      professionalData = professionalDetailResponse['profile'];
    });
  }

  Future<void> _loadReviews() async {
    setState(() {
      reviewsList = professionalReviewsResponse['reviews'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: professionalData == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(text: 'Tu perfil'),
                  _ProfileCard(professionalData: professionalData),
                  _AboutProfessionalCard(professionalData: professionalData),
                  const CustomBigButton(text: 'Editar',color: AppColors.primary,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Opiniones',
                      style: Theme.of(context).textTheme.cardTitleTextStyle,
                    ),
                  ),
                  ...reviewsList.map(
                    (review) => ReviewCard(review: review),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const AiFloatingActionButton(),
      bottomNavigationBar: const CustomButtonAppBar(isFather: false,),
    );
  }
}

class _AboutProfessionalCard extends StatelessWidget {
  const _AboutProfessionalCard({
    required this.professionalData,
  });

  final Map<String, dynamic>? professionalData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sobre Mí',
                style: Theme.of(context).textTheme.cardTitleTextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                professionalData!['aboutProfessional'] ?? '',
              ),
              const SizedBox(height: 16),
              Text(
                'Título',
                style: Theme.of(context).textTheme.cardTitleTextStyle,
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 221, 221, 221),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.photo),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileCard extends StatefulWidget {
  const _ProfileCard({
    required this.professionalData,
  });

  final Map<String, dynamic>? professionalData;

  @override
  State<_ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<_ProfileCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Column(
                children: [
                  const Icon(Icons.account_circle, size: 60),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      Text('${widget.professionalData!['stars']}'),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.professionalData!['name'] ?? '',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(widget.professionalData!['degree'] ?? ''),
                    Row(
                      children: [
                        Text(
                          widget.professionalData!['location'],
                          style:
                              const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          widget.professionalData!['verified'] == true
                              ? 'Verificado'
                              : 'No verificado',
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        const Text('Busco trabajo'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

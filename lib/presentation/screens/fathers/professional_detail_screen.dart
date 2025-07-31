import 'package:flutter/material.dart';
import 'package:pai/config/theme/theme.dart';
import '../../../shared/widgets/widgets.dart';

class ProfessionalDetailScreen extends StatefulWidget {
  static const name = '/professional_detail_screen';
  const ProfessionalDetailScreen({super.key});

  @override
  State<ProfessionalDetailScreen> createState() =>
      _ProfessionalDetailScreenState();
}

class _ProfessionalDetailScreenState extends State<ProfessionalDetailScreen> {
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
    await Future.delayed(const Duration(seconds: 2));
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
                  const CustomAppBar(text: 'Su perfil'),
                  _ProfileCard(professionalData: professionalData),
                  _AboutProfessionalCard(professionalData: professionalData),
                  const CustomBigButton(text: 'Enviar mensaje',color: AppColors.primary,),
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
      bottomNavigationBar: const CustomButtonAppBar(isFather: true,),
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
                'Sobre el Profesional',
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

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({
    required this.professionalData,
  });

  final Map<String, dynamic>? professionalData;

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
                      Text('${professionalData!['stars']}'),
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
                      professionalData!['name'] ?? '',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(professionalData!['degree'] ?? ''),
                    Row(
                      children: [
                        Text(
                          professionalData!['location'],
                          style:
                              const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          professionalData!['verified'] == true
                              ? 'Verificado'
                              : 'No verificado',
                        ),
                      ],
                    ),
                    Text(
                      professionalData!['lookingJob'] == true
                          ? 'Busca trabajo'
                          : 'No busca trabajo',
                      style:
                          const TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: const Text('Puntuar'),
                      icon: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
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

class ReviewCard extends StatelessWidget {
  final Map<String, dynamic> review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text('${review['stars']}'),
                ],
              ),
              const SizedBox(height: 8),
              Text(review['text']),
              const SizedBox(height: 8),
              Text(
                '- ${review['fromWho']}',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

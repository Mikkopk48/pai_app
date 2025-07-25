import 'package:flutter/material.dart';
import '../../../shared/widgets/widgets.dart';

class JobOfferDetailScreen extends StatefulWidget {
  static const name = '/job_offer_detail_screen';
  const JobOfferDetailScreen({super.key});

  @override
  State<JobOfferDetailScreen> createState() =>
      _JobOfferDetailScreenState();
}

class _JobOfferDetailScreenState extends State<JobOfferDetailScreen> {
  final Map<String, dynamic> offerDetailResponse = {
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

  Map<String, dynamic>? offerData;
  List<dynamic> reviewsList = [];

  @override
  void initState() {
    super.initState();
    _loadDetailData();
  }

  Future<void> _loadDetailData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      offerData = offerDetailResponse['profile'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: offerData == null
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBar(text: 'Oferta de Trabajo'),
               
               ] ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const AiFloatingActionButton(),
        bottomNavigationBar: const CustomButtonAppBar(isFather: true,),
      ),
    );
  }
}

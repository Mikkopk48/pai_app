import 'package:flutter/material.dart';
import 'package:pai/config/theme/theme.dart';
import 'package:pai/shared/widgets/widgets.dart';

class FathersProfileScreen extends StatefulWidget {
  static const name = '/fathers_profile_screen';
  const FathersProfileScreen({super.key});

  @override
  State<FathersProfileScreen> createState() => _FathersProfileScreenState();
}

class _FathersProfileScreenState extends State<FathersProfileScreen> {
  final Map<String, dynamic> fatherProfileResponse = {
    'profile': {
      'name': 'Nombre de padre',
      'conditionChild': 'Autismo',
      'stars': 4.2,
    }
  };

  final Map<String, dynamic> fatherReviewsResponse = {
    'reviews': List.generate(
      20,
      (index) => {
        'stars': '5.0',
        'text':
            'Me pareció que trabajar con los padres de este chico ha sido una gran experiencia. Muy comprensivos y colaborativos.',
        'fromWho': 'Laura Serrano',
      },
    ),
  };

  Map<String, dynamic>? profileData;
  List<dynamic> reviewsList = [];

  @override
  void initState() {
    super.initState();
    _loadProfileData();
    _loadReviews();
  }

  Future<void> _loadProfileData() async {
    await Future.delayed(const Duration(seconds: 0));
    setState(() {
      profileData = fatherProfileResponse['profile'];
    });
  }

  Future<void> _loadReviews() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      reviewsList = fatherReviewsResponse['reviews'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profileData == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileCard(
                    profileData: profileData!,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Opiniones',
                      style: Theme.of(context).textTheme.cardTitleTextStyle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (reviewsList.isEmpty)
                    const Center(child: CircularProgressIndicator())
                  else
                    ...reviewsList.map((review) => ReviewCard(review: review)),
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

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.profileData,
  });

  final Map<String, dynamic> profileData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(text: 'Tu Perfil'),
        CustomCard(
          child: Row(
            children: [
              const Icon(
                Icons.account_circle_rounded,
                size: 80,
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profileData['name'],
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Condición/es de su hijo: ${profileData['conditionChild']}',
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber),
                      Text('${profileData['stars']}'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

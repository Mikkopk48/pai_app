import 'package:flutter/material.dart';
import 'package:pai/shared/widgets/widgets.dart';

class ProfessionalsHomeScreen extends StatefulWidget {
  static const name = '/professionals_home_screen';

  const ProfessionalsHomeScreen({super.key});

  @override
  State<ProfessionalsHomeScreen> createState() => _ProfessionalsHomeScreenState();
}

class _ProfessionalsHomeScreenState extends State<ProfessionalsHomeScreen> {
  final Map<String, dynamic> offersResonse = {
    'offer': List.generate(
        20,
        (index) => {
              'id': index + 1,
              'name': 'Título de Oferta',
              'location': 'Corrientes',
              'requiredDegree': 'profesional de apoyo a la integación'
            })
  };

  List<dynamic> offersList = [];

  @override
  void initState() {
    super.initState();
    _loadOffers();
  }

  Future<void> _loadOffers() async {
    Future.delayed(const Duration(seconds: 2));
    setState(() {
      offersList = offersResonse['offer'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(text: 'Ofertas Disponibles'),
            const SearchBox(),
            Expanded(
              child: offersList.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : OffersList(offersList: offersList),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const AiFloatingActionButton(),
        bottomNavigationBar: const CustomButtonAppBar(
          isFather: false,
        ),
      ),
    );
  }
}

class OffersList extends StatelessWidget {
  const OffersList({
    super.key,
    required this.offersList,
  });

  final List offersList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: offersList.length,
        itemBuilder: (context, index) {
          final offer = offersList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 20.0,top: 17),
                    child: CircleAvatar(child: Icon(Icons.person)),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          offer['name'],
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              offer['location'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            // You can add more fields here if needed
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(offer['requiredDegree']),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
  }
}

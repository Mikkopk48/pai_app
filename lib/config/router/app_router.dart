import 'package:go_router/go_router.dart';
import 'package:pai/presentation/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: StartScreen.name,
      builder: (context, state) => const StartScreen(),
    ),
    GoRoute(
      path: '/login_screen',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register_screen',
      name: RegisterScreen.name,
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/reset_screen',
      name: ResetScreen.name,
      builder: (context, state) => const ResetScreen(),
    ),
    GoRoute(
      path: '/new_password_screen',
      name: NewPasswordScreen.name,
      builder: (context, state) => const NewPasswordScreen(),
    ),
    GoRoute(
      path: '/user_selection_screen',
      name: UserSelectionScreen.name,
      builder: (context, state) => const UserSelectionScreen(),
    ),
    GoRoute(
      path: '/fathers_child_data1',
      name: FathersChildData1Screen.name,
      builder: (context, state) => const FathersChildData1Screen(),
    ),
    GoRoute(
      path: '/fathers_child_data2',
      name: FathersChildData2Screen.name,
      builder: (context, state) => const FathersChildData2Screen(),
    ),
    GoRoute(
      path: '/fathers_home_screen',
      name: FathersHomeScreen.name,
      builder: (context, state) => const FathersHomeScreen(),
    ),
    GoRoute(
      path: '/fathers_chatslist_screen',
      name: FathersChatListScreen.name,
      builder: (context, state) => const FathersChatListScreen(),
    ),
    GoRoute(
      path: '/fathers_profile_screen',
      name: FathersProfileScreen.name,
      builder: (context, state) => const FathersProfileScreen(),
    ),
    GoRoute(
      path: '/professional_detail_screen',
      name: ProfessionalDetailScreen.name,
      builder: (context, state) => const ProfessionalDetailScreen(),
    ),
    GoRoute(
      path: '/father_professional_chat_screen',
      name: 'FatherProfessionalChatScreen',
      builder: (context, state) => const FatherProfessionalChatScreen(),
    ),
    GoRoute(
      path: '/ai_chat_screen',
      name: AiChatScreen.name,
      builder: (context, state) => const AiChatScreen(),
    ),
    GoRoute(
      path: '/professionals_data1',
      name: ProfessionalsData1Screen.name,
      builder: (context, state) => const ProfessionalsData1Screen(),
    ),
    GoRoute(
      path: '/professionals_data2',
      name: ProfessionalsData2Screen.name,
      builder: (context, state) => const ProfessionalsData2Screen(),
    ),
    GoRoute(
      path: '/professionals_home_screen',
      name: ProfessionalsHomeScreen.name,
      builder: (context, state) => const ProfessionalsHomeScreen(),
    ),
    GoRoute(
      path: '/professionals_verification_screen',
      name: ProfessionalsVerificationScreen.name,
      builder: (context, state) => const ProfessionalsVerificationScreen(),
    ),
    GoRoute(
      path: '/professionals_chatslist_screen',
      name: ProfessionalsChatListScreen.name,
      builder: (context, state) => const ProfessionalsChatListScreen(),
    ),
    GoRoute(
      path: '/professional_father_chat_screen',
      name: FatherProfessionalChatScreen.name,
      builder: (context, state) => const FatherProfessionalChatScreen(),
    ),
    GoRoute(
      path: '/professionals_profile_screen',
      name: ProfessionalsProfileScreen.name,
      builder: (context, state) => const ProfessionalsProfileScreen(),
    ),
    GoRoute(
      path: '/job_offer_detail_screen',
      name: JobOfferDetailScreen.name,
      builder: (context, state) => const JobOfferDetailScreen(),
    ),
  ],
);

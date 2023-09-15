import 'package:beamer/beamer.dart';
import '../features/login/screens/login_screen.dart';
import '../features/welcome/screens/welcome_screen.dart';
import 'app_routes_name.dart';

class AppRoutesDelegate {
  final appRoutesDelegate = BeamerDelegate(
      initialPath: AppRoutesNames.loginScreen,
      locationBuilder: RoutesLocationBuilder(routes: {
        AppRoutesNames.welcomeScreen: (context, state, data) {
          return WelcomeScreen(userId: data as String);
        },
        AppRoutesNames.loginScreen: (context, state, data) {
          return const LoginScreen();
        },
      }));
}

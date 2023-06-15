import 'package:flutter/material.dart';
import 'package:izam_sherif_flutter_task/core/theme/app_theme.dart';
import 'package:sizer/sizer.dart';
import 'features/auth/presentation/views/sign_in_view/signin_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const SignInView(),
    );
    });
  }
}

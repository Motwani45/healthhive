import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gsapp/firebase_options.dart';
import 'package:gsapp/providers/firebase/auth/auth_provider.dart';
import 'package:gsapp/providers/firebase/firestore/firestore_provider.dart';
import 'package:gsapp/screens/auth/login_screen.dart';
import 'package:gsapp/screens/auth/signup_screen.dart';
import 'package:gsapp/screens/auth/welcome_screen.dart';
import 'package:gsapp/utils/color_constants.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (context){
          return AuthProvider();
        }),
        ChangeNotifierProxyProvider<AuthProvider,FirestoreProvider>(create: (context){
          return FirestoreProvider(auth: FirebaseAuth.instance);
        },
        update: (context,auth,previousFirestoreProvider){
          return FirestoreProvider(auth: auth.auth);
        },)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: ColorConstant.greenA400
        ),
        home: LoginScreen(),
      routes: {
          LoginScreen.routeName:(context){
            return LoginScreen();
          },
        SignupScreen.routeName:(context){
            return SignupScreen();
        },
        WelcomeScreen.routeName:(context){
            return WelcomeScreen();
        }
      },),
    );
  }
}


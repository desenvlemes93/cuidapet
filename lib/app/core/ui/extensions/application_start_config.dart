import 'package:cuidapet_mobile/app/core/helpers/environments.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class ApplicationStartConfig {
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _firebaseConfig();
    await _loadsEnvs();
  }

  Future<void> _firebaseConfig() async => await Firebase.initializeApp();

  Future<void> _loadsEnvs() => Environments.loadEnvs();
}
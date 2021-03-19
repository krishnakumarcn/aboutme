import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/configure_nonweb.dart'
    if (dart.library.html) 'app/configure_web.dart';

void main() {
  configureApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

import '../screen/tambah.dart';
import 'package:flutter/material.dart';
import '../widget/navigation_menu.dart';
import '../screen/beranda.dart';

class Routing {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const NavigationMenu(), // Rute awal
    '/beranda': (context) => const Beranda(),
    // '/detailItem': (context) => DetailItemPage(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const NavigationMenu());
      case '/beranda':
        return MaterialPageRoute(builder: (context) => const Beranda());
      //  case '/detailItem':
      //   return MaterialPageRoute(builder: (context) => DetailItemPage());
      case '/tambahScreen':
        return MaterialPageRoute(builder: (context) => const TambahScreen());
      //case '/editScreen':
      //  return MaterialPageRoute(builder: (context) => EditScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

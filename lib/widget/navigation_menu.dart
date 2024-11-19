import '../screen/profil.dart';
import '../screen/Beranda.dart';
import '../screen/list.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:get/get.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          // Styling
          data: NavigationBarThemeData(
            indicatorColor: Colors.white.withOpacity(0),
            backgroundColor: Colors.white,
            labelTextStyle: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF327ac9), // Warna biru untuk teks yang dipilih
                );
              }
              return const TextStyle(
                fontFamily: 'Inter',
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Color(0xFF616161), // Warna abu-abu untuk teks default
              );
            }),
            iconTheme: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(
                  color: Color(0xFF327ac9), // Warna biru untuk ikon yang dipilih
                );
              }
              return const IconThemeData(
                color: Color(0xFF616161), // Warna abu-abu untuk ikon default
              );
            }),
          ),
          //styling off

          child: NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) {
              controller.selectedIndex.value = index;
            },
            destinations: const [
              NavigationDestination(icon: Icon(Iconsax.home_2), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.menu_1), label: 'List'),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
          ),
        ),
      ),

      // Body
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const Beranda(),
    const ListScreen(),
    const Profil(),
  ];
}

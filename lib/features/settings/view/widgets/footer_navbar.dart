import 'package:e_commerce/features/settings/view/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FooterNavbar extends StatelessWidget {
  const FooterNavbar(this.navigationShell, {Key? key})
    : super(key: key ?? const ValueKey('NavigationBar'));
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        onDestinationSelected: (n) {
          navigationShell.goBranch(
            n,
            initialLocation: n == navigationShell.currentIndex,
          );
        },
        selectedIndex: navigationShell.currentIndex,
        backgroundColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        labelPadding: EdgeInsets.all(0),

        destinations: [
          NavigationDestination(
            label: '',
            tooltip: 'Home',
            icon: SvgIcon('assets/icons/home.svg', isActive: false),

            selectedIcon: SvgIcon('assets/icons/home.svg', isActive: true),
          ),
          NavigationDestination(
            label: '',
            tooltip: 'Notifications',
            icon: SvgIcon('assets/icons/notifications.svg', isActive: false),
            selectedIcon: SvgIcon(
              'assets/icons/notifications.svg',
              isActive: true,
            ),
          ),
          NavigationDestination(
            label: '',
            tooltip: 'Orders',
            icon: SvgIcon('assets/icons/orders.svg', isActive: false),
            selectedIcon: SvgIcon('assets/icons/orders.svg', isActive: true),
          ),
          NavigationDestination(
            label: '',
            tooltip: 'Settings',
            icon: SvgIcon('assets/icons/settings.svg', isActive: false),
            selectedIcon: SvgIcon('assets/icons/settings.svg', isActive: true),
          ),
        ],
      ),
    );
  }
}

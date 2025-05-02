import 'package:e_commerce/features/settings/view/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FooterNavbar extends StatelessWidget {
  const FooterNavbar(this.navigationShell, {Key? key})
    : super(key: key ?? const ValueKey('bottomNavigationBar'));
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (n) {
        navigationShell.goBranch(
          n,
          initialLocation: n == navigationShell.currentIndex,
        );
      },
      currentIndex: navigationShell.currentIndex,

      selectedFontSize: 0,
      items: [
        BottomNavigationBarItem(
          label: '',
          tooltip: 'Home',
          icon: SvgIcon('assets/icons/home.svg', isActive: false),
          activeIcon: SvgIcon('assets/icons/home.svg', isActive: true),
        ),
        BottomNavigationBarItem(
          label: '',
          tooltip: 'Notifications',
          icon: SvgIcon('assets/icons/notifications.svg', isActive: false),
          activeIcon: SvgIcon('assets/icons/notifications.svg', isActive: true),
        ),
        BottomNavigationBarItem(
          label: '',
          tooltip: 'Orders',
          icon: SvgIcon('assets/icons/orders.svg', isActive: false),
          activeIcon: SvgIcon('assets/icons/orders.svg', isActive: true),
        ),
        BottomNavigationBarItem(
          label: '',
          tooltip: 'Settings',
          icon: SvgIcon('assets/icons/settings.svg', isActive: false),
          activeIcon: SvgIcon('assets/icons/settings.svg', isActive: true),
        ),
      ],
    );
  }
}

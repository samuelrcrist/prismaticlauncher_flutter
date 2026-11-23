import 'package:material_ui/material_ui.dart';

import 'views/home.dart';
import 'views/smapi.dart';

void main() {
  runApp(const PrismaticLauncher());
}

class PrismaticLauncher extends StatelessWidget {
  const PrismaticLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prismatic Launcher',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const prismatic_home(title: 'Prismatic Launcher - Home'),
    );
  }
}

class prismatic_home extends StatefulWidget {
  const prismatic_home({super.key, required this.title});
  final String title;

  @override
  State<prismatic_home> createState() => _prismatic_homeState();
}

// fuck this stupid chungus case error
class _prismatic_homeState extends State<prismatic_home> {
  static const List<Widget> _pages = [
    PristmaticHome(),
    SMAPIpage(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            labelType: NavigationRailLabelType.none,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Text("balls"),
                label: Text("balls"),
              ),
              NavigationRailDestination(
                icon: Text("SMAPI"),
                label: Text("SMAPI")
              )
            ],
          ),
          const VerticalDivider(width: 1, thickness: 1,),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: _pages,
            )
          ),
        ],
      )
    );
  
  }
}

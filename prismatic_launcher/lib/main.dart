import 'package:material_ui/material_ui.dart';

import 'data/launch.dart';

void main() {
  runApp(const PrismaticLauncher());
}

class PrismaticLauncher extends StatelessWidget {
  const PrismaticLauncher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const prismatic_home(title: 'Flutter Demo Home Page'),
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
  int _selectedIndex = 0;
  String path = r"tmp";
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
              )
            ],
          ),
          const VerticalDivider(width: 1, thickness: 1,),
          Expanded(
            child: Scaffold(
              appBar: AppBar(title: Text("Home"),),
              body: Center(
                child: FloatingActionButton(
                  onPressed: () async {
                    try {
                      await launchGame(path);
                    } catch (e) {
                      print('failed $e');
                    }
                  },
                  child: Icon(Icons.play_arrow),
                )
              ,)
            ),
          ),
        ],
      )
    );
  
  }
}

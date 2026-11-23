import 'package:material_ui/material_ui.dart';
import 'package:prismatic_launcher/main.dart';

import '../data/launch.dart';

class PristmaticHome extends StatefulWidget {
  const PristmaticHome({ super.key });

  @override
  State<PristmaticHome> createState() => _PrismaticHomeState();
}

class _PrismaticHomeState extends State<PristmaticHome> {
  String path = r"tmp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

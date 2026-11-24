import 'package:material_ui/material_ui.dart';
import 'package:prismatic_launcher/main.dart';

import '../data/launch.dart';

class PristmaticHome extends StatefulWidget {
  const PristmaticHome({ super.key });

  @override
  State<PristmaticHome> createState() => _PrismaticHomeState();
}

class _PrismaticHomeState extends State<PristmaticHome> {
  bool isModded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
              onPressed: () async {
                try {
                  await launchGame(isModded);
                } catch (e) {
                  print('failed $e');
                }
              },
              child: Icon(Icons.play_arrow),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: isModded,
                  onChanged: (bool? newValue) {
                    setState(() {
                    isModded = newValue ?? false;
                  });
                  }
                ),
                const Text("Launch modded?"),
              ],
            )
          ]
        ,)
      )
    );
  }
}

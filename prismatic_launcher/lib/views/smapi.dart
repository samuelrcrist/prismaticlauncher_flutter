import 'dart:io';
import 'dart:convert';

import 'package:material_ui/material_ui.dart';

class SMAPIpage extends StatefulWidget {
  const SMAPIpage({ super.key });

  @override
  State<SMAPIpage> createState() => _SMAPIpageState();
}


class _SMAPIpageState extends State<SMAPIpage> {

  late final Future<String?> _SMAPIversion;
  @override
  void initState() {
    super.initState();
    _SMAPIversion = _getSMAPIVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/smapi_logo.webp'),
            width: 200,
            height: 200,
            ),
            FutureBuilder<String?>(
              future: _SMAPIversion,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done){
                  return const Text("Checking SMAPI version...");
                }
                if (snapshot.hasError) {
                  return const Text("Error reading SMAPI version.");
                }
                final version = snapshot.data;
                return Text(version != null ? 'SMAPI $version' : "SMAPI not installed!");
              }
            ,)
          ]
        ),
      ),
    );
  }
}

Future<String?> _getSMAPIVersion() async {
  if(Platform.isWindows && await Directory(winPath).exists()){
    for(final mod in ['ConsoleCommands', 'SaveBackup']) {
      final versionInModFile = File('$winPath/mods/$mod/manifest.json');
      if (!await versionInModFile.exists()) continue;

      final json = jsonDecode(await versionInModFile.readAsString()) as Map<String, dynamic>;
      return json['Version'] as String?;
    }
  }
  return null;
}


import 'dart:io';

Future<void> launchGame(String path) async {
  final gameEXE = File(path);

  Process.start(
    path,
    [],
    workingDirectory: gameEXE.parent.path);
}



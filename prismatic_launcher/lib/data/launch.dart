import 'dart:io';

String winPath = r"E:\SteamLibrary\steamapps\common\Stardew Valley";

Future<void> launchGame(bool isModded) async {
  final steam = 'steam://run/413150';
  if(Platform.isWindows) {
    if(isModded) {
      await Process.run('cmd', ['/c', 'start', '', '$winPath\\StardewModdingAPI.exe'],
      workingDirectory: winPath);
    }else{
      await Process.run('cmd', ['/c', 'start', steam]);
    }
  }
}



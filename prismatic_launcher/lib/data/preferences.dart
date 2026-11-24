import 'dart:convert';
import 'dart:io';

void initPrefs() async {
  String platformPath;
  platformPath = _setPlatformPath();

  Map<String, dynamic> prefs = {
    'gamePath' : platformPath,
  };
  String jsonString = jsonEncode(prefs);
  final file = File('preferences.json');
  await file.writeAsString(jsonString);
}


String _setPlatformPath() {
  String path;
  if (Platform.isWindows) {
    path = r"C:\Program Files (x86)\Steam\steamapps\common\Stardew Valley";
    return path;
  }
  if(Platform.isMacOS) {
    path = r"~/Library/Application Support/Steam/steamapps/common/Stardew Valley/Contents/MacOS";
    return path;
  }
  if(Platform.isLinux) {
    path = r" ~/.local/share/Steam/steamapps/common/Stardew Valley";
  }
  
  return "Not found";

}
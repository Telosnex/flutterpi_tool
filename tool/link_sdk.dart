import 'dart:io';

/// Run with the Dart executable from the Flutter SDK selected for the build.
void main() {
  final sdk =
      File(Platform.resolvedExecutable).parent.parent.parent.parent.parent;
  if (!File('${sdk.path}/packages/flutter_tools/pubspec.yaml').existsSync()) {
    throw StateError(
      'Run this script with the selected Flutter SDK’s bin/dart.',
    );
  }
  final link =
      Link.fromUri(Platform.script.resolve('../.dart_tool/flutter-sdk'));
  link.parent.createSync(recursive: true);
  if (FileSystemEntity.isLinkSync(link.path)) {
    if (link.targetSync() == sdk.path) return;
    link.deleteSync();
  }
  link.createSync(sdk.path);
}

import 'package:flutterpi_tool/src/cli/flutterpi_command.dart';
import 'package:flutterpi_tool/src/fltool/common.dart' as fl;

import 'package:flutterpi_tool/src/fltool/globals.dart' as globals;

class TestCommand extends fl.TestCommand with FlutterpiCommandMixin {
  TestCommand() : super(toolContext: globals.PiToolContext());
}

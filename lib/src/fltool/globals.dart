// ignore_for_file: implementation_imports
import 'package:flutter_tools/src/context/tool_context.dart';
import 'package:flutter_tools/src/globals.dart' as tool;
import 'package:flutter_tools/src/base/context.dart' show context;
import 'package:flutterpi_tool/src/artifacts.dart';
import 'package:flutterpi_tool/src/build_system/build_app.dart';
import 'package:flutterpi_tool/src/cache.dart';
import 'package:flutterpi_tool/src/config.dart';
import 'package:flutterpi_tool/src/devices/flutterpi_ssh/ssh_utils.dart';
import 'package:flutterpi_tool/src/fltool/common.dart' as fl;
import 'package:flutterpi_tool/src/more_os_utils.dart';

export 'package:flutter_tools/src/globals.dart';

FlutterPiToolConfig get flutterPiToolConfig =>
    context.get<FlutterPiToolConfig>()!;
FlutterpiCache get flutterpiCache => context.get<fl.Cache>()! as FlutterpiCache;

FlutterpiArtifacts get flutterpiArtifacts =>
    context.get<fl.Artifacts>()! as FlutterpiArtifacts;
MoreOperatingSystemUtils get moreOs =>
    context.get<fl.OperatingSystemUtils>()! as MoreOperatingSystemUtils;

SshUtils get sshUtils => context.get<SshUtils>()!;

AppBuilder get builder => context.get<AppBuilder>()!;

/// Resolve services lazily in the active Pi command context.
class PiToolContext implements ToolContext {
  @override
  get artifacts => tool.artifacts!;
  @override
  get botDetector => tool.botDetector;
  @override
  get cache => tool.cache;
  @override
  get config => tool.config;
  @override
  get customDevicesConfig => tool.customDevicesConfig;
  @override
  get flutterVersion => tool.flutterVersion;
  @override
  get fs => tool.fs;
  @override
  get git => tool.git;
  @override
  get localEngineLocator => tool.localEngineLocator!;
  @override
  get logger => tool.logger;
  @override
  get nativeAssetsBuilder => tool.nativeAssetsBuilder;
  @override
  get os => tool.os;
  @override
  get outputPreferences => tool.outputPreferences;
  @override
  get persistentToolState => tool.persistentToolState!;
  @override
  get platform => tool.platform;
  @override
  get preRunValidator => tool.preRunValidator;
  @override
  get processInfo => tool.processInfo;
  @override
  get processManager => tool.processManager;
  @override
  get processUtils => tool.processUtils;
  @override
  get projectFactory => tool.projectFactory;
  @override
  get shutdownHooks => tool.shutdownHooks;
  @override
  get signals => tool.signals;
  @override
  get stdio => tool.stdio;
  @override
  get systemClock => tool.systemClock;
  @override
  get terminal => tool.terminal;
  @override
  get userMessages => tool.userMessages;
  @override
  get fileSystemUtils => tool.fsUtils;
}

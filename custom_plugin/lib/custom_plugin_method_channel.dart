import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'custom_plugin_platform_interface.dart';

/// An implementation of [CustomPluginPlatform] that uses method channels.
class MethodChannelCustomPlugin extends CustomPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('custom_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

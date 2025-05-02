import 'package:flutter_test/flutter_test.dart';
import 'package:custom_plugin/custom_plugin.dart';
import 'package:custom_plugin/custom_plugin_platform_interface.dart';
import 'package:custom_plugin/custom_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCustomPluginPlatform
    with MockPlatformInterfaceMixin
    implements CustomPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CustomPluginPlatform initialPlatform = CustomPluginPlatform.instance;

  test('$MethodChannelCustomPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCustomPlugin>());
  });

  test('getPlatformVersion', () async {
    CustomPlugin customPlugin = CustomPlugin();
    MockCustomPluginPlatform fakePlatform = MockCustomPluginPlatform();
    CustomPluginPlatform.instance = fakePlatform;

    expect(await customPlugin.getPlatformVersion(), '42');
  });
}

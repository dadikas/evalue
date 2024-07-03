import 'dart:async';
import 'package:flutter/services.dart';

class ImpellerGlfwPlugin {
  static const MethodChannel _channel = MethodChannel('impeller_glfw_plugin');

  Future<void> initializeGLFW() async {
    await _channel.invokeMethod('initializeGLFW');
  }

  Future<void> createWindow() async {
    await _channel.invokeMethod('createWindow');
  }
}

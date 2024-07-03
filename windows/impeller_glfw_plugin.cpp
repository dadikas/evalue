#include "include/impeller_glfw_plugin/impeller_glfw_plugin.h"

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <GLFW/glfw3.h>

#include <memory>
#include <sstream>

namespace {

void InitializeGLFW() {
  if (!glfwInit()) {
    // Initialization failed
  }
}

void CreateWindow() {
  GLFWwindow* window = glfwCreateWindow(640, 480, "GLFW Window", NULL, NULL);
  if (!window) {
    // Window or OpenGL context creation failed
    glfwTerminate();
    return;
  }
  glfwMakeContextCurrent(window);
  while (!glfwWindowShouldClose(window)) {
    glfwPollEvents();
    // Rendering code here with Impeller
    glClear(GL_COLOR_BUFFER_BIT);
    glfwSwapBuffers(window);
  }
  glfwDestroyWindow(window);
  glfwTerminate();
}

class ImpellerGlfwPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ImpellerGlfwPlugin();

  virtual ~ImpellerGlfwPlugin();

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue>& method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

// static
void ImpellerGlfwPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar) {
  auto channel = std::make_unique<flutter::MethodChannel<flutter::EncodableValue>>(
      registrar->messenger(), "impeller_glfw_plugin",
      &flutter::StandardMethodCodec::GetInstance());

  auto plugin = std::make_unique<ImpellerGlfwPlugin>();

  channel->SetMethodCallHandler(
      [plugin_pointer = plugin.get()](const auto &call, auto result) {
        plugin_pointer->HandleMethodCall(call, std::move(result));
      });

  registrar->AddPlugin(std::move(plugin));
}

ImpellerGlfwPlugin::ImpellerGlfwPlugin() {}

ImpellerGlfwPlugin::~ImpellerGlfwPlugin() {}

void ImpellerGlfwPlugin::HandleMethodCall(
    const flutter::MethodCall<flutter::EncodableValue>& method_call,
    std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
  if (method_call.method_name().compare("initializeGLFW") == 0) {
    InitializeGLFW();
    result->Success();
  } else if (method_call.method_name().compare("createWindow") == 0) {
    CreateWindow();
    result->Success();
  } else {
    result->NotImplemented();
  }
}

}  // namespace

void ImpellerGlfwPluginRegisterWithRegistrar(
    flutter::PluginRegistrarWindows *registrar) {
  ImpellerGlfwPlugin::RegisterWithRegistrar(registrar);
}

//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
#include <dynamic_color/dynamic_color_plugin_c_api.h>
#include <isar_flutter_libs/isar_flutter_libs_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  BitsdojoWindowPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("BitsdojoWindowPlugin"));
  DynamicColorPluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("DynamicColorPluginCApi"));
  IsarFlutterLibsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("IsarFlutterLibsPlugin"));
}

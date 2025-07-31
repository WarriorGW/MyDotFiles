import QtQuick
import qs.modules.system
import qs.modules.components

ModuleDisplay {
  id: root

  StyledBarText {
    id: brightnessIcon

    // property var icons: ["󰃜", "󰃝", "󰃞", "󰃟", "󰃠"] // "󰃚", "󰃛",
    property var icons: ["󰛩", "󱩎", "󱩏", "󱩐", "󱩑", "󱩒", "󱩓", "󱩔", "󱩕", "󱩖", "󰛨"]

    property int index: Math.min(Math.floor(Brightness.brightness / (100 / icons.length)), icons.length - 1)

    text: icons[index]
  }

  StyledBarText {
    id: brightnessText

    text: Brightness.brightness + "%"
  }
}

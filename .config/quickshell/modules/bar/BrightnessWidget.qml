import QtQuick
import qs.config
import qs.modules.system

// import "root:/config/"

Text {
  id: power

  color: Theme.options.bar.mainFg
  font.family: Theme.fontFamily
  font.pixelSize: Theme.fontSize
  font.weight: Theme.fontWeight

  // property var icons: ["󰃜", "󰃝", "󰃞", "󰃟", "󰃠"] // "󰃚", "󰃛",
  property var icons: ["󰛩", "󱩎", "󱩏", "󱩐", "󱩑", "󱩒", "󱩓", "󱩔", "󱩕", "󱩖", "󰛨"]

  property int index: Math.min(Math.floor(Brightness.brightness / (100 / icons.length)), icons.length - 1)

  text: icons[index] + " " + Brightness.brightness + "%"
}

pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  readonly property string fontFamily: "JetBrains Mono Nerd Font Propo"
  readonly property int fontSize: 14
  readonly property int fontWeight: Font.Bold

  property alias options: configOptionsJsonAdapter

  // Función para simular rgba estilo CSS
  function rgba(r, g, b, a) {
    return Qt.rgba(r / 255, g / 255, b / 255, a);
  }

  JsonAdapter {
    id: configOptionsJsonAdapter

    property JsonObject bar: JsonObject {
      // General
      property int barHeight: 38
      property int pillsHeight: barHeight - 2
      property int pillsHPadding: 30
      property real barMarginTop: 0
      property real barMarginSides: 10
      property color barBg: "#00000000"
      property color mainBg: root.rgba(30, 30, 46, 0.8)
      property color mainFg: root.rgba(180, 190, 254, 1)
      property color powerFg: root.rgba(243, 139, 168, 1)
      property color dangerFg: root.rgba(255, 100, 100, 1)
      property color safeFg: root.rgba(100, 250, 100, 1)
      property color warningFg: root.rgba(255, 179, 71, 1)
      property color criticalFg: root.rgba(230, 80, 100, 1)

      // Workspace Buttons
      property real wsButtonWidth: 32
      property real wsButtonActiveWidth: 45
      property real wsButtonHeight: 26

      // Workspace Button Colors
      property color wbActBg: root.rgba(180, 190, 254, 0.9)
      property color wbActFg: root.rgba(0, 0, 0, 0.7)
      property color wbHvrBg: root.rgba(75, 75, 125, 0.4)
      property color wbHvrFg: root.rgba(174, 170, 240, 0.8)
      property color wbActHvrBg: root.rgba(180, 190, 254, 0.6)
      property color wbActHvrFg: root.rgba(0, 0, 0, 0.7)
      property color wsOcc: root.rgba(150, 150, 200, 0.2)
      property color wsEmpty: root.rgba(50, 50, 70, 0.1)

      // Shared style for modules
      property real moduleRadius: 25
      property real moduleMarginTop: 2
      property real moduleMarginH: 8
      property real modulePaddingV: 3
      property real modulePaddingH: 12
    }
  }
}

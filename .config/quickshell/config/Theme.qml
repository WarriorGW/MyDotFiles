pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  readonly property string fontFamily: "JetBrains Mono Nerd Font"
  readonly property int fontSize: 14
  readonly property int fontWeight: Font.Bold

  property alias options: configOptionsJsonAdapter

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
      property color mainBg: Qt.rgba(30 / 255, 30 / 255, 46 / 255, 0.8)
      property color mainFg: Qt.rgba(180 / 255, 190 / 255, 254 / 255, 1)

      // Workspace Buttons
      property real wsButtonWidth: 32
      property real wsButtonActiveWidth: 45
      property real wsButtonHeight: 26

      // Workspace Button Colors
      property color wbActBg: Qt.rgba(180 / 255, 190 / 255, 254 / 255, 0.9)
      property color wbActFg: Qt.rgba(0 / 255, 0 / 255, 0 / 255, 0.7)
      property color wbHvrBg: Qt.rgba(75 / 255, 75 / 255, 125 / 255, 0.4)
      property color wbHvrFg: Qt.rgba(174 / 255, 170 / 255, 240 / 255, 0.8)
      property color wbActHvrBg: Qt.rgba(180 / 255, 190 / 255, 254 / 255, 0.6)
      property color wbActHvrFg: Qt.rgba(0 / 255, 0 / 255, 0 / 255, 0.7)
      property color wsOcc: Qt.rgba(150 / 255, 150 / 255, 200 / 255, 0.2)
      property color wsEmpty: Qt.rgba(50 / 255, 50 / 255, 70 / 255, 0.1)

      // Shared style for modules
      property real moduleRadius: 25
      property real moduleMarginTop: 2
      property real moduleMarginH: 8
      property real modulePaddingV: 3
      property real modulePaddingH: 12
    }
  }
}

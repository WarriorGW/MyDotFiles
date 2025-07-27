pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  property alias options: configOptionsJsonAdapter

  JsonAdapter {
    id: configOptionsJsonAdapter

    property JsonObject bar: JsonObject {
      property JsonObject workspaces: JsonObject {
        property bool monochromeIcons: true
        property int shown: 5
        property bool showAppIcons: true
        property bool alwaysShowNumbers: false
        property int showNumberDelay: 300 // milliseconds
      }
    }
  }
}

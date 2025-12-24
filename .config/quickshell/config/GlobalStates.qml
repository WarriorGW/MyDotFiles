pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  property bool notificationsVisible: false
  property bool barVisible: true
  property bool osdVisible: false

  property bool ncPanelVisible: true

  IpcHandler {
    target: "ncPanel"
    function toggle() {
      root.ncPanelVisible = !root.ncPanelVisible;
    }
  }
}

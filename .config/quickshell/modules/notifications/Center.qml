import Quickshell
import Quickshell.Wayland
import QtQuick
import qs.config

PanelWindow {
  id: sidebar
  anchors {
    top: true
    bottom: true
    right: true
  }
  exclusiveZone: 0
  implicitWidth: 425
  color: 'transparent'

  WlrLayershell.namespace: "quickshell:rightSidebar"

  margins.top: 10
  margins.bottom: 10
  margins.left: 10
  margins.right: 10

  visible: GlobalStates.ncPanelVisible

  Content {}
}

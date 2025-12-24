import QtQuick
import qs.config

Rectangle {
  id: root

  // anchors.centerIn: parent
  radius: Theme.options.rightSidebar.radius
  width: parent.width - 20
  height: parent.height - 20
  color: "orange"
}

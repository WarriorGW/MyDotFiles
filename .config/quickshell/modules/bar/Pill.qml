import QtQuick
import QtQuick.Layouts
import "../../config"

Item {
  id: root
  property real padding: 10
  implicitHeight: Theme.options.bar.pillsHeight
  height: implicitHeight
  implicitWidth: rowLayout.implicitWidth + padding * 3

  default property alias content: rowLayout.children

  Rectangle {
    id: background

    anchors {
      fill: parent
      topMargin: 1
      bottomMargin: 1
    }

    color: Theme.options.bar.mainBg
    radius: Theme.options.bar.moduleRadius
  }

  RowLayout {
    id: rowLayout
    spacing: 6

    anchors {
      verticalCenter: parent.verticalCenter
      // left: parent.left
      // right: parent.right
      horizontalCenter: parent.horizontalCenter
      leftMargin: root.padding
      rightMargin: root.padding
    }
  }
}

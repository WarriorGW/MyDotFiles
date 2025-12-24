import QtQuick
import QtQuick.Layouts
import qs.config

// import "../../config"

Item {
  id: root
  property real padding: Theme.options.bar.innerPillPadding
  property real rowSpacing: Theme.options.bar.innerPillSpacing
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
    spacing: root.rowSpacing

    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
      leftMargin: root.padding
      rightMargin: root.padding
    }
  }
}

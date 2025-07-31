import QtQuick
import qs.config

Item {
  id: root

  default property alias content: row.children
  property real spacing: Theme.options.bar.textIconSpacing

  property bool isClickable: false
  signal clicked

  implicitHeight: row.implicitHeight
  implicitWidth: row.implicitWidth

  Row {
    id: row

    anchors.fill: parent
    spacing: root.spacing
  }

  MouseArea {
    id: mouseArea
    anchors.fill: parent
    enabled: root.isClickable
    cursorShape: root.isClickable ? Qt.PointingHandCursor : Qt.ArrowCursor
    onClicked: root.clicked()
    hoverEnabled: true
  }
}

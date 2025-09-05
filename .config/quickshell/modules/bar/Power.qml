import Quickshell
import QtQuick
import qs.config

// import "../../config"

Text {
  id: power

  color: Theme.options.bar.powerFg
  font.family: Theme.fontFamily
  font.pixelSize: Theme.fontSize

  text: "⏻"

  MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onClicked: {
      Quickshell.execDetached(['wlogout', '-b 6']);
    }
  }
}

import QtQuick
import "../../config"
import "../system"

Text {
  font.family: Theme.fontFamily
  font.pixelSize: Theme.fontSize
  font.weight: Theme.fontWeight

  color: Theme.options.bar.mainFg

  text: Time.time

  MouseArea {
    anchors.fill: parent
    onClicked: Time.toggle()
    cursorShape: Qt.PointingHandCursor
  }
}

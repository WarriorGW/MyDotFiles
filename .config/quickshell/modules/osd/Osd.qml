import QtQuick
import Quickshell

Item {
  id: osdRoot
  anchors.fill: parent

  Rectangle {
    anchors.fill: parent
    color: "#000000" // semi-transparente para test
  }

  Rectangle {
    anchors.centerIn: parent
    width: 200; height: 50
    radius: 10
    color: "#000000"

    Text {
      anchors.centerIn: parent
      text: "Welcome to Quickshell"
      font.pixelSize: 20
      color: "white"
    }
  }
}
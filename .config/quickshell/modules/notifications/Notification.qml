import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import qs.config

Item {
  id: root

  property string title: "Notification"
  property string message: "This is a notification message."

  width: 300
  height: 75
  visible: false
  anchors.centerIn: parent

  Rectangle {
    anchors.fill: parent
    color: Theme.options.notifications.mainBg

    Text {
      anchors.centerIn: parent
      text: root.title
      color: Theme.options.notifications.mainFg
      font.family: Theme.fontFamily
      font.pixelSize: Theme.fontSize
      font.weight: Theme.fontWeight
    }
  }
}

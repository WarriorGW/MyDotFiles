import QtQuick
import qs.config
import qs.modules.system

// import "../../config"
// import "../system"

Row {
  id: volumeWidget
  spacing: 6

  // El contenedor visual de textos
  Item {
    id: contentWrapper
    implicitWidth: volumeIcon.implicitWidth + volumeText.implicitWidth + volumeWidget.spacing
    implicitHeight: Math.max(volumeIcon.implicitHeight, volumeText.implicitHeight)

    Row {
      anchors.fill: parent
      spacing: 6

      Text {
        id: volumeIcon
        color: Theme.options.bar.mainFg
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize

        text: {
          if (Audio.muted)
            return "";
          else if (Audio.volume < 0.33)
            return "";
          else if (Audio.volume < 0.66)
            return "";
          else
            return "";
        }
      }

      Text {
        id: volumeText
        color: Theme.options.bar.mainFg
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
        font.weight: Theme.fontWeight
        text: Audio.muted ? "Muted" : Math.round(Audio.volume * 100) + "%"
      }
    }

    MouseArea {
      anchors.fill: parent
      cursorShape: Qt.PointingHandCursor
      onClicked: Audio.toggleMute()
      hoverEnabled: true
    }
  }
}

import QtQuick
import "../../config"
import "../system"

// import qs.config
// import qs.modules.system

Row {
  id: volumeWidget
  spacing: 6

  Text {
    id: volumeIcon
    color: Theme.options.bar.mainFg
    font.family: Theme.fontFamily
    font.pixelSize: Theme.fontSize

    text: {
      if (Audio.muted) {
        return ""; //  mute
      } else if (Audio.volume < 0.33) {
        return ""; // Silencio
      } else if (Audio.volume < 0.66) {
        return ""; // Bajo
      } else {
        return ""; // Alto
      }
    }
  }

  Text {
    id: volumeText
    color: Theme.options.bar.mainFg
    font.family: Theme.fontFamily
    font.pixelSize: Theme.fontSize
    font.weight: Theme.fontWeight

    text: if (Audio.muted) {
      "Muted";
    } else {
      Math.round(Audio.volume * 100) + "%";
    }
  }

  // MouseArea {
  //   anchors.fill: parent
  //   cursorShape: Qt.PointingHandCursor
  //   onClicked: {
  //     Audio.toggleMute();
  //   }
  // }
}

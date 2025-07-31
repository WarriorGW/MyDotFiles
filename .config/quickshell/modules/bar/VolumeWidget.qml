import QtQuick
import qs.modules.components
import qs.modules.system

ModuleDisplay {
  isClickable: true
  onClicked: Audio.toggleMute()

  StyledBarText {
    id: volumeIcon

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

  StyledBarText {
    id: volumeText

    text: Audio.muted ? "Muted" : Math.round(Audio.volume * 100) + "%"
  }
}

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import "../../config"

Row {
  id: volumeWidget
  spacing: 6

  property PwNode sink: Pipewire.defaultAudioSink
  property PwNode source: Pipewire.defaultAudioSource

  signal sinkProtectionTriggered(string reason)

  property real volume: 0

  // Detecta cuando el nodo ya está listo
  Connections {
    target: Pipewire.defaultAudioSink
    onReadyChanged: {
      if (Pipewire.defaultAudioSink.ready && Pipewire.defaultAudioSink.audio) {
        volume = Pipewire.defaultAudioSink.audio.volume;
      }
    }
  }

  // Actualiza el volumen cuando cambia
  Connections {
    target: sink?.audio
    onVolumeChanged: volume = sink.audio.volume
  }

  Component.onCompleted: {
    if (sink?.audio?.volume !== undefined) {
      volume = sink.audio.volume;
    }
  }

  Text {
    id: volumeIcon
    color: Theme.options.bar.mainFg
    font.family: Theme.fontFamily
    font.pixelSize: Theme.fontSize

    text: {
      if (sink?.audio?.muted) {
        return ""; //  mute
      } else if (volume < 0.33) {
        return ""; // Silencio
      } else if (volume < 0.66) {
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

    text: if (sink?.audio?.muted) {
      "Muted";
    } else {
      Math.round(volume * 100) + "%";
    }
  }

  PwObjectTracker {
    objects: [sink]
  }
}

pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
  id: root

  property PwNode sink: Pipewire.defaultAudioSink
  property PwNode source: Pipewire.defaultAudioSource

  property bool ready: sink?.ready ?? false
  property real volume: 0
  property bool muted: false

  signal sinkProtectionTriggered(string reason)

  PwObjectTracker {
    objects: [sink]
  }

  // Connections {
  //   target: sink?.audio ?? null
  //   property bool lastReady: false
  //   property real lastVolume: 0

  //   function onVolumeChanged() {
  //     if (!lastReady) {
  //       lastVolume = sink.audio.volume;
  //       lastReady = true;
  //     }
  //   }
  // }

  // Inicializar
  Component.onCompleted: {
    if (sink?.audio) {
      volume = sink.audio.volume;
      muted = sink.audio.muted;
    }
  }

  // Detecta cuando el nodo ya está listo
  Connections {
    target: sink
    function onReadyChanged() {
      if (sink.ready && sink.audio) {
        volume = sink.audio.volume;
        muted = sink.audio.muted;
      }
    }
  }

  function toggleMute() {
    if (sink?.audio) {
      sink.audio.muted = !sink.audio.muted;
    }
  }

  // Actualiza el volumen cuando cambia
  Connections {
    target: sink?.audio
    function onVolumeChanged() {
      volume = sink.audio.volume;
    }
    function onMutedChanged() {
      muted = sink.audio.muted;
    }
  }
}

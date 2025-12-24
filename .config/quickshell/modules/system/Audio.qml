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
    objects: [root.sink]
  }

  // Inicializar
  Component.onCompleted: {
    if (sink?.audio) {
      volume = sink.audio.volume;
      muted = sink.audio.muted;
    }
  }

  // Detecta cuando el nodo ya está listo
  Connections {
    target: root.sink
    function onReadyChanged() {
      if (root.sink.ready && root.sink.audio) {
        root.volume = root.sink.audio.volume;
        root.muted = root.sink.audio.muted;
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
    target: {
      const audio = root.sink?.audio;
      if (!audio)
        console.debug("sink.audio no disponible aún");
      return audio ?? null;
    }
    function onVolumeChanged() {
      root.volume = root.sink.audio.volume;
    }
    function onMutedChanged() {
      root.muted = root.sink.audio.muted;
    }
  }
}

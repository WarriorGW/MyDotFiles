pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
  id: root

  property int brightness: 999

  function increaseBrightness(percent: int) {
    Quickshell.execDetached(["brightnessctl", "-e2", "set", `+${percent}%`]);
    updateBrightness();
  }

  function decreaseBrightness(percent: int) {
    if (root.brightness <= 1)
      return;
    Quickshell.execDetached(["brightnessctl", "-e2", "set", `${percent}%-`]);
    updateBrightness();
  }

  function updateBrightness() {
    initProc.command = ["sh", "-c", "echo $(brightnessctl g)/$(brightnessctl m)"];
    initProc.running = true;
  }

  IpcHandler {
    target: "brightness"

    function inc(percent: int) {
      onPressed: root.increaseBrightness(percent);
    }

    function dec(percent: int) {
      onPressed: root.decreaseBrightness(percent);
    }
  }

  readonly property Process initProc: Process {
    stdout: SplitParser {
      onRead: data => {
        const [current, max] = data.split("/");
        root.brightness = Math.round(parseInt(current) / parseInt(max) * 100);
      }
    }
  }

  Component.onCompleted: {
    updateBrightness();
  }
}

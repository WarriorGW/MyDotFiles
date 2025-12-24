pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io

Singleton {
  id: keyboardLayoutIndicator

  property string currentLayout: ""
  readonly property bool hasMultipleLayouts: layouts.length > 1
  property var layouts: []
  readonly property bool useHypr: true

  function shortName(full) {
    if (!full)
      return "";

    var lang = full.trim().split(" ")[0];
    return lang.slice(0, 2).toLowerCase();
  }
  function update(namesArr, idxOrActive) {
    var names = namesArr.map(function (n) {
      return n.trim();
    });
    keyboardLayoutIndicator.layouts = names;
    if (keyboardLayoutIndicator.useHypr)
      keyboardLayoutIndicator.currentLayout = String(idxOrActive || "").trim();
    else
      keyboardLayoutIndicator.currentLayout = names[idxOrActive] || "";
  }

  Process {
    id: seedProcHypr

    command: ["hyprctl", "-j", "devices"]
    running: keyboardLayoutIndicator.useHypr

    stdout: StdioCollector {
      onStreamFinished: {
        if (!keyboardLayoutIndicator.useHypr)
          return;

        var j = JSON.parse(text);
        var arr = [], active = "";
        j.keyboards.forEach(function (k) {
          if (!k.main)
            return;

          k.layout.split(",").forEach(function (l) {
            var t = l.trim();
            if (arr.indexOf(t) === -1)
              arr.push(t);
          });
          active = k.active_keymap;
        });
        keyboardLayoutIndicator.update(arr, active);
      }
    }
  }

  Connections {
    function onRawEvent(event) {
      if (!keyboardLayoutIndicator.useHypr)
        return;

      if (event.name !== "activelayout")
        return;

      var parts = event.data.split(",").map(function (t) {
        return t.trim();
      });
      keyboardLayoutIndicator.update(parts, parts[parts.length - 1]);
    }

    enabled: keyboardLayoutIndicator.useHypr
    target: keyboardLayoutIndicator.useHypr ? Hyprland : null
  }
}

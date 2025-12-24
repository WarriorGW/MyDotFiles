pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.UPower

Singleton {
  id: root

  property UPowerDevice battery: UPower.displayDevice
  property bool ready: battery?.ready ?? false
  property real percentage: battery.percentage ?? 0
  property int state: battery.state
  readonly property string stateName: UPowerDeviceState.toString(state)
  readonly property int percentageInt: Math.round(percentage * 100)

  // Inicializar
  Component.onCompleted: {
    if (root.ready) {
      if (root.battery.percentage !== undefined) {
        root.percentage = root.battery.percentage;
        console.debug("Battery percentage:", root.percentage);
      }
      if (root.battery.toString(state) !== "Unknown") {
        root.state = root.battery.state;
        console.debug("Battery state:", UPowerDeviceState.toString(root.state));
      }
    }
  }

  // Detecta cuando el nodo ya está listo
  Connections {
    target: root.battery
    function onReadyChanged() {
      if (root.battery.ready && root.battery.percentage) {
        root.percentage = root.battery.percentage;
        console.debug("Battery ready changed:", root.percentage);
      }
    }
  }

  // Actualiza el porcentaje y el estado cuando cambia
  Connections {
    target: root.battery
    function onPercentageChanged() {
      if (!root.battery) {
        console.warn("No battery device found");
        return;
      }
      root.percentage = root.battery.percentage;
    }
    function onStateChanged() {
      if (root.battery.ready && root.battery.state) {
        root.state = root.battery.state;
        console.debug("Battery state changed:", UPowerDeviceState.toString(root.state));
      }
    }
  }
}

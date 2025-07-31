import Quickshell
import QtQuick
import qs.config
import qs.modules.system

// import "../../config"

Text {
  id: power

  color: {
    if (Power.stateName === "Charging") {
      return Theme.options.bar.safeFg;
    } else if (Battery.percentageInt <= 20) {
      return Theme.options.bar.criticalFg;
    } else if (Battery.percentageInt <= 40) {
      return Theme.options.bar.warningFg;
    } else {
      return Theme.options.bar.mainFg;
    }
  }
  font.family: Theme.fontFamily
  font.pixelSize: Theme.fontSize
  font.weight: Theme.fontWeight

  property var normalIcons: ["󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]
  property var chargeIcons: ["󰢟", "󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅"]

  property int index: Math.min(Math.floor(Power.percentageInt / (100 / normalIcons.length)), normalIcons.length - 1)

  property string icon: {
    return Power.stateName.toLowerCase() === "charging" ? chargeIcons[index] : normalIcons[index];
  }

  text: icon + " " + Power.percentageInt + "%"
}

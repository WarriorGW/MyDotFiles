import QtQuick
import qs.config
import qs.modules.system
import qs.modules.components

ModuleDisplay {
  id: root

  property color fontColor: {
    if (Power.stateName === "Charging") {
      return Theme.options.bar.safeFg;
    } else if (Power.percentageInt <= 20) {
      return Theme.options.bar.criticalFg;
    } else if (Power.percentageInt <= 40) {
      return Theme.options.bar.warningFg;
    } else {
      return Theme.options.bar.mainFg;
    }
  }

  StyledBarText {
    id: batteryIcon
    color: root.fontColor

    property var normalIcons: ["󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]
    property var chargeIcons: ["󰢟", "󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅"]

    property int index: Math.min(Math.floor(Power.percentageInt / (100 / normalIcons.length)), normalIcons.length - 1)

    property string icon: {
      return Power.stateName.toLowerCase() === "charging" ? chargeIcons[index] : normalIcons[index];
    }

    text: icon
  }

  StyledBarText {
    id: batteryText

    color: root.fontColor

    text: Power.percentageInt + "%"
  }
}

pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import qs.config

// import "../../config"

Row {
  id: workspacesRow
  spacing: 6
  // anchors.horizontalCenter: parent.horizontalCenter

  property int shown: Config.options.bar.workspaces.shown
  property int workspaceGroup: Math.floor((Hyprland.focusedWorkspace?.id - 1) / shown)
  property int visibleStart: workspaceGroup * shown + 1
  property int visibleEnd: visibleStart + shown - 1

  // Flags para saber si hay workspaces ocupados fuera del grupo actual
  // property bool hasLeftOccupied: Hyprland.workspaces.values.some(ws => ws.id < visibleStart)

  property bool hasLeftOccupied: visibleStart > 1 && Hyprland.workspaces.values.some(ws => ws.id < visibleStart)

  property bool hasRightOccupied: Hyprland.workspaces.values.some(ws => ws.id > visibleEnd)

  Rectangle {
    visible: hasLeftOccupied
    width: 16
    height: Theme.options.bar.wsButtonHeight
    radius: 10
    color: Theme.options.bar.wsEmpty

    MouseArea {
      anchors.fill: parent
      cursorShape: Qt.PointingHandCursor
      onClicked: {
        const candidates = Hyprland.workspaces.values.filter(ws => ws.id < visibleStart);
        if (candidates.length > 0) {
          let target = candidates[candidates.length - 1]; // más cercano
          Hyprland.dispatch("workspace " + target.id);
        }
      }
    }

    Text {
      anchors.centerIn: parent
      text: ""
      font.family: Theme.fontFamily
      font.pixelSize: Theme.fontSize
      color: Theme.options.bar.mainFg
    }
  }

  Repeater {
    model: workspacesRow.shown

    delegate: Rectangle {
      id: workspaceButton
      required property int index

      // Tamaño base
      property int baseSize: Theme.options.bar.wsButtonWidth
      // Tamaño aumentado si está activo
      property int activeSize: Theme.options.bar.wsButtonActiveWidth
      // Workspace id en este botón, que cambia según el grupo actual
      property int workspaceId: workspacesRow.workspaceGroup * workspacesRow.shown + index + 1

      width: Hyprland.focusedWorkspace && Hyprland.focusedWorkspace.id === workspaceId ? activeSize : baseSize
      height: Theme.options.bar.wsButtonHeight
      radius: 10

      color: {
        if (Hyprland.focusedWorkspace && Hyprland.focusedWorkspace.id === workspaceId)
          return Theme.options.bar.wbActBg;
        else if (Hyprland.workspaces.values.some(ws => ws.id === workspaceId))
          return Theme.options.bar.wsOcc;
        else
          return Theme.options.bar.wsEmpty;
      }

      Text {
        anchors.centerIn: parent
        text: workspaceButton.workspaceId
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
        font.weight: Theme.fontWeight
        color: {
          if (Hyprland.focusedWorkspace && Hyprland.focusedWorkspace.id === workspaceId) {
            return Theme.options.bar.wbActFg;
          } else if (Hyprland.workspaces.values.some(ws => ws.id === workspaceId)) {
            return Theme.options.bar.wbHvrFg;
          } else {
            return Theme.options.bar.mainFg;
          }
        }
        font.bold: true

        Behavior on color {
          ColorAnimation {
            duration: 300
            easing.type: Easing.InOutQuad
          }
        }
      }

      MouseArea {
        anchors.fill: parent
        onClicked: Hyprland.dispatch("workspace " + (workspaceButton.index + 1))
        cursorShape: Qt.PointingHandCursor
      }

      Behavior on width {
        NumberAnimation {
          duration: 300
          easing.type: Easing.InOutQuad
        }
      }
      Behavior on height {
        NumberAnimation {
          duration: 300
          easing.type: Easing.InOutQuad
        }
      }
      Behavior on color {
        ColorAnimation {
          duration: 300
          easing.type: Easing.InOutQuad
        }
      }
    }
  }

  Rectangle {
    visible: hasRightOccupied
    width: 15
    height: Theme.options.bar.wsButtonHeight
    radius: 10
    color: Theme.options.bar.wsEmpty

    MouseArea {
      anchors.fill: parent
      cursorShape: Qt.PointingHandCursor
      onClicked: {
        const target = Hyprland.workspaces.values.find(ws => ws.id > visibleEnd);
        if (target)
          Hyprland.dispatch("workspace " + target.id);
      }
    }

    Text {
      anchors.centerIn: parent
      text: ""
      font.family: Theme.fontFamily
      font.pixelSize: Theme.fontSize
      color: Theme.options.bar.mainFg
    }
  }
}

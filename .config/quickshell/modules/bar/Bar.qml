import QtQuick
import QtQuick.Layouts
import Quickshell
import "../../config"

Scope {
  id: root

  Variants {
    model: Quickshell.screens

    PanelWindow {
      id: bar
      required property var modelData
      screen: modelData
      implicitHeight: Theme.options.bar.barHeight

      color: Theme.options.bar.barBg

      margins {
        left: 18
        right: 18
        top: 10
        bottom: 0
      }

      anchors {
        left: true
        right: true
        top: true
      }

      RowLayout {
        anchors.fill: parent
        spacing: 10

        // ---------- Left Section ----------
        Item {
          Layout.fillHeight: true

          RowLayout {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 4

            Pill {
              Row {
                spacing: 6
                Text {
                  id: logoText
                  color: Theme.options.bar.mainFg
                  font.pixelSize: 26
                  text: ""
                }

                Text {
                  id: logoText2
                  color: Theme.options.bar.mainFg
                  font.weight: Theme.fontWeight
                  font.pixelSize: 14
                  text: "Arch Linux"
                  anchors.verticalCenter: parent.verticalCenter
                  font.family: Theme.fontFamily
                }
              }
            }
          }
        }

        // ---------- Center Section ----------
        Item {
          Layout.fillHeight: true
          Layout.fillWidth: true

          RowLayout {
            anchors.verticalCenter: parent.verticalCenter
            anchors.centerIn: parent
            spacing: 6

            Pill {
              Workspaces {
                id: ws
              }
            }
          }
        }

        // ---------- Right Section ----------
        Item {
          Layout.fillHeight: true

          RowLayout {
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            spacing: 6

            Pill {
              VolumeWidget {
                id: volumeWidget
              }
            }

            Pill {
              ClockWidget {
                id: clockWidget
              }
            }
          }
        }
      }
    }
  }
}

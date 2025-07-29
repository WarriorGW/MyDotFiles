import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.config

// import "../../config"

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
        left: 10
        right: 10
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
            spacing: 10

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

            Pill {}
          }
        }

        // ---------- Center Section ----------
        Item {
          Layout.fillHeight: true
          Layout.fillWidth: true

          RowLayout {
            anchors.verticalCenter: parent.verticalCenter
            anchors.centerIn: parent
            spacing: 10

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
            spacing: 10

            Pill {
              rowSpacing: 12

              VolumeWidget {
                id: volumeWidget
              }

              BrightnessWidget {
                id: brightnessWidget
              }

              Battery {
                id: batteryWidget
              }
            }

            Pill {
              ClockWidget {
                id: clockWidget
              }
            }

            Pill {
              rowSpacing: 12
              Bluetooth {
                id: bluetoothWidget
              }
              Network {
                id: networkWidget
              }
              Power {
                id: powerWidget
              }
            }
          }
        }
      }
    }
  }
}

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
        top: Theme.options.bar.barMarginTop
        left: Theme.options.bar.barMarginSides
        right: Theme.options.bar.barMarginSides
      }

      anchors {
        left: true
        right: true
        top: true
      }

      RowLayout {
        anchors.fill: parent

        // ---------- Left Section ----------
        Item {
          Layout.fillHeight: true

          RowLayout {
            anchors.verticalCenter: parent.verticalCenter
            spacing: Theme.options.bar.pillsHPadding

            Pill {
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
                font.family: Theme.fontFamily
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
            spacing: Theme.options.bar.pillSpacing

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
            spacing: Theme.options.bar.pillSpacing

            Pill {
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

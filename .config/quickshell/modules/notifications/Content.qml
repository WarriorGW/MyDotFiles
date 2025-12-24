import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import qs.config

Rectangle {
  id: content

  anchors.centerIn: parent
  radius: Theme.options.rightSidebar.radius
  width: parent.width
  height: parent.height
  color: Theme.options.rightSidebar.mainBg
  border.color: Theme.options.rightSidebar.borderColor
  border.width: Theme.options.rightSidebar.borderWidth

  ColumnLayout {
    anchors.fill: parent
    anchors.margins: Theme.options.rightSidebar.padding
    spacing: Theme.options.rightSidebar.spacing

    Rectangle {
      Layout.fillWidth: true
      Layout.preferredHeight: 50
      color: Theme.options.rightSidebar.sectionBg
      radius: Theme.options.rightSidebar.radius
      RowLayout {
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        spacing: 10

        Item {
          implicitHeight: 40
          implicitWidth: 40

          Image {
            source: "root:/assets/icons/catgirl.png"
            width: parent.width
            height: parent.height
            sourceSize.height: parent.height
            sourceSize.width: parent.width
            fillMode: Image.PreserveAspectFit
            smooth: true
            layer.enabled: true
            layer.smooth: true
          }
        }

        Text {
          text: "Wenos dias uwu"
        }
      }
    }

    RowLayout {
      Layout.fillWidth: true
      Layout.preferredHeight: 50
      spacing: 10

      Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight: parent.height
        radius: Theme.options.rightSidebar.radius
        color: Theme.options.rightSidebar.sectionBg

        Text {
          anchors.centerIn: parent
          text: "WiFi"
        }
        MouseArea {
          anchors.fill: parent
          hoverEnabled: true
          cursorShape: Qt.PointingHandCursor
          onClicked: {
            childrenSection.toggleSection('wifi', 0);
          }
        }
      }

      Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight: parent.height
        radius: Theme.options.rightSidebar.radius
        color: Theme.options.rightSidebar.sectionBg

        Text {
          anchors.centerIn: parent
          text: "Bluetooth"
        }
        MouseArea {
          anchors.fill: parent
          hoverEnabled: true
          cursorShape: Qt.PointingHandCursor
          onClicked: {
            childrenSection.toggleSection('bluetooth', 1);
          }
        }
      }

      Rectangle {
        Layout.fillWidth: true
        Layout.preferredHeight: parent.height
        radius: Theme.options.rightSidebar.radius
        color: Theme.options.rightSidebar.sectionBg

        Text {
          anchors.centerIn: parent
          text: "Audio"
        }
        MouseArea {
          anchors.fill: parent
          hoverEnabled: true
          cursorShape: Qt.PointingHandCursor
          onClicked: {
            childrenSection.toggleSection('audio', 2);
          }
        }
      }
    }

    Rectangle {
      id: childrenSection
      property string currentSection: ""
      property string nextSection: ""

      Layout.fillWidth: true
      Layout.preferredHeight: currentSection !== "" ? 250 : 0
      // Layout.preferredHeight: 250
      radius: Theme.options.rightSidebar.radius
      color: Theme.options.rightSidebar.sectionBg

      Behavior on Layout.preferredHeight {
        NumberAnimation {
          duration: 1000
          easing.type: Easing.OutQuad
          onRunningChanged: {
            // Cuando termina la animación de cierre, ocultar visualmente
            if (!running && childrenSection.nextSection === "")
              childrenSection.currentSection = childrenSection.nextSection;
            return;
            // Cuando termina la animación de apertura, actualizar la sección actual
            childrenSection.currentSection = childrenSection.nextSection;
          }
        }
      }

      // visible: currentSection !== ""
      visible: Layout.preferredHeight > 0

      function toggleSection(name: string, index: int) {
        if (currentSection === name) {
          currentSection = ""; // cerrar si ya está abierto el mismo
          console.debug("Closing section:", name);
        } else {
          // currentSection = name; // cambiar contenido
          currentSection = name;
          console.debug("Opening section:", name);
        }
      }

      Loader {
        id: sectionLoader
        // active: childrenSection.currentSection !== ""
        anchors.fill: parent
        anchors.margins: 10

        sourceComponent: {
          if (childrenSection.currentSection === "wifi") {
            return wifiSection;
          } else if (childrenSection.currentSection === "bluetooth") {
            return bluetoothSection;
          } else if (childrenSection.currentSection === "audio") {
            return audioSection;
          }
        }

        Component {
          id: wifiSection
          Wifi {}
        }
        Component {
          id: bluetoothSection
          Bluetooth {}
        }
        Component {
          id: audioSection
          Audio {}
        }
      }
    }

    Quick {}

    Rectangle {
      Layout.fillWidth: true
      Layout.fillHeight: true
      radius: Theme.options.rightSidebar.radius
      color: Theme.options.rightSidebar.sectionBg
      Layout.preferredHeight: 50

      Text {
        text: "Notifications"
      }
    }
  }
}

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Pipewire
import qs.config

Item {
  id: root
  width: parent.width
  implicitHeight: column.implicitHeight

  property int swapIndex: -1

  Rectangle {
    anchors.fill: parent
    color: "transparent"
    radius: 10

    ColumnLayout {
      id: column
      anchors.fill: parent
      spacing: 0
      // anchors.margins: 5

      RowLayout {
        id: tabButtons
        Layout.alignment: Qt.AlignTop
        Layout.fillWidth: true
        Layout.preferredHeight: 40
        spacing: 0

        Button {
          id: tab1
          text: "Tab 1"
          Layout.fillWidth: true
          Layout.preferredHeight: parent.height

          background: Rectangle {
            color: tab1.down ? "gray" : Theme.options.rightSidebar.sectionBg
            border.color: "gray"
            border.width: 2
            topLeftRadius: 10
            bottomLeftRadius: 10
            topRightRadius: 0
            bottomRightRadius: 0
          }

          onClicked: {
            console.debug("Opened tab 1!");
            swipeRoot.toggleTab(0);
          }
        }

        Button {
          id: tab2
          text: "Tab 2"
          Layout.fillWidth: true
          Layout.preferredHeight: parent.height

          background: Rectangle {
            color: tab2.down ? "gray" : Theme.options.rightSidebar.sectionBg
            border.color: "gray"
            border.width: 2
            radius: 0
          }

          onClicked: {
            console.debug("Opened tab 2!");
            swipeRoot.toggleTab(1);
          }
        }

        Button {
          id: tab3
          text: "Tab 3"
          Layout.fillWidth: true
          Layout.preferredHeight: parent.height

          background: Rectangle {
            color: tab3.down ? "gray" : Theme.options.rightSidebar.sectionBg
            border.color: "gray"
            border.width: 2
            topLeftRadius: 0
            bottomLeftRadius: 0
            topRightRadius: 10
            bottomRightRadius: 10
          }

          onClicked: {
            console.debug("Opened tab 3!");
            swipeRoot.toggleTab(2);
          }
        }
      }

      Rectangle {
        id: tabber
        Layout.alignment: Qt.AlignTop
        Layout.fillWidth: true
        Layout.preferredHeight: root.swapIndex !== -1 ? 250 : 0

        Behavior on Layout.preferredHeight {
          NumberAnimation {
            duration: 1000
            easing.type: Easing.InOutQuad
            onRunningChanged: {
              console.debug("Tab content height: ", tabber.height);
            }
          }
        }

        color: Theme.options.rightSidebar.sectionBg
        border.color: "gray"
        border.width: 2
        radius: 10

        SwipeView {
          id: swipeRoot
          anchors.fill: parent
          clip: true

          currentIndex: root.swapIndex

          interactive: false

          function toggleTab(index: int) {
            if (currentIndex === index) {
              root.swapIndex = -1;
            } else {
              root.swapIndex = index;
            }
          }

          Rectangle {
            color: "transparent"
            Text {
              anchors.centerIn: parent
              text: "Content of tab 1"
            }
          }
          Rectangle {
            color: "transparent"
            Text {
              anchors.centerIn: parent
              text: "Content of tab 2"
            }
          }
          Rectangle {
            color: "transparent"

            Text {
              anchors.centerIn: parent
              text: "Content of tab 3"
            }
          }
        }
      }
    }
  }
}

// with this line our type becomes a Singleton
pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  property bool expanded: false

  readonly property string time: {
    expanded ? Qt.formatDateTime(clock.date, "ddd·d, MMM·M · hh:mm AP") : Qt.formatDateTime(clock.date, "hh:mm AP");
  }

  function toggle() {
    expanded = !expanded;
  }

  SystemClock {
    id: clock
    precision: SystemClock.Minutes
  }
}

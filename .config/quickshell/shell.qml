//@ pragma UseQApplication

import QtQuick
import Quickshell
import qs.modules.bar

// import "./modules/osd"

// ShellRoot {
//   id: root

//   property bool enableBar: true
//   property bool enableOsd: true

//   // Component.onCompleted: {
//   //   // Cliphist.refresh()
//   // }

//   LazyLoader {
//     active: root.enableBar
//     component: Bar {}
//   }
//   LazyLoader {
//     active: root.enableOsd
//     component: Osd {}
//   }
// }

Scope {
  Bar {}
}

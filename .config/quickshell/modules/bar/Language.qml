import qs.config
import qs.modules.system
import qs.modules.components
import QtQuick
import Quickshell.Io

StyledBarText {
  id: root

  color: Theme.options.bar.mainFg

  visible: KeyboardLayout.hasMultipleLayouts
  // text: KeyboardLayout.currentLayout
  text: KeyboardLayout.shortName(KeyboardLayout.currentLayout)
}

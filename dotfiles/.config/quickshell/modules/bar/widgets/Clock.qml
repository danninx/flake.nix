import QtQuick
import QtQuick.Controls
import qs.common

Text {
    property color textColor
    id: clock

    text: "%1\n%2".arg(Time.hour).arg(Time.minute)
    color: this.textColor ? this.textColor : "white"
    font.family: "JetBrains Mono"
    font.pixelSize: 16

    // ToolTip.visible: mouseArea.containsMouse
    // ToolTip.text: Time.date
    // ToolTip.delay: 500

    // ToolTip.background: Rectangle {
    //     color: Catppuccin.withAlpha(Catppuccin.mocha.surface0, 0.9)
    //     radius: 5
    //     border.color: Catppuccin.mocha.overlay0
    //     border.width: 1
    // }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }
}
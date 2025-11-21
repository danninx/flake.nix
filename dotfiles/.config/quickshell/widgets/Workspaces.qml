import Quickshell
import Quickshell.Hyprland
import QtQuick

Rectangle {
    required property color activeColor
    required property color inactiveColor

    id: workspaces
    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter
    width: parent.width * 0.7
    implicitHeight: 100
    radius: 10
    color: "transparent"

    Column {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 8

        Repeater {
            model: Hyprland.workspaces

            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: 20
                height: 20
                radius: 10
                color: modelData.active ? activeColor : inactiveColor
                visible: modelData.id >= 0
            }
        }
    }
}
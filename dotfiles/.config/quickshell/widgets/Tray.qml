import Quickshell
import Quickshell.Services.SystemTray
import QtQuick
import QtQuick.Layouts

Rectangle {
    required property color backgroundColor
    readonly property int iconSize: 16
    property var items: SystemTray.items
    property var trayMenu

    id: tray
    anchors.bottom: parent.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    width: 25
    implicitHeight: trayColumn.implicitHeight + 10
    radius: 10
    color: backgroundColor

    ColumnLayout {
        id: trayColumn
        anchors.fill: parent
        spacing: 8

        Repeater {
            model: items

            MouseArea {
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                implicitHeight: 16
                implicitWidth: 16
                Layout.alignment: Qt.AlignHCenter

                onClicked: {
                    if (mouse.button === Qt.RightButton) {
                        modelData.secondaryActivate()
                    } else if (mouse.button === Qt.LeftButton) {
                        modelData.activate()
                    }
                }

                Image {
                    anchors.fill: parent
                    source: modelData.icon
                }
            }
        }
    }
}
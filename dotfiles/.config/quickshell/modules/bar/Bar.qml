import Quickshell
import Quickshell.Hyprland
import QtQuick

import qs.themes
import "widgets"

Scope {
    id: root
    property bool active: true

    function toggle() {
        root.active = !root.active
    }

    GlobalShortcut {
        appid: "danni-shell"
        name: "toggle-bar"
        onPressed: {
            root.toggle()
        }
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            visible: root.active

            color: "transparent"

            anchors {
                top: true
                left: true
                bottom: true
            }

            implicitWidth: 40

            margins {
                top: 10
                left: 10
                bottom: 10
            }

            Rectangle {
                id: bar
                anchors.fill: parent
                anchors.rightMargin: 0
                radius: 10
                color: Theme.withAlpha(Theme.colors.base, 0.75)

                Workspaces {
                    activeColor: Theme.colors.overlay1
                    inactiveColor: Theme.colors.surface0
                } 

                Tray {
                    backgroundColor: Theme.colors.surface0
                    anchors.bottom: clockWidget.top
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Clock {
                    id: clockWidget
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    padding: 10
                    textColor: Theme.colors.subtext0
                }
            }
        }
    }

}

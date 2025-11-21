import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Controls

import qs.themes


Scope {
    id: root
    property bool active: false
    property string query: ""

    GlobalShortcut {
        appid: "danni-shell"
        name: "open-launcher"
        onPressed: {
            root.active = true;
        }
    }

    ScriptModel {
        property var all: DesktopEntries.applications.values
        id: desktopEntriesModel
        values: {
            const q = root.query.toLowerCase();
            const entries = ((q === "") ? all : all.filter(entry => {
                return entry.name.toLowerCase().includes(q) || entry.comment.toLowerCase().includes(q);
            })).sort((a, b) => {
                return a.name.localeCompare(b.name);
            });
             
            return (entries.length > 5) ? entries.slice(0, 5) : entries;
        }
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            id: launcher
            implicitWidth: 500
            implicitHeight: 420
            color: "transparent"
            focusable: true
            visible: active
            aboveWindows: true

            Rectangle {
                id: searchBar
                anchors.fill: parent
                radius: 15
                color: Theme.withAlpha(Theme.colors.base, 0.9)
                border.color: Theme.withAlpha(Theme.colors.surface1, 0.05)
                border.width: 1

                TextField {
                    id: searchField
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 20
                    height: 30
                    font.pixelSize: 18
                    font.family: "JetBrains Mono"
                    placeholderText: "Search..."
                    placeholderTextColor: Theme.colors.subtext0
                    background: Rectangle {
                        color: Theme.withAlpha(Theme.colors.surface1, 0.6)
                        radius: 10
                    }
                    color: Theme.colors.text
                    selectedTextColor: Theme.colors.text

                    onTextChanged: {
                        root.query = text
                    }

                    onActiveFocusChanged: {
                        if (!activeFocus) {
                            root.active = false
                            root.query = ""
                        }
                    }

                    Keys.onEscapePressed: {
                        root.active = false
                        root.query = ""
                        searchField.text = ""
                    }
                }

                ListView {
                    id: results
                    anchors.top: searchField.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.margins: 20
                    model: desktopEntriesModel
                    spacing: 5
                    clip: true

                    delegate: Rectangle {
                        height: 60
                        anchors.left: parent.left
                        anchors.right: parent.right
                        color: area.containsMouse ? Theme.withAlpha(Theme.colors.overlay1, 0.2) : "transparent"
                        radius: 10

                        MouseArea {
                            id: area
                            hoverEnabled: true
                            anchors.fill: parent
                            anchors.margins: 10

                            Row {
                                spacing: 10
                                Image {
                                    id: icon
                                    source: Quickshell.iconPath(modelData.icon)
                                    width: 25
                                    height: 25
                                    anchors.verticalCenter: parent.verticalCenter
                                    anchors.margins: 10
                                }

                                Column {
                                    spacing: 2
                                    anchors.verticalCenter: parent.verticalCenter

                                    Text {
                                        id: title
                                        text: modelData.name
                                        color: root.Theme.colors.text
                                        font.pixelSize: 18
                                        verticalAlignment: Text.AlignVCenter
                                        anchors.margins: 10
                                    }

                                    Text {
                                        id: subtitle
                                        text: modelData.comment
                                        color: root.Theme.colors.subtext0
                                        font.pixelSize: 12
                                        verticalAlignment: Text.AlignVCenter
                                        anchors.margins: 10
                                    }
                                }
                            }

                            onClicked: {
                                modelData.execute();
                                root.active = false;
                                root.query = ""
                                searchField.text = ""
                            }
                        }
                        
                    }
                }
            }

            Component.onCompleted: {
                searchField.forceActiveFocus();
            }
        }
    }
}
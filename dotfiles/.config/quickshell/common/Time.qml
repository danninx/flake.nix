pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root
    property string date
    property string hour
    property string minute

    Process {
        id: timeProcess
        command: ["date", "+%F:%H:%M"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                var parts = this.text.split(":");
                root.date = parts[0];
                root.hour = parts[1];
                root.minute = parts[2];
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            timeProcess.running = true
        }
    }
}
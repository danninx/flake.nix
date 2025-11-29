import QtQuick
import Quickshell
import Quickshell.Services.UPower

Text {
	id: root

	property color goodColor: "green"
	property color cautionColor: "yellow"
	property color criticalColor: "red"
    property color textColor
	property var battery: UPower.displayDevice

    font.pixelSize: 14
	text: (battery.percentage * 100).toFixed(0) + "%"
	color: textColor
}

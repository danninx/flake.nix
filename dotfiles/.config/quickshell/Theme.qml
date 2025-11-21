pragma Singleton

import QtQuick
import Quickshell
import "themes"

Singleton {
    id: root

    property QtObject colors: {
        switch(theme) {
            case "mocha": return Catppuccin.mocha;
            default: return Catppuccin.mocha;
        }
    }

    property string theme: "mocha"

    function setTheme(newTheme) {
        this.theme = newTheme;
    }

    function withAlpha(baseColor, alpha) {
        return Qt.rgba(baseColor.r, baseColor.g, baseColor.b, alpha);
    }
}
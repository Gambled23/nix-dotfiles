import QtQuick
import Quickshell

Scope {
    id: root

    // Volume OSD
    Loader {
        source: "./volume_osd.qml"
    }

    // Desktop clock (handles all screens internally)
    Loader {
        source: "./desktop_clock.qml"
    }
}
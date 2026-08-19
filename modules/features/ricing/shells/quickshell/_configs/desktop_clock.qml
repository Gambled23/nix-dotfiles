import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Effects

Scope {
    id: root
    property string timeString
    Variants {
        model: Quickshell.screens 
        delegate: Component {
            PanelWindow {
                required property var modelData // The screen object
                screen: modelData // Assign the screen to the window
                exclusionMode: ExclusionMode.Ignore // Ignore exclusion zones
                aboveWindows: false // Not above other windows
                color: "transparent" // Transparent background

                // Full-size Rectangle as background
                anchors {
                    top: true
                    left: true
                    bottom: true
                    right: true
                }

                // Time Display, positioned at center, displaying the value of timeString
                Text {
                    id: timetxt
                    height: 200
                    x: parent.width - width >> 1
                    y: 50
                    font.family: "GoMono"
                    font.italic: false
                    font.bold: true
                    font.pointSize: 80
                    color: "#98971a"
                    text: root.timeString
                }
            }
        }
    }

    // Process to get the current time, updates every second by Timer
    // When timeString changes, the Text element will automatically update
    Process {
        id: dateProc
        command: ["date", "+%H : %M"]
        running: true
        stdout: SplitParser {
            onRead: data => timeString = data
        }
    }
    // Update Process every second
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dateProc.running = true
    }
}
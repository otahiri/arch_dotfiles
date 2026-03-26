import QtQuick
import Quickshell
import Quickshell.Wayland
import Qt5Compat.GraphicalEffects

ShellRoot {
    WlSessionLock {
        id: systemLock
        locked: true

        WlSessionLockSurface {
            Rectangle {
                anchors.fill: parent
                color: "#1e1e2e"
                Image {
                    id: bgImage
                    anchors.fill: parent
                    source: "/home/chucky/images/BG/minimalistic background 1366 x 768_1.jpg"
                    fillMode: Image.PreserveAspectFit
                    visible: false
                }
                FastBlur {
                    anchors.fill: parent
                    source: bgImage
                    radius: 64
                }
                Rectangle {
                    anchors.fill: parent
                    color: "#2E2E33"
                    opacity: 0.5
                }
                Column {
                    anchors.centerIn: parent
                    spacing: 20

                    Text {
                        text: "System Locked"
                        color: "#cdd6f4"
                        font.pixelSize: 32
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    TextInput {
                        id: passInput
                        width: 300
                        height: 50
                        color: "#cdd6f4"
                        font.pixelSize: 24
                        echoMode: TextInput.Password
                        focus: true
                        horizontalAlignment: TextInput.AlignHCenter

                        Rectangle {
                            anchors.fill: parent
                            color: "#313244"
                            border.color: "#89b4fa"
                            border.width: 2
                            radius: 8
                            z: -1
                        }

                        onAccepted: {
                            if (text === "1337") {
                                systemLock.locked = false
                                Qt.quit()
                            } else {
                                text = ""
                            }
                        }
                    }
                }
            }
        }
    }
}

import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.2

Item {
    //width: 640
    //height: 480
    width: parent
    height: parent

    property alias button3: button3
    property alias button2: button2
    property alias button1: button1
    property alias passwordInput: passwordInput

    RowLayout {
        anchors.centerIn: parent

        Button {
            id: button1
            text: qsTr("Press Me 1")
        }

        Button {
            id: button2
            text: qsTr("Press Me 2")
        }

        Button {
            id: button3
            text: qsTr("Press Me 3")
        }
    }

    RowLayout {
        TextField {
            id: passwordInput
            echoMode: TextInput.Password
            placeholderText: "Password "
            text: "Hello"
        }
        ProgressBar {
            minimumValue: 0
            maximumValue: 256
            value: 100

            style: ProgressBarStyle {
                    background: Rectangle {

                        // radius: 2
                        color: "lightgray"
                        //border.color: "gray"
                        //border.width: 1
                        implicitWidth: 200
                        implicitHeight: 24


                    }
                    progress: Rectangle {
                        color: "lightsteelblue"
                        Text {
                            text: "hello2"
                        }

                        //border.color: "steelblue"
                    }
                }



        }
    }
}

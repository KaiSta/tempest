import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1


ApplicationWindow {
    title: qsTr("tempest")
    width: 640
    minimumWidth: 200
    height: 480
    minimumHeight: 100
    visible: true

    FileDialog {
        id: fileDialog
        folder: "file:///Users"
        selectFolder: true
        onAccepted: messageDialog.show(fileUrl);
    }

    Action {
        id: openAction
        text: "Open Container"
        onTriggered: fileDialog.open()
        shortcut: "Ctrl+O"
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            MenuItem {
                text: qsTr("&Open Container")
                action: openAction
            }
            MenuItem {
                text: qsTr("&New Container")
                onTriggered: messageDialog.show(qsTr("Open action triggered"));
            }
            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit();
            }
        }
    }

    toolBar: ToolBar {
        RowLayout {
            width: parent.width
            anchors.fill: parent

            Button {
                text: "Add"
            }
            Button {
                text: "Refresh"
            }
            Button {
                text: "Sync"
            }
            Button {
                text: "Delete"
            }
            Item { Layout.fillWidth: true }
        }
    }


    SplitView {
        anchors.fill: parent


        TableView {
            model: containerModel
            frameVisible: false
            Layout.minimumWidth: 100
            Layout.maximumWidth: 300

            TableViewColumn {
                title: qsTr("Container")
                role: "containerName"
            }
        }


        MainForm {
            button1.onClicked: messageDialog.show(qsTr("Button 1 pressed"))
            button2.onClicked: messageDialog.show(qsTr("Button 2 pressed"))
            button3.onClicked: _pwStrengthChecker.check(passwordInput.text);
            //passwordInput.onTextChanged: console.log("asddas");
        }
    }


    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}

import QtQuick 2.11
import QtQuick.Layouts 1.9
import QtQuick.Controls 2.4 as QQC2
import org.kde.kirigami 2.9 as Kirigami

Kirigami.GlobalDrawer {
    id: globalDrawer
    title: "Global Drawer"
    titleIcon: "qrc:/Images/Kde-Logo-Blue.png"
    bannerImageSource: "qrc:/Images/Kde-Logo-Gray-Transparent.png"
    
    topContent: [
//         Qt <Item> is not the same as Qt <Action>
        QQC2.Button {
            Layout.alignment: Qt.AlignRight
            id: right
            text: parent.width
            onClicked: print(globalDrawer.collapsed)
        },
        QQC2.Button {
            Layout.alignment: Qt.AlignLeft
            id: left
            text: parent.width
        }
    ]
    
    actions: [
        Kirigami.Action {
            text: i18n("&View")
            iconName: "view-list-icons"
        },
        Kirigami.Action {
            text: "Settings"
            iconName: "settings-configure"
        },
        Kirigami.Action {
            text: "About"
            iconName: "help-about"
        }
    ]
    showContentWhenCollapsed: true
    
}

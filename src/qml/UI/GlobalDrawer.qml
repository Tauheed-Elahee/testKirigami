import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.13 as QQC2
import org.kde.kirigami 2.11 as Kirigami

Kirigami.GlobalDrawer {
    id: globalDrawer
    title: "Global Drawer"
    titleIcon: "qrc:/Images/Kde-Logo-Blue.png"
    bannerImageSource: "qrc:/Images/Kde-Logo-Blue-Transparent.png"
    bannerVisible: true
    modal: false
    collapsible: true
//     collapsed: true
    /*
    topContent: [
//         Qt <Item> is not the same as Qt <Action>
        QQC2.Button {
            Layout.alignment: Qt.AlignRight
            id: right
            text: parent.width
            onClicked: {
                print(globalDrawer.collapsed)
                root.showPassiveNotification("This is a Passive Notification", 100, "Hide this", root.hidePassiveNotification)
                //globalDrawer.collapsed = !globalDrawer.collapsed
                //globalDrawer.showTopContentWhenCollapsed = true
            }
        },
        QQC2.Button {
            Layout.alignment: Qt.AlignLeft
            id: left
            text: parent.width
        }
    ]
    */
    actions: [
        Kirigami.Action {
            text: i18n("&View")
            iconName: "view-list-icons"
        },
        Kirigami.Action {
            text: "Settings"
            iconName: "settings-configure"
            onTriggered: {
//                 globalDrawer.collapsed = !globalDrawer.collapsed;
            }
            Kirigami.Action {
                text: "Click Me"
                iconName: "input-mouse-click-left"
                onTriggered: {
                    root.showPassiveNotification("You Clicked Me")
                }
            }
        },
        Kirigami.Action {
            text: "About"
            iconName: "help-about"
        }
    ]
    showContentWhenCollapsed: true
}

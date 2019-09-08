import QtQuick 2.11
import QtQuick.Layouts 1.9
import QtQuick.Controls 2.4 as QQC2
import org.kde.kirigami 2.6 as Kirigami

Kirigami.GlobalDrawer {
    id: globalDrawer
    title: "Global Drawer"
    bannerImageSource: "qrc:/Images/Kde-Logo-Blue.png"
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
    // topContent: [
        // Qt <Item> is not the same as Qt <Action>
    // ]
    
}

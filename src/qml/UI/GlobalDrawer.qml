import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.13 as QQC2
import org.kde.kirigami 2.11 as Kirigami

Kirigami.GlobalDrawer {
    id: globalDrawer
    title: "Global Drawer"
    titleIcon: "qrc:/Images/Kde-Logo-Blue.png"
    bannerImageSource: "qrc:/Images/Plasma-Logo-Colorful.png"
    bannerVisible: !globalDrawer.collapsible
    modal: false
    collapsible: true
    showHeaderWhenCollapsed: true
    
    header: RowLayout {
            Layout.fillWidth: true
            QQC2.ToolButton {
                icon.name: "application-menu"
                visible: globalDrawer.collapsible
                checked: !globalDrawer.collapsed
                onClicked: globalDrawer.collapsed = !globalDrawer.collapsed
            }
            Kirigami.SearchField {
                visible: !globalDrawer.collapsed
                Layout.fillWidth: true
            }
        }
    
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
            onTriggered:  {
                globalDrawer.collapsible = !globalDrawer.collapsible;
                root.showPassiveNotification(globalDrawer.collapsible);
            }
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
        },
        Kirigami.Action {
            text: "To Do"
            iconName: "korg-todo"
            /*
              QML 5.15 error
            Connections {
                function pushToDoPage() {
                    console.log("test");
                }
            }
            */
            
            onTriggered: {
                /*
                root.pageStack.find(function(item){
                    if (item.id == "toDoPage") {
                        console.log("this is here \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
                        return true;
                    }
                });
                */
                console.log(root.pageStack.get(0).title);
                //console.log(root.pageStack.lastItem.title ,"\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
                if (root.pageStack.lastItem.title !== "To Do") {
                    root.pageStack.push(toDoPage);
                }
            }
            
        }
    ]
    showContentWhenCollapsed: true
}

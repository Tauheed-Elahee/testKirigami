import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.13 as QQC2
import org.kde.kirigami 2.11 as Kirigami

Kirigami.Page {
    id: mainPage
    
    title: "Main Page"
    
    width: parent.width
    
    // Action bar
    mainAction: Kirigami.Action {
        iconName: "kde"
        text: "Main action"
        onTriggered: print("Main Action")
    }
    leftAction: Kirigami.Action {
        iconName: "go-previous"
        text: "Left action"
        onTriggered: print("Left Action")
    }
    rightAction: Kirigami.Action {
        iconName: "go-next"
        text: "Right action"
        onTriggered: print("Right Action")
    }
    // end of Action bar
    
    contextualActions: [
        Kirigami.Action {
            iconName: "editor"
            text: "Edit Action"
            onTriggered: print("context edit")
        },
        Kirigami.Action {
            iconName: "avatar-default-symbolic"
            text: "Second Action"
            onTriggered: print("At least two contectual actions needed for an overflow list")
        }
    ]
    
    Kirigami.FormLayout {
        
        id: kirigamiFormLayout
        
        QQC2.TextField {
            id: firstTextField
            Kirigami.FormData.label: "Label:"
            width: parent.width
        }
        Kirigami.Separator {
            Kirigami.FormData.label: "Section Title"
            Kirigami.FormData.isSection: false
        }
        QQC2.TextField {
            Kirigami.FormData.label: "Label:"
        }
        QQC2.Button {
            id: getText
            text: "Get text"
            
            signal clickedButton(string str)

            onClicked: {
                print(firstTextField.text);
                print(this.text);
                getText.clickedButton("Hello from QML");
                myClass.test();
            }
        }
        QQC2.Button {
            text: "Collapse"
            onClicked: {
//                 print(globalDrawer.collapsed);
                globalDrawer.collapsed = !globalDrawer.collapsed;
                print(globalDrawer.collapsed);
//                 print(globalDrawer.drawerOpen);
            }
        }
        
        /* // Problem here when uncommented pressing "Alt" messes up the ui
        QQC2.Button {
            Kirigami.FormData.label: "Passive Notification: "
            text: "Click Me"
            onClicked: root.showPassiveNotification("Passive Notification")
        }
        */
        
        Text {
            id: asdf
            text: "Why is the passive notification not working?"
            color: Kirigami.Theme.textColor
        }
        
        
        // Wanted to test Kirigami.ActionTextField but it requires org.kde.kirigami 2.7
        
        Kirigami.Separator {
            Kirigami.FormData.label: "Go to Alex's Blog"
            Kirigami.FormData.isSection: true
        }
        QQC2.Button {
            text: "Push to Alex's Blog"
            onClicked: pageStack.push(Qt.resolvedUrl("qrc:/UI/AlexPage.qml"))
        }
    }
    
    /* This does not produce what I'm looking for
    Kirigami.InlineMessage {
        visible: true
        text: "test"
        type: Kirigami.MessageType.Positive
//         showCloaseButton: true
    }
    */
}

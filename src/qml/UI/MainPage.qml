import QtQuick 2.11
import QtQuick.Layouts 1.9
import QtQuick.Controls 2.4 as QQC2
import org.kde.kirigami 2.6 as Kirigami

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
        }
    ]
    
    Kirigami.FormLayout {
        
        id: kirigamiFormLayout
        
        QQC2.TextField {
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
}

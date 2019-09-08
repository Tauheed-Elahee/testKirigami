import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12 as QQC2
import org.kde.kirigami 2.10 as Kirigami

Kirigami.Page {
    id: alexPage
    
    title: "Alex Page"
    
    width: parent.height
    
    // Action bar
    mainAction: Kirigami.Action {
        iconName: "globe"
        text: "globe action"
        onTriggered: print("globe Action")
    }
    // end of Action bar
    
    contextualActions: [
        Kirigami.Action {
            iconName: "map-globe"
            text: "map editor"
            onTriggered: print("map edit")
        }
    ]
    
    ColumnLayout {
        width: parent.width
        
        QQC2.Label {
            text: "From:"
        }
        QQC2.TextField {
            width: parent.width
            text: "Ottawa"
        }
        
        QQC2.Label {
            text: "To:"
        }
        QQC2.TextField {
            width: parent.with
            text: "Toronto"
        }
        
        QQC2.Button {
            text: "Pop this page"
            onClicked: pageStack.pop(Qt.resolvedUrl("qrc:/UI/AlexPage.qml"))
        }
    }
}

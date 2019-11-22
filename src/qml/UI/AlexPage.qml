import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.13 as QQC2
import org.kde.kirigami 2.11 as Kirigami

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
            id: fromTextField
            width: parent.width
            text: "Ottawa"
        }
        
        QQC2.Label {
            text: "To:"
        }
        QQC2.TextField {
            id: toTextField
            width: parent.with
            text: "Toronto"
        }
        
        QQC2.Button {
            text: "Print from TextField"
            onClicked: myClass.print_QML_text(fromTextField.text);
        }
        
        QQC2.Button {
            text: "Transfer from one file to another."
            onClicked: myClass.load_and_dump("../../" + fromTextField.text + ".txt", "../../" + toTextField.text + ".txt");
        }
        
        QQC2.Button {
            text: "Pop this page"
            onClicked: pageStack.pop(Qt.resolvedUrl("qrc:/UI/AlexPage.qml"))
        }
    }
}

import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.13 as QQC2
import org.kde.kirigami 2.11 as Kirigami
import ToDo 1.0

// Why is Qt lying??? https://doc.qt.io/qt-5/qtquick-modelviewsdata-cppmodels.html

Kirigami.Page{
    id:toDoPage
    title: qsTr("To Do")
    width: parent.width
    
    ListView {
        implicitWidth: parent.width
        implicitHeight: parent.height
        clip: true
        
        model: ToDoModel {}
        /*
        model: ListModel {
            ListElement {
                done: true
                desciption: "Wash the car"
            }
            ListElement {
                done: false
                desciption: "Fix the sink"
            }
        }
        */
        delegate: RowLayout {
            width: parent.width
            
            QQC2.CheckBox {
                checked: model.done
                onClicked: model.done = checked
            }
            
            QQC2.TextField {
                text: model.desciption
                onEditingFinished: model.desciption = text
                Layout.fillWidth: true
            }
        }
    }
}

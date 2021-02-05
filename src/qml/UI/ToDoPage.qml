import QtQuick 2.13
import QtQuick.Layouts 1.13
import QtQuick.Controls 2.13 as QQC2
import org.kde.kirigami 2.11 as Kirigami
import ToDo 1.0

// https://doc.qt.io/qt-5/qtquick-modelviewsdata-cppmodels.html
// https://www.youtube.com/watch?v=9BcAYDlpuT8

Kirigami.ScrollablePage{
    id:toDoPage
    title: qsTr("To Do")
    width: parent.width
    
    mainAction: Kirigami.Action {
        iconName: "task-new"
        text: qsTr("Add new task")
        onTriggered: toDoList.appendItem()
    }
    rightAction: Kirigami.Action {
        iconName: "edit-delete-remove"
        text: qsTr("Remove completed tasks")
        onTriggered: toDoList.removeCompletedItems()
    }
    
    Component {
            id: delegateComponent
            Kirigami.SwipeListItem {
                id: listItem
                contentItem: RowLayout {
                    QQC2.CheckBox{
                        checked: model.done
                        onClicked: model.done = !model.done;
                    }

                    QQC2.TextField {
                        id: editToDo
                        Layout.fillWidth: true
                        height: Math.max(implicitHeight, Kirigami.Units.iconSizes.smallMedium)
                        text: model.description
                        onEditingFinished: model.description = text
                        visible: !editToDo.readOnly
                    }
                    QQC2.Label {
                        id: labelToDo
                        Layout.fillWidth: true
                        height: Math.max(implicitHeight, Kirigami.Units.iconSizes.smallMedium)
                        text: model.description
                        visible: editToDo.readOnly
                    }
                }
                actions: [
                    Kirigami.Action {
                        iconName: editToDo.readOnly? "document-edit":"document-save"
                        text: editToDo.readOnly? "Edit":"Save"
                        onTriggered: editToDo.readOnly = !editToDo.readOnly;
                    }
                ]
            }
        }


    ListView {
        implicitWidth: parent.width
        implicitHeight: parent.height
        clip: true
        
        model: ToDoModel {
            list: toDoList
        }
        
        delegate: Kirigami.DelegateRecycler {
            width: parent ? parent.width : implicitWidth
            sourceComponent: delegateComponent
        }

        /*
        delegate: RowLayout {
            width: parent.width
            
            QQC2.CheckBox {
                checked: model.done
                onClicked: model.done = checked
            }
            
            QQC2.TextField {
                text: model.description
                onEditingFinished: model.description = text
                Layout.fillWidth: true
            }
        }
        */
    }
}

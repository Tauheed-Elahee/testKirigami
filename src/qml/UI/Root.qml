import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12 as QQC2
import org.kde.kirigami 2.10 as Kirigami

Kirigami.ApplicationWindow {
    id: root
    
    globalDrawer: GlobalDrawer{}
    
    contextDrawer: Kirigami.ContextDrawer {
        id: contextDrawer
    }
    
    pageStack.initialPage: Qt.resolvedUrl("qrc:/UI/MainPage.qml")
}

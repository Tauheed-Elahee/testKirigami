import QtQuick 2.11
import QtQuick.Layouts 1.9
import QtQuick.Controls 2.4 as QQC2
import org.kde.kirigami 2.6 as Kirigami

Kirigami.ApplicationWindow {
    id: root
    
    globalDrawer: GlobalDrawer{}
    
    contextDrawer: Kirigami.ContextDrawer {
        id: contextDrawer
    }
    
    pageStack.initialPage: Qt.resolvedUrl("qrc:/UI/MainPage.qml")
}

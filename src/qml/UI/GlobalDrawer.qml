import QtQuick 2.11
import QtQuick.Layouts 1.9
import QtQuick.Controls 2.4 as QQC2
import org.kde.kirigami 2.6 as Kirigami

Kirigami.GlobalDrawer {
    id: globalDrawer
    actions: [
        Kirigami.Action {
            text: "View"
            iconName: "view-list-icons"
        }
    ]
    topContent: [
        // Qt <Item> is not the same as Qt <Action>
    ]
}

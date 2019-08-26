#include <qt5/QtGui/QGuiApplication>
#include <qt5/QtQml/QQmlApplicationEngine>
#include <qt5/QtCore/QStringLiteral>

// #include <KF5/KCoreAddons/KAboutData>
// #include <KF5/KI18n/KLocalizedString>

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/UI/Root.qml"))); //qrc:{not the actual path rather it is the file as referenced in the resources.qrc file}
    return app.exec();
}

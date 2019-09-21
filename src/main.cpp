#include <qt5/QtGui/QGuiApplication>
#include <qt5/QtQml/QQmlApplicationEngine>
#include <qt5/QtCore/QStringLiteral>
#include <qt5/QtCore/QCommandLineParser>
#include <qt5/QtSvg/QtSvg>
#include <qt5/QtSvg/QSvgRenderer>
#include <qt5/QtQuick/QQuickImageProvider>
#include <qt5/QtQuick/QQuickAsyncImageProvider>

#include <KF5/KCoreAddons/KAboutData>
#include <KF5/KI18n/KLocalizedString>

#include "MyClass.h"

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    KLocalizedString::setApplicationDomain("testKirigami");
    
    KAboutData aboutData(
                         // The program name used internally. (componentName)
                         QStringLiteral("testKirigami"),
                         // A displayable program name string. (displayName)
                         i18n("testKirigami"),
                         // The program version string. (version)
                         QStringLiteral("1.0"),
                         // Short description of what the app does. (shortDescription)
                         i18n("Testing Kirigami Framework"),
                         // The license this code is released under
                         KAboutLicense::GPL,
                         // Copyright Statement (copyrightStatement = QString())
                         i18n("(c) 2019"),
                         // Optional text shown in the About box.
                         // Can contain any information desired. (otherText)
                         i18n("Some text..."),
                         // The program homepage string. (homePageAddress = QString())
                         QStringLiteral("http://example.com/"),
                         // The bug report email address
                         // (bugsEmailAddress = QLatin1String("submit@bugs.kde.org")
                         QStringLiteral("submit@bugs.kde.org"));
    aboutData.addAuthor(i18n("Name"), i18n("Task"),
                        QStringLiteral("your@email.com"),
                        QStringLiteral("http://your.website.com"), QStringLiteral("OSC Username"));
    KAboutData::setApplicationData(aboutData);
    
    QCommandLineParser parser;
    aboutData.setupCommandLine(&parser);
    parser.process(app);
    aboutData.processCommandLine(&parser);
    
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/UI/Root.qml"))); //qrc:{not the actual path rather it is the file as referenced in the resources.qrc file}
    
    // Attach a singal in QML to a C++ class
    QObject* root = engine.rootObjects().first();   // References the Application Window itself as root
    QObject* pageStack = root->findChild<QObject*>(QString("globalDrawer"));
    QObject* mainPage = pageStack->findChild<QObject*>(QString("mainPage"));
    QObject* mainPage2 = engine.findChild<QObject*>(QString("mainPage"));
    QObject* getText = mainPage->findChild<QObject*>(QString("getText"));
    MyClass myObject;
    QObject::connect(mainPage2, SIGNAL(qmlSignal(QString)), &myObject, SLOT(cppSlot(QString)));
    
    return app.exec();
}

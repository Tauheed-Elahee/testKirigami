#include <qt5/QtGui/QGuiApplication>
#include <qt5/QtQml/QQmlApplicationEngine>
#include <qt5/QtCore/QStringLiteral>
#include <qt5/QtCore/QCommandLineParser>
#include <qt5/QtSvg/QtSvg>
#include <qt5/QtSvg/QSvgRenderer>
#include <qt5/QtQuick/QQuickImageProvider>
#include <qt5/QtQuick/QQuickAsyncImageProvider>
#include <qt5/QtQml/QQmlComponent>
#include <qt5/QtQml/QQmlContext>

#include <KF5/KCoreAddons/KAboutData>
#include <KF5/KI18n/KLocalizedString>

#include "MyClass.h"
#include "todomodel.h"

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
                         KAboutLicense::GPL_V3,
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
    
    // Did not work
    /*
    MyClass myClass;
    qmlRegisterType<MyClass>("i.did.it.myclass", 0, 1, "MyClass");
    
    QQmlContext* context = new QQmlContext(engine.rootContext());
    context->setContextProperty("MyClass", &myClass);
    */
    
    QScopedPointer<MyClass> myClass(new MyClass);
    qmlRegisterType<ToDoModel>("ToDo", 1, 0, "ToDoModel");
    
    QQmlApplicationEngine engine;
    
    engine.rootContext()->setContextProperty("myClass", myClass.data());
    
    engine.load(QUrl(QStringLiteral("qrc:/UI/main.qml"))); //qrc:{not the actual path rather it is the file as referenced in the resources.qrc file}
    
    if (engine.rootObjects().isEmpty()) {
        return -1;
    }
    
    return app.exec();
}

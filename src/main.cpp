#include <qt5/QtGui/QGuiApplication>
#include <qt5/QtQml/QQmlApplicationEngine>
#include <qt5/QtCore/QStringLiteral>
#include <qt5/QtCore/QCommandLineParser>

#include <KF5/KCoreAddons/KAboutData>
#include <KF5/KI18n/KLocalizedString>

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);
    KLocalizedString::setApplicationDomain("tutorial1");
    
    KAboutData aboutData(
                         // The program name used internally. (componentName)
                         QStringLiteral("tutorial1"),
                         // A displayable program name string. (displayName)
                         i18n("Tutorial 1"),
                         // The program version string. (version)
                         QStringLiteral("1.0"),
                         // Short description of what the app does. (shortDescription)
                         i18n("Displays a KMessageBox popup"),
                         // The license this code is released under
                         KAboutLicense::GPL,
                         // Copyright Statement (copyrightStatement = QString())
                         i18n("(c) 2015"),
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
    return app.exec();
}

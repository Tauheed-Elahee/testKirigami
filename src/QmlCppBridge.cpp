#include <iostream>

#include <qt5/QtCore/QString>
#include <qt5/QtCore/QObject>
#include <qt5/QtCore/QMessageLogger>
#include <qt5/QtCore/qlogging.h>

#include "QmlCppBridge.h"

#include "QmlCppBridge.moc"

QmlCppBridge::QmlCppBridge(QObject* parent) : QObject(parent)
{
}


void QmlCppBridge::printHello() {
    std::cout << "Hello, QML!";
}


void QmlCppBridge::cppSlot(const QString &msg) {
    std::cout << "Called the C++ slot with message: " << msg.toStdString() << std::endl;
}

#include <iostream>

#include <qt5/QtCore/QString>
#include <qt5/QtCore/QObject>

#include "MyClass.h"

#include "MyClass.moc"

void MyClass::cppSlot(const QString &msg) {
    std::cout << "Called the C++ slot with message: " << msg.toStdString() << std::endl;
}

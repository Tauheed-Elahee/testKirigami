/*
 * <one line to give the program's name and a brief idea of what it does.>
 * Copyright (C) 2019  <copyright holder> <email>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "MyClass.h"

using namespace std;

MyClass::MyClass(QObject* parent) : QObject(parent)
{
    this->timesPressed = 0;
}

void MyClass::test()
{
    qDebug() << "Hello from C++";
    timesPressed++;
    cout << timesPressed << "\tUsing cout in C++\n";
    this->load_and_dump("");
    cout << timesPressed << endl;
}

void MyClass::load_and_dump(QString QinFilename, QString QoutFilename)
{
    string inFilename = QinFilename.toStdString();
    string outFilename = QoutFilename.toStdString();
    // Do not know what is going on with filename
    cout << inFilename << endl;
    cout << inFilename.compare("") << endl;
    if(!inFilename.compare("") && !outFilename.compare("")) {
        inFilename = "../../test.txt";
        ifstream inFile(inFilename);
        cout << inFile.is_open() << endl;
        if(inFile.is_open()) cout << inFile.rdbuf();
    } else if (inFilename.compare("") && !outFilename.compare("")) {
        ifstream inFile(inFilename);
        cout << inFile.is_open() << endl;
        if(inFile.is_open()) cout << inFile.rdbuf();
    } else if (!inFilename.compare("") && outFilename.compare("")) {
        ofstream outFile(outFilename);
        outFile << outFile.is_open() << endl;
        if(outFile.is_open()) outFile << "Hello from C++\n";
    } else if (inFilename.compare("") && outFilename.compare("")) {
        ifstream inFile(inFilename);
        ofstream outFile(outFilename);
        outFile << inFile.is_open() << endl;
        outFile << outFile.is_open() << endl;
        if(outFile.is_open()) outFile << inFile.rdbuf();
    }
}

void MyClass::print_QML_text(QString text)
{
    cout << text.toStdString() << endl;
}

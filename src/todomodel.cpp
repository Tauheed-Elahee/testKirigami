/*
 * <one line to give the program's name and a brief idea of what it does.>
 * Copyright 2020  <copyright holder> <email>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License or (at your option) version 3 or any later version
 * accepted by the membership of KDE e.V. (or its successor approved
 * by the membership of KDE e.V.), which shall act as a proxy
 * defined in Section 14 of version 3 of the license.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#include "todomodel.h"

ToDoModel::ToDoModel(QObject *parent)
    : QAbstractListModel(parent)
{
}

int ToDoModel::rowCount(const QModelIndex& parent) const
{
    if(parent.isValid())
        return 0;
    
    // FIXME: Implement me!
    return 100;
}

QVariant ToDoModel::data(const QModelIndex& index, int role) const
{
    if (!index.isValid())
        return QVariant();
    
    // FIXME: Implement me!
    switch (role) {
        case DoneRole:
            return QVariant(false);
        case DescriptionRole:
            return QVariant(QStringLiteral("Test description"));
    }
    return QVariant();
}

bool ToDoModel::setData(const QModelIndex& index, const QVariant& value, int role)
{
    if(data(index, role) != value) {
        // FIXME: Implement me!
        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}

Qt::ItemFlags ToDoModel::flags(const QModelIndex& index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;
    
    return Qt::ItemIsEditable; // FIXME: Implement me!
}

QHash<int, QByteArray> ToDoModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[DoneRole] = "done";
    names[DescriptionRole] = "description";
    return names;
}

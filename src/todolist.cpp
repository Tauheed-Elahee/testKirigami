/*
 * <one line to give the program's name and a brief idea of what it does.>
 * Copyright (C) 2020  <copyright holder> <email>
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

#include "todolist.h"

ToDoList::ToDoList(QObject* parent) : QObject(parent)
{
    mItems.append({ true, QStringLiteral("Wash the car") });
    mItems.append({ false, QStringLiteral("Fix the sink") });
}

QVector<ToDoItem> ToDoList::items() const
{
    return mItems;
}

bool ToDoList::setItemAt(int index, const ToDoItem& item)
{
    if (index < 0 || index > mItems.size())
        return false;
    
    const ToDoItem &oldItem = mItems.at(index);
    if (item.done == oldItem.done && item.description == oldItem.description)
        return false;
    
    mItems[index] = item;
    return true;
}

void ToDoList::appendItem()
{
    emit preItemAppended();
    
    ToDoItem item;
    item.done = false;
    mItems.append(item);
    
    emit postItemAppended();
}

void ToDoList::removeCompletedItems()
{
    for (int i = 0; i < mItems.size(); ) {
        if (mItems.at(i).done) {
            emit preItemRemoved(i);
            
            mItems.removeAt(i);
            
            emit postItemRemoved();
        } else {
            i++;
        }
    }
}

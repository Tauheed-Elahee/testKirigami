import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12 as QQC2
import org.kde.kirigami 2.10 as Kirigami

Kirigami.AboutPage {
    aboutData: {
        "displayName"           :   "Kirigami App",
        "productName"           :   "kirigami/app",
        "componentName"         :   "kirigamiapp",
        "shortDescription"      :   "A Kirigami example",
        "homepage"              :   "https://www.tauheed-elahee.com",
        "bugAddress"            :   "bugs@tauheed-elahee.com",
        "version"               :   "22019.08",
        "otherText"             :   "Other text",
        "authors"               :   [
                                        {
                                            "name"          :   "Tauheed Elahee",
                                            "task"          :   "student",
                                            "emailAddress"  :   "tauheed@tauheed-elahee.com",
                                            "webAddress"    :   "",
                                            "ocsUsername"   :   ""
                                        }
                                    ],
        "credits"               :   [],
        "translators"           :   [],
        "licenses"              :   [
                                        {
                                            "name"  :   "GPL v3",
                                            "text"  :   "long, boring license text",
                                            "spdx"  :   "GPL-3.0"
                                        }
                                    ],
        "copyrightStatement"    :   "(c) 2019 Tauheed Elahee",
        "desktopFileName"       :   "org.kde.kirigamiapp"
    }
}

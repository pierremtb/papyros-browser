import QtQuick 2.2
import Material 0.1
import Material.ListItems 0.1 as ListItem
import Material.WebApps 0.1
import QtWebEngine 1.0
import Qt.labs.settings 1.0
import "script.js" as Tab

ApplicationWindow {
    id:browser
    initialPage: page
    title: 'Browser'
    width: 1100
    height: 650
    property string homeurl: "http://google.com"
    Settings {
        property alias homeurl: browser.homeurl
    }
    Page {
        id: page
        title: ""
        tabs: [
            tabS0.title
        ]
        actions: [
            Action {
                iconName: "content/add"
                name: "New Tab"
                onTriggered: {
                    page.tabs.push('New Tab')
                    page.tabs[page.tabs.length - 1] = Tab.setNewTabTitle(page.tabs.length - 1)
                    page.tabs = page.tabs
                    console.log(page.tabs.length);
                }
            },
            Action {
                iconName: "action/home"
                name: "Home"
                onTriggered: console.log(Tab.setThisTabUrl(browser.homeurl))
            
            },
            Action {
                iconName: "navigation/close"
                name: "Close"
                onTriggered: page.tabs.length > 1 ? Tab.closeCurrentTab() : Qt.quit()
            }
        ]
        Settings {
            id: settings
            property variant recentTabs: []
        }
        TabView {
            id: tabView
            anchors.fill: parent
            currentIndex: page.selectedTab
            model: tabs
        }        
        VisualItemModel {
            id: tabs
            WebEngineView {
                id: tabS0
                url: browser.homeurl
                width: tabView.width
                height: tabView.height
                visible: true
                onLoadingChanged:{
                    bar.text = Tab.getCurrentTabUrl();
                    Tab.setCurrentTabTitle(page.selectedTab);
                }
            }
            WebEngineView {
                id: tabS1
                url: browser.homeurl
                width: tabView.width
                height: tabView.height
                visible: true
                onLoadingChanged: {
                    bar.text = Tab.getCurrentTabUrl();
                    Tab.setCurrentTabTitle(page.selectedTab);
                }
            }
            WebEngineView {
                id: tabS2
                url: browser.homeurl
                width: tabView.width
                height: tabView.height
                visible: true
                onLoadingChanged: {
                bar.text = Tab.getCurrentTabUrl();
                Tab.setCurrentTabTitle(page.selectedTab);
             }
            }
            WebEngineView {
                id: tabS3
                url: browser.homeurl
                width: tabView.width
                height: tabView.height
                visible: true
                onLoadingChanged: {
                bar.text = Tab.getCurrentTabUrl();
                Tab.setCurrentTabTitle(page.selectedTab);
             }
            }
            WebEngineView {
                id: tabS4
                url: browser.homeurl
                width: tabView.width
                height: tabView.height
                visible: true
                onLoadingChanged: {
                bar.text = Tab.getCurrentTabUrl();
                Tab.setCurrentTabTitle(page.selectedTab);
             }
            }
        }
    }
    Rectangle {
        width:800
        height:units.dp(64)
        color:'transparent'
        z:200
        x:0
        y:0
        IconButton {
            id: back
            name: "navigation/arrow_back"
            size: units.dp(27)
            color: 'white'
            visible:true
            x:5
            anchors.verticalCenter: parent.verticalCenter
            onTriggered: Tab.goBackCurrentTab(page.selectedTab)
        }
        IconButton {
            id: forward
            name: "navigation/arrow_forward"
            size: units.dp(27)
            color: 'white'
            x:45
            visible:true
            anchors.verticalCenter: parent.verticalCenter
            onTriggered: Tab.goForwardCurrentTab(page.selectedTab)
        }
        TextInput {
            id:bar
            text: Tab.getCurrentTabUrl()
            x:85
            anchors.verticalCenter: parent.verticalCenter
            z:201
            width:700
            color: "white"
            font.pointSize: 15
            Keys.onEnterPressed: {
                console.log(Tab.setThisTabUrl(text));
                text = Tab.getCurrentTabUrl();
            }
        }
    }
    ActionButton {
        id:bookmark
        width:40
        height:40
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: 20
        anchors.rightMargin: 70
         visible:false
        backgroundColor: '#FFEB3B'
        iconName: "action/bookmark_outline"
    }
    ActionButton {
        id:download
        width:40
        height:40
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: 70
        anchors.rightMargin: 20
         visible:false
        backgroundColor: '#FFEB3B'
        iconName: "file/file_download"
    }
    ActionButton {
        id:more
        width:40
        height:40
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.margins: 20
        backgroundColor: 'gray'
        iconName: "navigation/more_horiz"
        MouseArea {
                id: ma_go
         hoverEnabled: true
                anchors.fill: parent
                onEntered: {
                    bookmark.visible = true
                    download.visible = true
                }
                onExited: {
                    bookmark.visible = false
                    download.visible = false
                }
            }
    }
}
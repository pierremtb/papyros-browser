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
    property string accentchosen: "#F44336"
    property string primarychosen: "#03A9F4"
    height: 650
    property string homeurl: "http://google.com"
    theme {
        accentColor: accentchosen
        primaryColor: primarychosen
    }        
    Settings {
        property alias accentchosen: browser.accentchosen
        property alias primarychosen: browser.primarychosen
    }
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
                iconName: "action/home"
                name: "Home"
                onTriggered: console.log(Tab.setThisTabUrl(browser.homeurl))
            
            },
            Action {
                iconName: "navigation/refresh"
                name: "Close"
                onTriggered: Tab.refreshCurrentTab(page.selectedTab)
            },
            Action {
                iconName: "action/settings"
                name: "Settings"
                onTriggered: {
                	settings_d.open();
                	shadow_drawer.opacity = 1;
                }
            
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
        width:80
        height:units.dp(64)
        color:Theme.primaryColor
        z:10
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
            z:202
            visible:true
            anchors.verticalCenter: parent.verticalCenter
            onTriggered: Tab.goForwardCurrentTab(page.selectedTab)

        }
        
    }
    TextInput {
            id:bar
            text: Tab.getCurrentTabUrl()
            selectByMouse: true
            selectionColor: 'white'
            selectedTextColor: Theme.primaryColor
            x:85
            y:15
            z:20
            width:browser.width - 220
            color: "white"
            font.pointSize: 14
            Keys.onEnterPressed: {
                console.log(Tab.setThisTabUrl(text));
                text = Tab.getCurrentTabUrl();
            }
        }

        IconButton {
            id: close
            name: "navigation/close"
            size: units.dp(20)
            color: 'white'
            anchors.right: parent.right
            anchors.rightMargin:15
            y:68
            z:20

            visible:true
            onTriggered: page.tabs.length > 1 ? Tab.closeCurrentTab() : tabS0.url = homeurl

        }
        IconButton {
            id: add
            name: "content/add"
            size: units.dp(20)
            color: 'white'
            anchors.right: parent.right
            anchors.rightMargin:50
            y:68
            z:20

            visible:true
            onTriggered: {
            	page.tabs.push(homeurl);
            	page.tabs = page.tabs
            }

        }

    ActionButton {
        id:translate
        width:35
        height:35
        anchors.bottom: parent.bottom
        property bool bookmarked: false
        anchors.right: parent.right
        anchors.bottomMargin: more.fabhidden ? -70 : !more.subfabhidden ? 150 : 13
        anchors.rightMargin: more.fabhidden ? -70 : 13
        backgroundColor: '#3F51B5'
        iconName: "action/translate"
        onClicked: translate_pop.visible = true
        Behavior on anchors.bottomMargin {
            NumberAnimation { duration: 200 }
        }
    }
    ActionButton {
        id:bookmark
        width:35
        height:35
        anchors.bottom: parent.bottom
        property bool bookmarked: false
        anchors.right: parent.right
        anchors.bottomMargin: more.fabhidden ? -70 : !more.subfabhidden ? 105 : 13
        anchors.rightMargin: more.fabhidden ? -70 : 13
        backgroundColor: '#E91E63'
        iconName: bookmarked ? "action/bookmark" : "action/bookmark_outline"
        onClicked: bookmarked = !bookmarked
        Behavior on anchors.bottomMargin {
            NumberAnimation { duration: 200 }
        }
    }
    ActionButton {
        id:download
        width: 35
        height: 35
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: more.fabhidden ? -70 : !more.subfabhidden ? 60 : 13
        anchors.rightMargin: more.fabhidden ? -70 : 13
        backgroundColor: '#009688'
        iconName: "file/file_download"
        Behavior on anchors.bottomMargin {
            NumberAnimation { duration: 200 }
        }
    }
    ActionButton {
        id:more
        width:  40
        height: 40
        property bool fabhidden: false
        property bool subfabhidden: true
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        anchors.bottomMargin: fabhidden ? -25 : 10
        anchors.rightMargin: fabhidden ? -25 : 10 
        backgroundColor: fabhidden ? '#424242' : Theme.accentColor
        iconName:  fabhidden ? "" :  subfabhidden ? "navigation/more_horiz" : 'hardware/keyboard_arrow_down'
        Behavior on anchors.bottomMargin {
            NumberAnimation { duration: 200 }
        }
        Behavior on anchors.rightMargin {
            NumberAnimation { duration: 200 }
        }
        MouseArea {
            id: ma_go
         	hoverEnabled: true
            anchors.fill: parent
            onEntered: {
                more.subfabhidden = !more.subfabhidden 
            }
            onDoubleClicked: more.fabhidden = !more.fabhidden 
        }
    }
    
    Rectangle {
        id:translate_pop
        anchors.fill: parent
        anchors.topMargin: page.actionBar.height + units.dp(48)
        color: Qt.rgba(0.1, 0.1, 0.1, 0.5)
      	visible:false

        z:1

        View
        {
        	width:600
        	height:250
        	elevation:4
        	anchors.centerIn: parent
        	Column {
        		anchors.centerIn: parent
        		Text {
        			anchors.horizontalCenter: parent.horizontalCenter
        			text: 'Translate'
        			font.pointSize: 20
        		}
        		TextField {
		            text: /*'https://translate.google.com/translate?sl=auto&tl=fr&js=y&prev=_t&hl=en&ie=UTF-8&u=' + tabS0.url + '&edit-text=&act=url'*/ tabS0.url
		            width: 500
		            placeholderText: "URL to translate"
		            floatingLabel: true
		            anchors.horizontalCenter: parent.horizontalCenter
        		}
		        ListItem.SimpleMenu {
	        		id:dest_l
	                text: "Destination Language"
	                margins: units.dp(0)
	                model: ["en", "fr", "de","es","ru"]
		            }
		        Row {
			        spacing:10
			        anchors.horizontalCenter: parent.horizontalCenter
			        Button {
			            text: "Go !"
			            elevation: 1
			            backgroundColor: Theme.accentColor
			            onClicked: {
				            Tab.setThisTabUrl('https://translate.google.com/translate?sl=auto&tl='+dest_l.model[dest_l.selectedIndex]+'&js=y&prev=_t&hl=en&ie=UTF-8&u=' + tabS0.url + '&edit-text=&act=url');
				            translate_pop.visible = false;
			            }
			        }
					Button {
			            text: "Abort"
			            elevation: 1
			            onClicked: {
				            translate_pop.visible = false;
			            }
			        }
		        }
        	}
        }
    }

  	NavigationDrawer {
  		id:settings_d
  		z:25
  		mode: "right"
  		width:units.dp(350)
  		MouseArea {
  			anchors.fill:parent
  			onPressed:
  			{
  				settings_d.close();
  				shadow_drawer.opacity = 0;
  			}

  		}
		Column {
		    width: parent.width
		    spacing: units.dp(0)
		    View {
		        id: view
		        height: label.height + units.dp(30)
		        width: parent.width
		        Label {
		            id: label
		            anchors {
		                left: parent.left
		                right: parent.right
		                bottom: parent.bottom
		                leftMargin: units.dp(16)
		                rightMargin: units.dp(16)
		                centerIn:parent
		            }
		            text:  'Settings'
		            style: "title"
		            font.pixelSize: units.dp(30)
		            textFormat: Text.RichText
		            color:'black'
		        }
		    }
			ListItem.Header {
		        text: "General"           
		    }
		    
            ListItem.Standard {
                text: ""
                height:60
                TextField {
		            id:home_chooser
		            width: parent.width * 0.9
		            text: homeurl
		            placeholderText: "Home URL"
		            floatingLabel: true
		            anchors.centerIn: parent
        		}
        		anchors.bottomMargin:30
            }
            ListItem.Header {
		                 
		    }
            ListItem.Header {
                text: "Theme"                 
            }
            ListItem.Standard  {
                id:primary_chooser
                text: 'Primary Color'
                Rectangle {
                    id: primarycolor_sample
                    width:30
                    height:30
                    radius: width*0.5
                    color: Theme.primaryColor
                    anchors {
                            top: parent.top
                            right: parent.right
                            rightMargin:20
                            topMargin:5
                    }
                    MouseArea {
                    	anchors.fill: parent
                    	onPressed: primary_chooser_palette.open(primarycolor_sample, units.dp(4), units.dp(-4))
                    }
                }
            }
            ListItem.Standard  {
                id:accent_chooser
                text: 'Accent Color'
                Rectangle {
                    id: accentcolor_sample
                    width:30
                    height:30
                    radius: width*0.5
                    color: Theme.accentColor
                    anchors {
                            top: parent.top
                            right: parent.right
                            rightMargin:20
                            topMargin:5
                    }
                    MouseArea {
                    	anchors.fill: parent
                    	onPressed: accent_chooser_palette.open(accentcolor_sample, units.dp(4), units.dp(-4))
                    }
                }
            }
           AccentPaletteDropdown {
           		id:accent_chooser_palette
           }
           PrimaryPaletteDropdown {
           		id:primary_chooser_palette
           }
		    
		}
		Item {
		    anchors {
		        left: parent.left
		        right: parent.right
		        bottom: parent.bottom
		        margins: units.dp(16)
		    }
		    height: units.dp(50)
		   	Row {
		        spacing:10
		        anchors.horizontalCenter: parent.horizontalCenter
		        Button {
		            text: "Save"
		            elevation: 1
		            backgroundColor: Theme.accentColor
		            onClicked: {
			            	settings_d.close();
							browser.accentchosen = accentcolor_sample.color;
							browser.primarychosen = primarycolor_sample.color;
							shadow_drawer.opacity = 0;
							homeurl = home_chooser.text
		            }
		        }
				Button {
		            text: "Abort"
		            elevation: 1
		            onClicked: {
			            settings_d.close();
							shadow_drawer.opacity = 0;
		            }
		        }
		    }
		}

  	}
  	Rectangle {
        id: shadow_drawer
        width:browser.width
        height:browser.height
        color: Qt.rgba(0.1, 0.1, 0.1, 0.5)
        opacity: 0
      	z:24
      	Behavior on opacity {
            NumberAnimation { duration: 200 }
        }
    }
}

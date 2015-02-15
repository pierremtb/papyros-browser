function setThisTabUrl(url) {
     switch(page.selectedTab)
        {
            case 0:
            	console.log(tabS0.url);
                tabS0.url = url;
                bar.text = bar.text;
                break;
            case 1:
                tabS1.url = url;
                bar.text = bar.text;
                break;
            case 2:
                tabS2.url = url;
                bar.text = bar.text;
                break;
            case 3:
                tabS3.url = url;
                bar.text = bar.text;
                break;
            case 4:
                tabS4.url = url;
                bar.text = bar.text;
                break;
            default:
                console.log('non');
        }
}
function setCurrentTabTitle(currenttabindex) {
     switch(currenttabindex)
        {
            case 0:
            	page.tabs[currenttabindex]= tabS0.title.toUpperCase()
                page.tabs = page.tabs
                break;
            case 1:
                page.tabs[currenttabindex]=tabS1.title.toUpperCase()
                page.tabs = page.tabs
                break;
            case 2:
                page.tabs[currenttabindex]=tabS2.title.toUpperCase()
                page.tabs = page.tabs
                break;
            case 3:
                page.tabs[currenttabindex]=tabS3.title.toUpperCase()
                page.tabs = page.tabs
                break;
            case 4:
                page.tabs[currenttabindex]=tabS4.title.toUpperCase()
                page.tabs = page.tabs
                break;
            default:
                console.log(newtabindex);
        }
}
function setNewTabTitle(newtabindex) {
     switch(newtabindex)
        {
            case 0:
            
                break;
            case 1:
                return tabS1.title
                break;
            case 2:
                return tabS2.title
                break;
            case 3:
                return tabS3.title
                break;
            case 4:
                return tabS4.title
                break;
            default:
                console.log(newtabindex);
        }
}
function getCurrentTabUrl() {
     switch(page.selectedTab)
        {
            case 0:
            	console.log(tabS0.url);
                return tabS0.url;
                break;
            case 1:
                return tabS1.url;
                break;
            case 2:
                return tabS2.url;
                break;
            case 3:
                return tabS3.url;
                break;
            case 4:
                return tabS4.url;
                break;
            default:
                console.log('non');
        }
}
function goBackCurrentTab(currenttabindex) {
     switch(page.selectedTab)
        {
            case 0:
            	tabS0.goBack();
                break;
            case 1:
                tabS1.goBack();
                break;
            case 2:
                tabS2.goBack();
                break;
            case 3:
                tabS3.goBack();
                break;
            case 4:
                tabS4.goBack();
                break;
            default:
                console.log('non');
        }
}
function goForwardCurrentTab(currenttabindex) {
     switch(page.selectedTab)
        {
            case 0:
            	tabS0.goForward();
                break;
            case 1:
                tabS1.goForward();
                break;
            case 2:
                tabS2.goForward();
                break;
            case 3:
                tabS3.goForward();
                break;
            case 4:
                tabS4.goForward();
                break;
            default:
                console.log('non');
        }
}
function refreshCurrentTab(currenttabindex) {
     switch(page.selectedTab)
        {
            case 0:
                tabS0.reload();
                break;
            case 1:
                tabS1.reload();
                break;
            case 2:
                tabS2.reload();
                break;
            case 3:
                tabS3.reload();
                break;
            case 4:
                tabS4.reload();
                break;
            default:
                console.log('non');
        }
}
function closeCurrentTab() {
     page.tabs.splice(page.selectedTab, 1);
     page.tabs = page.tabs;
     switch(page.selectedTab)
        {
            case 0:
              
                break;
            case 1:
                
                break;
            case 2:
              
                break;
            case 3:
               
                break;
            case 4:
              
                break;
            default:
                console.log('non');
        }
}
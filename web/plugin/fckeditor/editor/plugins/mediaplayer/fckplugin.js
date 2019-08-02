// Register the related command. 
// RegisterCommand takes the following arguments: CommandName, DialogCommand 
// FCKDialogCommand takes the following arguments: CommandName, Dialog Title, Path to HTML file, Width, Height 
 
FCKCommands.RegisterCommand( 'mediaplayer', new FCKDialogCommand( 'mediaplayer', FCKLang.InsertLinkDlgTitle,  
FCKPlugins.Items['mediaplayer'].Path + 'fck_mediaplayer.html', 340, 200 ) ) ; 
 
// Create the toolbar button. 
// FCKToolbarButton takes the following arguments: CommandName, Button Caption 
 
var oInsertLinkItem = new FCKToolbarButton( 'mediaplayer', FCKLang.InsertLinkBtn ) ; 
oInsertLinkItem.IconPath = FCKPlugins.Items['mediaplayer'].Path + 'InsertLink.gif' ; 
FCKToolbarItems.RegisterItem( 'mediaplayer', oInsertLinkItem ) ; 
 
// The object used for all InsertLink operations. 
var FCKInsertLink = new Object() ; 
 
// Add a new InsertLink at the actual selection.  
// This function will be called from the HTML file when the user clicks the OK button. 
// This function receives the values from the Dialog 
 
var media_types = ['mp3', 'rm', 'rmvb','mpg','avi','wma','wmv'];
 
FCKInsertLink.Add = function( linkname, caption ) 
{
    var ext = getFileExt(linkname);
    if (ext != 'rm') {
        alert('不支持的文件类型');
        return;
    }
    
    if(linkname.substr(0,4) != "http" && linkname.substr(0,4) != "HTTP") 
    linkname = "http://"+linkname ; 
    if (ext == 'rm') {
    var rm_play_code = '<span><OBJECT ID=video1 CLASSID="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA" HEIGHT=288 WIDTH=352> <param name="_ExtentX" value="9313">' +
'      <param name="_ExtentY" value="7620">' +
'      <param name="AUTOSTART" value="1">' + 
'      <param name="SHUFFLE" value="0">' + 
'      <param name="PREFETCH" value="0">' + 
'      <param name="NOLABELS" value="0">' + 
'      <param name="SRC" value="' + linkname + '">' + 
'      <param name="CONTROLS" value="ImageWindow">' + 
'      <param name="CONSOLE" value="Clip1">' + 
'      <param name="LOOP" value="0">' + 
'      <param name="NUMLOOP" value="0">' + 
'      <param name="CENTER" value="0">' + 
'      <param name="MAINTAINASPECT" value="0">' + 
'      <param name="BACKGROUNDCOLOR" value="#000000"><embed SRC type="audio/x-pn-realaudio-plugin" CONSOLE="Clip1" CONTROLS="ImageWindow" HEIGHT="288" WIDTH="352" AUTOSTART="false"> </OBJECT> </span><br />';
        FCK.InsertHtml(rm_play_code) ; 
    } else if (ext == 'mpg') {
         var mpg_play_code = '<span><object classid="clsid:05589FA1-C356-11CE-BF01-00AA0055595A" id="ActiveMovie1" width="239" height="' +
                                  '<param name="Appearance" value="0">' + 
                                  '<param name="AutoStart" value="-1">' + 
                                  '<param name="AllowChangeDisplayMode" value="-1">' + 
                                  '<aram name="AllowHideDisplay" value="0">' + 
                                  '<param name="AllowHideControls" value="-1">' + 
      '<param name="AutoRewind" value="-1">' + 
'      <param name="Balance" value="0">' + 
'      <param name="CurrentPosition" value="0">' + 
'      <param name="DisplayBackColor" value="0">' + 
'      <param name="DisplayForeColor" value="16777215">' + 
'      <param name="DisplayMode" value="0">' + 
'      <param name="Enabled" value="-1">' + 
'      <param name="EnableContextMenu" value="-1">' + 
'      <param name="EnablePositionControls" value="-1">' + 
'      <param name="EnableSelectionControls" value="0">' + 
'      <param name="EnableTracker" value="-1">' + 
'      <param name="Filename" value="' + linkname + '" valuetype="ref">' + 
'      <param name="FullScreenMode" value="0">' + 
'      <param name="MovieWindowSize" value="0">' + 
'      <param name="PlayCount" value="1">' + 
'      <param name="Rate" value="1">' + 
'      <param name="SelectionStart" value="-1">' + 
'      <param name="SelectionEnd" value="-1">' + 
'      <param name="ShowControls" value="-1">' + 
'      <param name="ShowDisplay" value="-1">' + 
'      <param name="ShowPositionControls" value="0">' + 
'      <param name="ShowTracker" value="-1">' + 
'      <param name="Volume" value="-480">' + 
'      </object></span><br />';
        FCK.InsertHtml(mpg_play_code) ; 
    }
    
    function getFileExt(filename) {
        var i = filename.lastIndexOf('.');
        return filename.slice(i + 1, filename.length);
    }
} 

//End code

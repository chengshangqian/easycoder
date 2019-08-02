//var tmpUploadItemUrl = "/common/editor/plugins/upload/fck_upload.jsp";
var tmpUploadItemUrl = "/plug-in/fckeditor/editor/plugins/upload/fck_upload33.jsp";

FCKCommands.RegisterCommand( 'upload', 
                             new FCKDialogCommand( 'upload', 
							                       FCKLang.UploadDlgTitle, 
												   tmpUploadItemUrl,//FCKConfig.UploadItemUrl,
												   450, 
												   260 ) 
		                   ) ; 

var oUploadItem = new FCKToolbarButton( 'upload', FCKLang.UploadBtnTiptool ) ;
oUploadItem.IconPath = FCKPlugins.Items['upload'].Path + 'upload.gif' ; 
FCKToolbarItems.RegisterItem( 'upload', oUploadItem ) ; 

var FCKUploadResult = new Object() ; 

FCKUploadResult.ShowFilename = function( filename ) {
	FCKeditorAPI.GetInstance('FCKeditor_Basic').InsertHtml( '<img src=\"'+filename+'\">' ) ;
}

FCKUploadResult.ShowHtml = function( html ) {
	FCKeditorAPI.GetInstance('FCKeditor_Basic').InsertHtml( html ) ;
}
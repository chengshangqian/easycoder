<script src="<%=request.getContextPath()%>/common/fckeditor.js"></script>
<script>
var sBasePath = "<%=request.getContextPath()%>/common/";
if (typeof(dynaUploadItemUrl)=='undefined' || dynaUploadItemUrl==null) {
	var dynaUploadItemUrl=sBasePath+'editor/plugins/upload/fck_upload.html';
}
var oFCKeditor = new FCKeditor( 'FCKeditor_Basic' ) ;

oFCKeditor.BasePath		= sBasePath ;
oFCKeditor.Config['CustomConfigurationsPath'] = sBasePath + 'fckconfig4cms.js' ;
oFCKeditor.ToolbarSet = 'cms' ;

function fckInitDefaultHeight(sDefault,h) {	
	oFCKeditor.Value		= sDefault ;
	oFCKeditor.Height		= h ;
	oFCKeditor.Create() ;
}

function fckInitDefault(sDefault) {
	fckInitDefaultHeight(sDefault,300);
}

function fckInit() {
	fckInitDefault('');
}

</script>
<%
/*** get xhtml
 * FCKeditorAPI.GetInstance('FCKeditor_Basic').GetXHTML( true ) ) ;		// "true" means you want it formatted.
 */

/*** set xhtml
 * FCKeditorAPI.GetInstance('FCKeditor_Basic').SetHTML(s);
 */

/*** insert html
 *  
 var oFCKeditor = FCKeditorAPI.GetInstance('FCKeditor_Basic');
 if ( oFCKeditor.EditMode == FCK_EDITMODE_WYSIWYG )
	{
		// Insert the desired HTML.
		oFCKeditor.InsertHtml( '- This is some <a href="/Test1.html">sample</a> HTML -' ) ;
	}
 else
		alert( 'You must be on WYSIWYG mode!' ) ;
 */

/*** ExecuteCommand
 * FCKeditorAPI.GetInstance('FCKeditor_Basic').Commands.GetCommand( commandName ).Execute() ;
 */
%>
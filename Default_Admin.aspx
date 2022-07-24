<%@ Page Language="C#" %>

<%@ Register Src="_Menu3.ascx" TagName="_Menu3" TagPrefix="uc2" %>


<%@ Register Src="_Header.ascx" TagName="_Header" TagPrefix="uc1" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<script runat="server">

    
    void Page_Load(Object sender, EventArgs e) {
    
       
        //if (Request.Cookies["FullName"] != null) {
          //  WelcomeMsg.Text = "Welcome " + Request.Cookies["FullName"].Value;
        //}
    }

</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript">
// <!CDATA[

function IMG1_onclick() {

}

// ]]>
</script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" >
<form id="form1" runat=server>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td colspan="2" style="height: 116px">
                    <uc1:_Header ID="_Header1" runat="server" />
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
            </tr>
            <tr>
                <td valign="top" width="145" style="color: #3399cc; background-color: #3399cc">
                    <uc1:Menu id="Menu1" runat="server"></uc1:Menu>
                    &nbsp;&nbsp;<br />
                    <br />
                    <br />
                    &nbsp;<br />
                    <br />
                    <br />
                    <img height="1" src="images/1x1.gif" width="145" /> 
                </td>
                <td valign="top" nowrap="nowrap" align="left" width=*>
                    <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                        <tbody>
                            <tr valign="top">
                                <td nowrap="nowrap" style="height: 359px">
                                    <br />
                                    <img src="images/1x1.gif" width="24" align="left" /> 
                                    <table cellspacing="0" cellpadding="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <table cellspacing="0" cellpadding="0" width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td class="HomeHead" style="height: 13px">
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table cellspacing="0" cellpadding="2" border="0" style="width: 880px; height: 434px">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <td style="width: 251px">
                                                                    <table style="width: 264px; height: 37px">
                                                                        <tbody>
                                                                            <tr valign="top">
                                                                                <td style="width: 279px; height: 81px">
                                                                                    <span class="NormalDouble"><strong><span style="font-size: 16pt; color: #cc0033;">
                                                                                        <br />
                                                                                        Adminstrator Page</span></strong><br />
                                                                                        <br />
                                                                                        </span></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <uc2:_Menu3 ID="_Menu3_1" runat="server" />
                                                                </td>
                                                                <td align="left" style="width: 182px">
                                                                    <img src="ProductImages/THUMBS/ecommerce-ch.jpg" border="0" style="width: 211px; height: 271px" id="IMG1" onclick="return IMG1_onclick()" /> 
                                                                    <br />
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                <td align=right style="width: 10px">
                                                                    
                                                               <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
  codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
  id="welcomecurl" style="height: 433px; width: 156px;" >
  <param name="movie" value="images/123-banner-com_21636.swf">
  <param name="quality" value="high">
  <param name="bgcolor" value="#FFFFFF">
  <embed name="welcomecurl" src="images/123-banner-com_21636.swf" quality="high" bgcolor="#FFFFFF"
    width="150" height="700"
    type="application/x-shockwave-flash"
    pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
  </embed></object>&nbsp; 
                                                                </td>
                                                            </tr>
                                                            <tr valign="top">
                                                                <td style="width: 251px">
                                                                    &nbsp;</td>
                                                                
                                                                <td style="width: 182px">
                                                                    &nbsp; 
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table></form>
</body>
</html>
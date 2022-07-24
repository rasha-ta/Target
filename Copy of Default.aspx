<%@ Page Language="C#" EnableSessionState="true" %>

<%@ Register Src="_Header.ascx" TagName="_Header" TagPrefix="uc1" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>

<script runat="server">

    void Page_Load(Object sender, EventArgs e)
    {
        if (Request.Cookies["FullName"] != null)
        {
            WelcomeMsg.Text = "Welcome " + Request.Cookies["FullName"].Value;
        }

    }

    protected void _Header1_Load(object sender, EventArgs e)
    {

    }

    protected void Menu1_Load(object sender, EventArgs e)
    {

    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />

    <script language="javascript" type="text/javascript">
// <!CDATA[

function IMG1_onclick() {

}

function IMG2_onclick() {

}

// ]]>
    </script>

</head>
<body bottommargin="0" leftmargin="0"  topmargin="0"
    rightmargin="0">
<form id="form1" runat=server> 
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td colspan="3" style="height: 128px">
                    <uc1:_Header ID="_Header1" runat="server" OnLoad="_Header1_Load" />
                </td>
            </tr>
            <tr valign="top">
                <td colspan="2" style="height: 3px; font-weight: bolder; color: yellow; background-color: #ffffff;">
                    &nbsp;&nbsp; &nbsp;&nbsp;<br />
                    &nbsp; &nbsp; <a href="default.aspx" style="color: #cc0033">HomePage</a>&nbsp;<br />
                    &nbsp; &nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server" Style="color: #cc0033; position: static">[HyperLink1]</asp:HyperLink></td>
            </tr>
            <tr>
                <td valign="top" width="145" style="background-color: #3399cc">
                    <uc1:Menu ID="Menu1" runat="server" OnLoad="Menu1_Load"></uc1:Menu>
                    <img height="1" src="images/1x1.gif" width="145" id="IMG2" language="javascript" onclick="return IMG2_onclick()" />
                </td>
                <td valign="top" nowrap="nowrap" align="left" width="*">
                    <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                        <tbody>
                            <tr valign="top">
                                <td nowrap="nowrap">
                                </td>
                                <td nowrap="nowrap">
                                </td>
                                <td nowrap="nowrap">
                                                    <table cellspacing="0" cellpadding="0" width="100%" style="position: static">
                                                        <tbody>
                                                            <tr>
                                                                <td class="HomeHead" style="font-weight: bold; color: limegreen; background-color: inactivecaptiontext; height: 35px;">
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                    &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<table style="width: 1082px;
                                        height: 5px">
                                        <tr>
                                            <td colspan="1" rowspan="3" style="width: 200px; height: 21px">
                                            </td>
                                            <td colspan="3" rowspan="3" style="width: 449px; height: 21px">
                                                <asp:Label ID="WelcomeMsg" runat="server" BorderStyle="None" Font-Size="X-Large" ForeColor="LimeGreen"></asp:Label></td>
                                        </tr>
                                        <tr>
                                        </tr>
                                        <tr>
                                        </tr>
                                    </table>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp;&nbsp;
                                    <br />
                                    <img src="images/1x1.gif" width="24" align="left" />
                                    <table cellspacing="0" cellpadding="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <table cellspacing="0" cellpadding="2" border="0" style="width: 1038px; height: 488px;">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <td style="width: 191px; height: 283px;">
                                                                    &nbsp;&nbsp;<br />
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp;
                                                                    <br />
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<table style="width: 357px; position: static;
                                                                        height: 118px">
                                                                        <tr>
                                                                            <td>
                                                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/snp_pfyd_66x57.jpg" Style="position: static"
                                                                        Width="64px" Height="69px" /></td>
                                                                            <td>
                                                                    <asp:Image ID="Image6" runat="server" Height="59px" ImageUrl="~/images/pc games.gif"
                                                                        Style="position: static" Width="112px" /></td>
                                                                            <td style="width: 154px">
                                                                    <asp:Image ID="Image2" runat="server" Height="53px" ImageUrl="~/images/logo43.gif"
                                                                        Style="position: static" Width="138px" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:ImageButton ID="ImageButton1" runat="server" Height="77px" ImageUrl="~/images/310-8814.jpg"
                                                                                    Style="position: static" Width="77px" /></td>
                                                                            <td>
                                                                    </td>
                                                                            <td style="width: 154px">
                                                                                <asp:Image ID="Image3"
                                                                        runat="server" Height="103px" ImageUrl="~/images/A0954364.jpg" Style="position: static"
                                                                        Width="74px" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Image ID="Image4" runat="server" Height="76px" ImageUrl="~/images/A0174175_logo.jpg"
                                                                        Style="position: static" Width="128px" /></td>
                                                                            <td>
                                                                    <asp:Image ID="Image5" runat="server" ImageUrl="~/images/img.gif" Style="position: static" /></td>
                                                                            <td style="width: 154px">
                                                                                <asp:Image ID="Image7" runat="server" Height="77px" ImageUrl="~/images/dt_acc_keyboard.jpg"
                                                                                    Style="position: static" Width="151px" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
                                                                <td align="left" style="width: 285px; height: 283px;">
                                                                    <img src="ProductImages/big/ecommerce-ch.jpg" border="0"
                                                                        id="IMG1" onclick="return IMG1_onclick()" style="width: 173px; height: 269px" />&nbsp;<br />
                                                                </td>
                                                            </tr>
                                                            <tr valign="top">
                                                                <td colspan="3">
                                                                    &nbsp;<br />
                                                                    <span class="NormalDouble"></span>
                                                                     <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
  codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
  id="coolsnake" width="468" height="100">
  <param name="movie" value="images/coolsnake.swf">
  <param name="quality" value="high">
  <param name="bgcolor" value="#000000">
  <embed name="coolsnake" src="images/coolsnake.swf" quality="high" bgcolor="#000000"
    width="468" height="100"
    type="application/x-shockwave-flash"
    pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
  </embed></object>&nbsp;
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td nowrap="nowrap">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>

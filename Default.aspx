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

function coolsnake_onclick() {

}

// ]]>
    </script>

<script language="javascript" type="text/javascript" for="coolsnake" event="onclick">
// <!CDATA[
return coolsnake_onclick()
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
                                    <table cellspacing="0" cellpadding="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <table cellspacing="0" cellpadding="0" border="0" style="">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <td  align=right style="width: 201px; height: 283px;">
                                                                    <asp:Label ID="WelcomeMsg" runat="server"  BorderStyle="None" Font-Size="X-Large" ForeColor="LimeGreen" style="font-weight: bolder; font-size: xx-large; color: #0033cc; position: static;" Width="634px">Welcom ToOur Website</asp:Label>
                                                                   
                                                                    <table style="width: 357px; position: static;
                                                                        height: 118px">
                                                                        <tr>
                                                                            <td style="width: 195px; height: 81px">
                                                                                &nbsp; &nbsp;&nbsp;
                                                                                <asp:Image ID="Image9" runat="server" Height="145px" ImageUrl="~/images/print_aio.jpg"
                                                                                    Style="position: static" Width="125px" />
                                                                            </td>
                                                                            <td style="width: 7px;" rowspan="2">
                                                                                <asp:Image ID="Image3" runat="server" Style="position: static" Height="505px" ImageUrl="~/images/07011a.jpg" /></td>
                                                                            <td style="width: 158px; height: 81px;">
                                                                                &nbsp;<asp:Image ID="Image4" runat="server" Height="76px" ImageUrl="~/images/A0174175_logo.jpg"
                                                                        Style="position: static" Width="128px" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 195px">
                                                                                &nbsp;&nbsp;
                                                                                <asp:Image ID="Image2" runat="server" Height="36px" ImageUrl="~/images/logo43.gif"
                                                                        Style="position: static" Width="114px" />
                                                                            </td>
                                                                            <td style="width: 214px">
                                                                                &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                                                                <asp:Image ID="Image15" runat="server" Height="115px" ImageUrl="~/images/0011_computer_keyboard.jpg"
                                                                                    Style="position: static" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                </td>
                                                                <td align="left" style="width: 285px; height: 283px;">
                                                                    &nbsp;<br />
                                                                    <br />
                                                                    </td>
                                                            </tr>
                                                            <tr valign="top">
                                                                <td colspan="3">
                                                                    &nbsp;<br />
                                                                    <span class="NormalDouble"></span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                                                     &nbsp;
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

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="Default7" %>


<%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<script runat="server">

    
    void Page_Load(Object sender, EventArgs e) {
    

        if (Context.User.Identity.Name == "")
        {
            Label1.Visible = true;

        }
        else Label2.Visible = true; 
    }

</script>
<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" marginwidth="0" marginheight="0">
<form id="myform" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td colspan="2">
                    <uc1:Header id="Header1" runat="server"></uc1:Header>
                </td>
            </tr>
            <tr>
                <td valign="top" style="background-color: #3399cc">
                    <uc1:Menu id="Menu1" runat="server"></uc1:Menu>
                    <img height="1" src="images/1x1.gif" width="145" /> 
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    </td>
                <td valign="top" nowrap="nowrap" align="left" width="100%">
                    <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                        <tbody>
                            <tr valign="top">
                                <td nowrap="nowrap" style="height: 121px">
                                    <br />
                                    <img src="images/1x1.gif" width="24" align="left" /> 
                                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tbody>
                                            <tr>
                                                <td class="ContentHead" style="color: orange; background-color: #3399cc">
                                                    About us</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    &nbsp;&nbsp;
                                    <table id="detailsTable" height="100%" cellspacing="0" cellpadding="0" width="550" border="0" runat="server" enableviewstate="false">
                                        <tbody>
                                            <tr valign="top">
                                                <td class="Normal" width="100%">
                                                    <br />
                                                    &nbsp;<br />
                                                    &nbsp;<asp:Image ID="Image1" runat="server" Height="11px" ImageUrl="~/images/1x1.gif"
                                                        Style="position: static" Width="35px" />&nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:Label ID="Label2" runat="server" Text="Our eMail Addresses:<br />* rasha taha , 'rasha@yahoo.com' <br />* duha assabagh , 'duha@hotmail.com <br />* taghreed ramo ,'taghreed@yahoo.com'<br />*dania alkhubi , 'dania@yahoo.com' " Font-Bold="True" Font-Size="X-Large" Visible="False" style="font-size: large; vertical-align: text-top; color: #000000; direction: ltr; line-height: 10mm; font-family: Arial, ItalicT, AIGDT; text-align: left;" Width="732px"></asp:Label><br />
                                                    &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                    &nbsp;
                                                    <asp:Label ID="Label1" runat="server" Text="Sorry ,you must login!" Font-Bold="True" Font-Size="XX-Large" Height="49px" Visible="False" style="font-size: x-large; vertical-align: text-top;" Width="660px"></asp:Label><br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
                                                                id="coolsnake" style="width: 829px; height: 90px">
                                                                <param name="movie" value="images/coolsnake.swf">
                                                                <param name="quality" value="high">
                                                                <param name="bgcolor" value="#000000">
                                                                <embed name="coolsnake" src="images/coolsnake.swf" quality="high" bgcolor="#000000" width="468"
                                                                    height="100" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
                                                                </embed>
                                                            </object>
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
    </form>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckAccount.aspx.cs" Inherits="Default7" %>


<%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<script runat="server">

    
    void Page_Load(Object sender, EventArgs e) {


        CustomersDB Custom = new CustomersDB();
        System.Web.HttpContext context = System.Web.HttpContext.Current;
        int CustomerID = Int32.Parse(context.User.Identity.Name);
        int NewAccount = Custom.ChargeYourAccount(0, CustomerID, "0");
                Label2.Visible = true;
            Label1.Visible = true;
            Label4.Visible = true;
        Label2.Text = NewAccount.ToString();
        Label3.Visible = false;
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
                                                <td class="ContentHead" style="color: #ffffff; background-color: #3399cc">
                                                   YourAccount</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    &nbsp;&nbsp;
                                    <table id="detailsTable" height="100%" cellspacing="0" cellpadding="0" width="550" border="0" runat="server" enableviewstate="false">
                                        <tbody>
                                            <tr valign="top">
                                                <td class="Normal" style="width: 100%">
                                                    <br />
                                                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
                                                                id="coolsnake" style="width: 820px; height: 90px">
                                                                <param name="movie" value="images/coolsnake.swf">
                                                                <param name="quality" value="high">
                                                                <param name="bgcolor" value="#000000">
                                                                <embed name="coolsnake" src="images/coolsnake.swf" quality="high" bgcolor="#000000" width="468"
                                                                    height="100" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
                                                                </embed>
                                                            </object>
                                                    &nbsp;<br />
                                                    &nbsp;
                                                    <br />
                                                    &nbsp; &nbsp;
                                                    <asp:Label ID="Label3" runat="server" ForeColor="Blue" Style="position: static" Text="Sorry you must sign in"></asp:Label><br />
                                                    <br />
                                                    <br />
                                                    &nbsp; &nbsp; &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" ForeColor="Blue"
                                                        Height="9px" Style="font-weight: bold; font-size: larger; color: #0066ff; position: static"
                                                        Text="You still have" Width="160px"></asp:Label>
                                                    &nbsp;
                                                    <asp:Label ID="Label2" runat="server" Style="position: static" Text="account"></asp:Label>
                                                    &nbsp;
                                                    <asp:Label ID="Label4" runat="server" ForeColor="Blue" Style="font-weight: bold;
                                                        font-size: larger; position: static" Text="$ in your Account"></asp:Label></td>
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
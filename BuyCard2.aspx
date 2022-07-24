<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BuyCard2.aspx.cs" Inherits="BuyCard2" %>

<%@ Register TagPrefix="uc1" TagName="_Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0"   leftmargin="0"  topmargin="0"
    rightmargin="0">
    <form id="form1" runat="server">
        <div>
            
           <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody>
            <tr>
                <td bgcolor=gray colspan="3" style="height: 116px; "  =>
                    <uc1:_Header ID="_Header1" runat="server" />
                 
                </td>
            </tr>
             <tr>
                <td valign="top" style="width: 132px; height: 319px; background-color: #3399cc;">
                    <uc1:Menu ID="Menu1" runat="server"></uc1:Menu>
                    <img height="1" src="images/1x1.gif" width="145" />
                </td>
            
            <td valign="top" nowrap="nowrap" align="left" width="*" style="height: 319px; width: 805px;">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; 
                <br />
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; <asp:Label
                        ID="Label1" runat="server" Style="font-weight: normal; font-size: 7mm; color: #cc0066; font-family: Verdana;"
                        Text="  Here We Are To Help You  " Width="420px"></asp:Label><table style="width: 703px">
                <tr>
                    <td colspan="4" style="font-family: Verdana; height: 78px">
                        &nbsp;&nbsp;
                        <br />
                        &nbsp;&nbsp;
                        Now you have the opportunity to save your time and money!
                        <br />
                        &nbsp;&nbsp;
                        With US based online E/c/o/m/m/e/r/c/e Buy your card from &nbsp; &nbsp;
                        inside the site!<br />
                        &nbsp;&nbsp; Now you save your time.You don't have to go markets for buying cards&nbsp;
                        &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                        &nbsp;&nbsp;
                        Forget about high prices at local stores. Save your money now!
                        <br />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" style="font-size: 11pt; color: #cc0066; font-weight: bold; font-family: Verdana, Verdana; text-decoration: underline;">
                        <br />
                        PLEASE FILL IN THE NEXT INFORMATION:<br />
                    </td>
                </tr>
                <tr>
                    <td style="width: 98px">
                        &nbsp; 
                        <asp:Label ID="Label4" runat="server" Text="Your CreditCardPassword:" Width="175px" style="font-family: Verdana"></asp:Label></td>
                    <td colspan="3">
                        <br />
                        <asp:TextBox ID="TextBoxCreditpassword" runat="server"></asp:TextBox>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 98px; height: 69px;">
                        &nbsp; &nbsp; &nbsp;
                        <asp:Label ID="Label5" runat="server" Text="Choose Shopping Card Value" Width="161px" style="font-family: Verdana"></asp:Label></td>
                    <td colspan="3" style="height: 69px">
                        &nbsp;<br />
                        <asp:DropDownList ID="DropDownListValue" runat="server" Width="150px" DataSourceID="SqlDataSourceAccount"
                            DataTextField="Account" DataValueField="Account">
                            <asp:ListItem Value="1"></asp:ListItem>
                        </asp:DropDownList>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    </td>
                </tr>
                <tr>
                    <td style="width: 98px; height: 149px">
                    </td>
                    <td colspan="2" style="width: 691px; height: 149px">
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                        <br />
                        &nbsp; &nbsp; &nbsp; 
                        <asp:Image ID="Image1" runat="server" Height="56px" ImageUrl="~/card2.gif" Width="80px" style="position: static;" />
                        <br />
                        <asp:Button ID="Button_BuyCard" runat="server" Text="Buy Card" Width="156px" OnClick="Button1_Click" style="position: static" />
                        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                    </td>
                    <td colspan="1" style="width: 390px; height: 149px">
                        <asp:Label ID="LabelError" runat="server" Width="172px" ForeColor="Red"></asp:Label></td>
                </tr>
                <tr>
                    <td style="width: 98px; height: 59px">
                        &nbsp; &nbsp; &nbsp;
                        <asp:Label ID="LabelNewAccount" runat="server" Text="Your NewCredit CardAccount:" Width="159px" style="font-family: Verdana"></asp:Label></td>
                    <td colspan="3" style="height: 59px">
                        <br />
                        <asp:TextBox ID="TextBoxNewAccount" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width: 98px; height: 59px">
                        &nbsp; &nbsp; &nbsp;
                        <asp:Label ID="LabelNewPassword" runat="server" Text="Your Card Password:" Width="136px" style="font-family: Verdana"></asp:Label></td>
                    <td colspan="3" style="height: 59px">
                        <br />
                        <asp:TextBox ID="TextBoxCardPassword" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="4" style="height: 126px">
                        <br />
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp;&nbsp;<br />
                        &nbsp; &nbsp; &nbsp;
                        <br />
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSourceAccount" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceeConnectionString %>"
                            SelectCommand="SELECT DISTINCT [Account] FROM [CMRC_CardTable]">
                        </asp:SqlDataSource>
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                </td>
            
            </tr>
            </tbody>
            </table>
        </div>
    </form>
</body>
</html>

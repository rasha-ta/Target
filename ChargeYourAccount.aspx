<%@ Page Language="C#" %>

<%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu2.ascx" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    void Page_Load(Object sender, EventArgs e)
    {


    }




    protected void Button2_Click(object sender, EventArgs e)
    {
        CustomersDB Custom = new CustomersDB();
        System.Web.HttpContext context = System.Web.HttpContext.Current;
        int CustomerID = Int32.Parse(context.User.Identity.Name);
        int NewAccount = Custom.ChargeYourAccount(0, CustomerID, "0");
        //        Label3.Visible = true;
        //    Label1.Visible = true;
        Label1.Text = NewAccount.ToString();

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //   int CardIDint = Int32.Parse(CardID.Text);
        //int PasswordCard = Int32.Parse(Password.Text);
        AuctionDB Auction = new AuctionDB();
        int Check = Auction.CheckAccount(Password.Text);
        if (Check >= 0)
        {

            CustomersDB Custom = new CustomersDB();
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            int CustomerID = Int32.Parse(context.User.Identity.Name);
            int NewAccount = Custom.ChargeYourAccount(Check, CustomerID, Password.Text);
            // YourAccountLabel.Visible = true;
            // AccountLabel.Text = NewAccount.ToString();
            //AccountLabel.Visible = true;
            errorLable.Visible = false;
            //------------------------------------------------------
            yourAccount.Visible = true;
          int NewAccount1 = Custom.ChargeYourAccount(0, CustomerID, "0");
           account.Text = NewAccount1.ToString();
            account.Visible = true;
        }
        else
        {
            errorLable.Visible = true;
            //YourAccountLabel.Visible = false;
            //AccountLabel.Visible = false;

        }
    }
</script>

<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="Form1" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody>
                <tr>
                    <td colspan="2">
                        <uc1:Header ID="Header1" runat="server"></uc1:Header>
                    </td>
                </tr>
                <tr>
                    <td valign="top" style="background-color: #3399cc; height: 574px;">
                        <uc1:Menu ID="Menu1" runat="server"></uc1:Menu>
                        <img height="1" src="images/1x1.gif" width="145" />
                    </td>
                    <td valign="top" nowrap="nowrap" align="left" width="100%" style="height: 574px">
                        <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                            <tbody>
                                <tr valign="top">
                                    <td nowrap="nowrap">
                                        <br />
                                        &nbsp; &nbsp;<font color="red">&nbsp;</font><br />
                                        <asp:Panel ID="DetailsPanel" runat="server">
                                            <img height="1" src="images/1x1.gif" width="50" align="left" />
                                            <table cellspacing="0" cellpadding="0" border="0" style="width: 657px; height: 103%">
                                                <tbody>
                                                    <tr valign="top">
                                                        <td style="width: 550px">
                                                            &nbsp;<img height="1" src="Images/1x1.gif" width="350" />&nbsp;&nbsp;<br />
                                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                            <br />
                                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                            &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                                                            <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="154px" Style="position: static"></asp:TextBox>
                                                            <asp:Label ID="Label2" runat="server" Text="Enter your CardPassword" Width="167px"
                                                                Style="font-weight: bold; font-size: smaller; color: #3399cc; font-family: Arial;
                                                                position: static;"></asp:Label>
                                                            &nbsp;
                                                            <asp:Label ID="errorLable" runat="server" ForeColor="Red" Style="font-size: x-small;
                                                                position: static" Text="didn't complete successfully!" Visible="False"></asp:Label>
                                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                            &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                                                            <br />
                                                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:ImageButton ID="ImageButton1" runat="server"
                                                                Height="47px" ImageUrl="~/images/untitled.bmp" OnClick="ImageButton1_Click" Style="position: static"
                                                                Width="52px" /><br />
                                                            &nbsp; &nbsp;&nbsp;
                                                            <asp:Label ID="Label1" runat="server" Height="2px" Style="color: #00cc33; position: static;
                                                                font-weight: normal; font-size: xx-small;" Text="charge your account"></asp:Label><br />
                                                            <br />
                                                            &nbsp;<asp:Label ID="yourAccount" runat="server" Style="font-weight: bold; color: #3399cc;
                                                                position: static" Text="+YourAccount is:" Visible="False"></asp:Label>
                                                            <asp:Label ID="account" runat="server" Style="color: #66cc66; position: static" Visible="False"></asp:Label><br />
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
                                                                id="coolsnake" style="width: 615px; height: 90px">
                                                                <param name="movie" value="images/coolsnake.swf">
                                                                <param name="quality" value="high">
                                                                <param name="bgcolor" value="#000000">
                                                                <embed name="coolsnake" src="images/coolsnake.swf" quality="high" bgcolor="#000000"
                                                                    width="468" height="100" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
                                                                </embed>
                                                            </object>
                                                            &nbsp;<br />
                                                            <br />
                                                            <br />
                                                            <br />
                                                            &nbsp;&nbsp;<br />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </asp:Panel>
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

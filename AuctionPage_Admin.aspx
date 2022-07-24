<%@ Page Language="C#" %>

<%@ Register Src="_Header.ascx" TagName="_Header" TagPrefix="uc1" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>

<script runat="server">
    void Page_Load(Object sender, EventArgs e)
    {


        /* if (Request.Cookies["FullName"] != null) {
             WelcomeMsg.Text = "Welcome " + Request.Cookies["FullName"].Value;
         }*/

        //WelcomeMsg.Text = "Welcome to Admin";
        AuctionDB Auction = new AuctionDB();
        DateTime d = DateTime.Now;
        DataList1.DataSource = Auction.GetFinishedAuctionProduct(d);
        DataList1.DataBind();


    }


    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0"  topmargin="0"
    rightmargin="0">
    <form id="form" runat="server">
    <table id="table" cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td colspan="2" style="height: 98px">
                    <uc1:_Header ID="Header1" runat="server"></uc1:_Header>
                </td>
            </tr>
            <tr>
                <td valign="top" width="145" style="background-color: #3399cc">
                    <uc1:Menu ID="Menu1" runat="server"></uc1:Menu>
                    <img height="1" src="images/1x1.gif" width="145" />
                </td>
                <td valign="top" nowrap="nowrap" align="left" width="*">
                    <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                        <tbody>
                            <tr valign="top">
                                <td nowrap="nowrap">
                                    <br />
                                    <img src="images/1x1.gif" width="24" align="left" />
                                    <table cellspacing="0" cellpadding="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <table cellspacing="0" cellpadding="0" width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td class="HomeHead">
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <table cellspacing="0" cellpadding="2" border="0" style="width: 656px">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <td style="width: 557px">
                                                                    <table width="300">
                                                                        <tbody>
                                                                            <tr valign="top">
                                                                                <td style="width: 568px; height: 61px">
                                                                                    <span class="NormalDouble" style="font-weight: bold; font-size: medium; color: #0033cc">
                                                                                        Products Have finished Auction:</span></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <asp:DataList ID="DataList1" runat="server" Width="362px" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                                                                        <ItemTemplate>
                                                                            <asp:Image ID="Image1" runat="server" Height="50px" Width="60px" ImageUrl='<%# "ProductImages/thumbs/"+ DataBinder.Eval(Container.DataItem, "ProductImage") %>' />
                                                                            <br />
                                                                            <asp:Label ID="Label1" runat="server" Font-Underline="true" Width="100" Text='<%# DataBinder.Eval(Container.DataItem, "ModelName") %>'></asp:Label>&nbsp;<br />
                                                                            To see who won the Auction click
                                                                            <asp:HyperLink ID="HyperLink1" runat="server" Font-Underline="true" Width="113px"
                                                                                ForeColor="blue" NavigateUrl='<%# "WhoWon.aspx?AuctionProductID="+ DataBinder.Eval(Container.DataItem, "ProductID") %>'
                                                                                Text="THE WINNER" style="font-weight: bold; font-size: smaller; color: #3333cc; font-family: 'Agency FB'">
                                                                            </asp:HyperLink>
                                                                            <br />
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                    &nbsp;&nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr valign="top">
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

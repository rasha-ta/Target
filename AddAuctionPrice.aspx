<%@ Page Language="C#" %>

<%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu2.ascx" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    void Page_Load(Object sender, EventArgs e)
    {
        Label1.Visible = false;
        Label2.Text = "The Higher price is "+Request.Params["LastPrice"]+" Your Price Must be Higher ";
      
    }



    void CheckoutBtn_Click(Object sender, ImageClickEventArgs e)
    {
        
        int ProductID = Int32.Parse(Request.Params["ProductID"]);
        String customerId = User.Identity.Name;
        int ID = Int32.Parse(customerId);
        int lastPrice = Int32.Parse(Request.Params["LastPrice"]);
        AuctionDB Auction = new AuctionDB();
        string date=Request.Params["DateEnd"];
        
        int CardPrice = Int32.Parse(PriceTextBox.Text);
        if (CardPrice > lastPrice)
        {
            bool Check = Auction.CheckAccountforPrice(ID, CardPrice);
            if (Check)
            {
                MyError.Visible = false;
                int[] value = new int[3];
                value = Auction.GetAuctionInfo(ProductID);
                if (value != null)
                {
                    Auction.UpdateAccount(value[0], (decimal)value[1]);
                    Auction.Delete(value[2]);
                }

                int OrderID = Auction.PlaceAauctionOrder(ProductID, ID, CardPrice, DateTime.Now);
                Auction.UpdateAccount2(ID, CardPrice);
                if (CardPrice > lastPrice)
                {
                    Auction.UpdatePrice(ProductID, CardPrice);
                }
               // Label3.Text = date;
                
                // Response.Redirect("~/ShareAuction.aspx?LastPrice=" + price + "&EndDate=" + date);
                Response.Redirect("~/ShareAuction.aspx?LastPrice=" + CardPrice );

            }
            else
            {
                MyError.Visible = true;
            }
        }
        else
        {
            Label1.Visible = true;
        }
       
    }
   
</script>

<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
<form id="form1"  runat=server>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td colspan="2">
                    &nbsp;<uc1:Header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td valign="top" style="background-color: #3399cc">
                    <uc1:Menu ID="Menu1" runat="server"></uc1:Menu>
                    <img height="1" src="images/1x1.gif" width="145" />
                </td>
                <td valign="top" nowrap="nowrap" align="left" width="100%">
                    <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                        <tbody>
                            <tr valign="top">
                                <td nowrap="nowrap">
                                    <br />
                                   
                                        <img src="images/1x1.gif" width="24" align="left" />
                                    <img height="4" src="images/1x1.gif" width="110" align="left" />
                                    <font color="red">
                                            &nbsp;</font><br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<table cellspacing="0" cellpadding="0" width="100%" border="0" style="position: static">
                                            <tbody>
                                                <tr>
                                                    <td class="ContentHead" style="color: #3399cc; background-color: #cccccc">
                                                        <img height="32" src="images/1x1.gif" width="60" align="left" />Add Auction Price&nbsp;<br />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                    &nbsp; &nbsp; &nbsp;<asp:Label ID="Label1" runat="server" Style="position: static; font-weight: bold; font-size: larger; color: #ff6600;" Text="Sorry Your price must be higher" Visible="False" Width="319px"></asp:Label>
                                        &nbsp;&nbsp;&nbsp;<br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                            <asp:Label class="ErrorText" ID="MyError" runat="Server" Visible="False" style="font-weight: bold; font-size: larger; color: #ff6600; position: static">Sorry Your Account isn't enough</asp:Label><br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True"
                                        Style="color: #ff6600; position: static" Text="The Higher Price is:"></asp:Label>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        <img height="15" src="images/1x1.gif" width="24" align="left" border="0" />
                                        <asp:Panel ID="DetailsPanel" runat="server">
                                            <img height="1" src="images/1x1.gif" width="50" align="left" />
                                            <table height="100%" cellspacing="0" cellpadding="0" width="550" border="0">
                                                <tbody>
                                                    <tr valign="top">
                                                        <td width="550">
                                                            <img height="1" src="Images/1x1.gif" width="350" />&nbsp;
                                                            <br />
                                                            <asp:TextBox ID="PriceTextBox" runat="server"></asp:TextBox>
                                                            <asp:Label ID="PriceLabel" runat="server" Text="Enter Your Price" Width="130px" Style="font-family: Arial; color: #0033cc;"></asp:Label><br />
                                                            <br />
                                                            <img height="1" src="Images/1x1.gif" width="60" />&nbsp;
                                                            <img height="1" src="Images/1x1.gif" width="15" />
                                                            <asp:ImageButton ID="checkout" OnClick="CheckoutBtn_Click" runat="server" ImageUrl="images/final_checkout.gif">
                                                            </asp:ImageButton>
                                                            <br />
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

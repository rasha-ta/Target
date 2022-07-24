<%@ Page Language="C#" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    
    
    void Page_Load(Object sender, EventArgs e) {
    
        if (Page.IsPostBack == false) {         
            ShoppingCartDB cart = new ShoppingCartDB();
            String cartId = cart.GetShoppingCartId();            
            MyDataGrid.DataSource = cart.GetItems(cartId);
            MyDataGrid.DataBind();
            TotalLbl.Text = String.Format( "{0:c}", cart.GetTotal(cartId));
        }
    }
    
    
    
    void SubmitBtn_Click(Object sender, ImageClickEventArgs e) {
    
        ShoppingCartDB cart = new ShoppingCartDB();          
        String cartId = cart.GetShoppingCartId();
        String customerId = User.Identity.Name;
        int id=Int32.Parse(customerId);
        AuctionDB Auction = new AuctionDB();
        
        
        decimal Total=cart.GetTotal(cartId);
        bool Check = Auction.CheckAccountforPrice(id, Total);
        if (Check)
        {
            if ((cartId != null) && (customerId != null))
            {

              
                OrdersDB ordersDatabase = new OrdersDB();
                int orderId = ordersDatabase.PlaceOrder(customerId, cartId);
                Auction.UpdateAccount2(id, Total);

                
                Header.Text = "Check Out Complete!";
              //  Message.Text = "<b>Your Order Number Is: </b>" + orderId;
                SubmitBtn.Visible = false;
            }
        }
        else { ErrorLabel.Visible = true; }
            
    }

</script>
<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0"  topmargin="0" rightmargin="0" marginwidth="0" marginheight="0">
<form id="form1"  runat=server>
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
                </td>
                <td valign="top" nowrap="nowrap" align="left" width="100%">
                    <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                        <tbody>
                            <tr valign="top">
                                <td nowrap="nowrap">
                                    <br />
                                 
                                        <img src="images/1x1.gif" width="24" align="left" /> 
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="ContentHead" style="background-color: #cccccc">
                                                        <img height="32" src="images/1x1.gif" width="60" align="left" style="background-color: #cccccc" />
                                                        <asp:Label id="Header" runat="server" style="color: #3366cc">Review and Submit Your Order</asp:Label>
                                                        <br />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <img height="1" src="images/1x1.gif" width="92" align="left" /> 
                                        <table height="100%" cellspacing="0" cellpadding="0" width="550" border="0">
                                            <tbody>
                                                <tr valign="top">
                                                    <td class="Normal" width="100%">
                                                        <br />
                                                        &nbsp;<br />
                                                        <br />
                                                        <asp:DataGrid id="MyDataGrid" runat="server" AutoGenerateColumns="False" AlternatingItemStyle-CssClass="CartListItemAlt" ItemStyle-CssClass="CartListItem" FooterStyle-CssClass="cartlistfooter" HeaderStyle-CssClass="CartListHead" ShowFooter="True" Font-Size="8pt" Font-Name="Verdana" cellpadding="4" GridLines="None" width="90%" Font-Names="Verdana" ForeColor="#333333">
                                                            <Columns>
                                                                <asp:BoundColumn HeaderText="Product Name" DataField="ModelName" />
                                                                <asp:BoundColumn HeaderText="Model Number" DataField="ModelNumber" />
                                                                <asp:BoundColumn HeaderText="Quantity" DataField="Quantity" />
                                                                <asp:BoundColumn HeaderText="Price" DataField="UnitCost" DataFormatString="{0:c}" />
                                                                <asp:BoundColumn HeaderText="Subtotal" DataField="ExtendedAmount" DataFormatString="{0:c}" />
                                                            </Columns>
                                                            <FooterStyle BackColor="#507CD1" CssClass="cartlistfooter" ForeColor="White" Font-Bold="True" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                            <AlternatingItemStyle CssClass="CartListItemAlt" BackColor="White" />
                                                            <ItemStyle CssClass="CartListItem" BackColor="#EFF3FB" />
                                                            <HeaderStyle BackColor="#507CD1" CssClass="CartListHead" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                        </asp:DataGrid>
                                                        <br />
                                                        <br />
                                                        <b style="font-family: Arial">Total: </b>
                                                        <asp:Label id="TotalLbl" runat="server"></asp:Label>
                                                        <p>
                                                            &nbsp;</p>
                                                        <p>
                                                            <asp:Label ID="ErrorLabel" runat="server" Text="You Cannot Buy This Products Becouse You Havenot Money In Your Account
                                                            Plese return to your Cart And Remove Some Items Or Charge Your Account"
                                                                Visible="False" Width="444px"></asp:Label>&nbsp;</p>
                                                        <p>
                                                            <asp:ImageButton id="SubmitBtn" onclick="SubmitBtn_Click" runat="server" ImageURL="images/submit.gif"></asp:ImageButton>
                                                        </p>
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
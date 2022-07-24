<%@ Page Language="C#" %>

<%@ Register Src="_Menu3.ascx" TagName="_Menu3" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<script runat="server">

    
    void Page_Load(Object sender, EventArgs e) {
    
        int OrderID = Int32.Parse(Request.Params["OrderID"]);
        string CustomerId = User.Identity.Name;
    
        OrdersDB orderHistory = new OrdersDB();
        OrderDetails myOrderDetails = orderHistory.GetOrderDetails2(OrderID);
   
        if (myOrderDetails != null) {
    
            GridControl1.DataSource = myOrderDetails.OrderItems;
            GridControl1.DataBind();
    
            lblTotal.Text = String.Format( "{0:c}", myOrderDetails.OrderTotal);
           // lblOrderNumber.Text = OrderID.ToString();
           // lblOrderDate.Text = myOrderDetails.OrderDate.ToShortDateString();
           // lblShipDate.Text = myOrderDetails.ShipDate.ToShortDateString();
        }
        else {
    
            MyError.Text = "Order not found!";
            detailsTable.Visible = false;
        }
    }

</script>
<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0"topmargin="0" rightmargin="0" marginwidth="0" marginheight="0">
<form id="myform" runat=server>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td colspan="2">
                    <uc1:Header id="Header1" runat="server"></uc1:Header>
                </td>
            </tr>
            <tr>
                <td valign="top" style="background-color: #3399cc; height: 352px;">
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
                                <td nowrap="nowrap">
                                    <br />
                                    <img src="images/1x1.gif" width="24" align="left" /> 
                                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                        <tbody>
                                            <tr>
                                                <td class="ContentHead" style="color: #ffffff; background-color: #3333cc">
                                                    Order Details&nbsp;
                                                    <br />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <img height="15" src="images/1x1.gif" width="86" align="left" border="0" /> 
                                    <asp:Label id="MyError" runat="Server" EnableViewState="false" CssClass="ErrorText"></asp:Label>
                                    <table id="detailsTable" height="100%" cellspacing="0" cellpadding="0" width="550" border="0" runat="server" enableviewstate="false">
                                        <tbody>
                                            <tr valign="top">
                                                <td class="Normal" style="width: 133%">
                                                    <br />
                                                    &nbsp;<br />
                                                    <br />
                                                    <asp:DataGrid id="GridControl1" runat="server" AutoGenerateColumns="False" AlternatingItemStyle-CssClass="CartListItemAlt" ItemStyle-CssClass="CartListItem" FooterStyle-CssClass="cartlistfooter" HeaderStyle-CssClass="CartListHead" ShowFooter="True" Font-Size="8pt" Font-Name="Verdana" cellpadding="4" GridLines="None" width="90%" style="background-color: #000000" Font-Names="Verdana" ForeColor="#333333">
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
                                                    <b>Total: </b>
                                                    <asp:Label id="lblTotal" runat="server" EnableViewState="false"></asp:Label>
                                                </td>
                                                <td class="Normal" style="width: 195px">
                                                    <uc2:_Menu3 ID="_Menu3_1" runat="server" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td nowrap="nowrap">
                                </td>
                                <td nowrap="nowrap">
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
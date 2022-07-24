<%@ Page Language="C#" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    
    
    void Page_Load(Object sender, EventArgs e) {
    
        String customerID = User.Identity.Name;
    
       OrdersDB orderHistory = new OrdersDB();
    
        MyList.DataSource = orderHistory.GetCustomerOrders(customerID);
        MyList.DataBind();
    
        if (MyList.Items.Count == 0) {
            Label1.Text = "You have no orders to display.";
            
            MyList.Visible = false;
        }
    }

    protected void MyList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
</script>
<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" marginwidth="0" marginheight="0">
 <form id="Form1" runat="server">
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
                                                    <td class="ContentHead" style="background-color: #3333cc; color: #ffffff;">
                                                        <img height="32" src="images/1x1.gif" width="60" align="left" />Your All Orders&nbsp;<br />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <img height="4" src="images/1x1.gif" width="110" align="left" />&nbsp;<font color="red">
                                            <asp:Label ID="Label1" runat="server" Style="position: static; color: #3333cc;" ForeColor="DarkKhaki" Visible="False"></asp:Label></font><br />
                                        <img height="15" src="images/1x1.gif" width="84" align="left" border="0" /> 
                                        <table height="100%" cellspacing="0" cellpadding="0" width="550" border="0">
                                            <tbody>
                                                <tr valign="top">
                                                    <td width="100%">
                                                        <asp:DataGrid id="MyList" runat="server" AutoGenerateColumns="False" AlternatingItemStyle-CssClass="CartListItemAlt" ItemStyle-CssClass="CartListItem" FooterStyle-CssClass="cartlistfooter" HeaderStyle-CssClass="CartListHead" ShowFooter="True" Font-Size="8pt" Font-Name="Verdana" cellpadding="4" GridLines="None" width="90%" Font-Names="Verdana" ForeColor="#333333" OnSelectedIndexChanged="MyList_SelectedIndexChanged">
                                                            <Columns>
                                                                <asp:BoundColumn HeaderText="Order Number" DataField="OrderID" />
                                                                <asp:BoundColumn HeaderText="Order Date" DataField="OrderDate" DataFormatString="{0:d}" />
                                                                <asp:BoundColumn HeaderText="Order Total" DataField="OrderTotal" DataFormatString="{0:c}" />
                                                                <asp:BoundColumn HeaderText="Ship Date" DataField="ShipDate" DataFormatString="{0:d}" />
                                                                <asp:HyperLinkColumn HeaderText="Order Details" Text="order Details" DataNavigateUrlField="OrderID" DataNavigateUrlFormatString="orderdetails.aspx?OrderID={0}" />
                                                            </Columns>
                                                            <FooterStyle BackColor="#507CD1" CssClass="cartlistfooter" ForeColor="White" Font-Bold="True" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                            <AlternatingItemStyle CssClass="CartListItemAlt" BackColor="White" />
                                                            <ItemStyle CssClass="CartListItem" BackColor="#EFF3FB" />
                                                            <HeaderStyle BackColor="#507CD1" CssClass="CartListHead" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                        </asp:DataGrid>
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
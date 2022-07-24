<%@ Page Language="C#" %>

<%@ Register Src="_Menu3.ascx" TagName="_Menu3" TagPrefix="uc2" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    
    
    void Page_Load(Object sender, EventArgs e) {
    
        String customerID = User.Identity.Name;
        
       OrdersDB orderHistory = new OrdersDB();
    
        MyList.DataSource = orderHistory.GetAllOrders(0);
        MyList.DataBind();
    
        if (MyList.Items.Count == 0) {
            MyError.Text = "You have no orders to display.";
            MyList.Visible = false;
        }
    }


    
</script>
<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0"  topmargin="0" rightmargin="0"  >
 <form id="myform" runat="server" >
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td colspan="2"  class="HomeHead">
                    <uc1:Header id="Header1" runat="server"></uc1:Header>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td valign="top" style="height: 451px; width: 145px; background-color: #3399cc ">
                    <uc1:Menu id="Menu1" runat="server"></uc1:Menu>
                    <img height="1" src="images/1x1.gif" width="145" /> <br />
                    <br />
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
                                                        Show All Orders</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <img height="4" src="images/1x1.gif" width="110" align="left" /> <font color="red">
                                        <asp:Label class="ErrorText" id="MyError" runat="Server"></asp:Label></font>
                                        <br />
                                        <img height="15" src="images/1x1.gif" width="84" align="left" border="0" /> 
                                        <table height="100%" cellspacing="0" cellpadding="0" width="550" border="0">
                                            <tbody>
                                                <tr valign="top">
                                                    <td style="width: 133%">
                                                        <asp:DataGrid id="MyList" runat="server" AutoGenerateColumns="False" AlternatingItemStyle-CssClass="CartListItemAlt" ItemStyle-CssClass="CartListItem" FooterStyle-CssClass="cartlistfooter" HeaderStyle-CssClass="CartListHead" ShowFooter="True" Font-Size="8pt" Font-Name="Verdana" cellpadding="4" GridLines="None" width="90%" Font-Names="Verdana" ForeColor="#333333" Height="199px" >
                                                            <Columns>
                                                                <asp:BoundColumn HeaderText="Order ID" DataField="OrderID" />
                                                                <asp:BoundColumn HeaderText="Customer name " DataField="FullName" />
                                                                <asp:BoundColumn HeaderText="Order Date" DataField="OrderDate" DataFormatString="{0:d}" />
                                                                <asp:BoundColumn HeaderText="Order Total" DataField="OrderTotal" DataFormatString="{0:c}" />
                                                                <asp:BoundColumn HeaderText="Ship Date" DataField="ShipDate" DataFormatString="{0:d}" />
                                                                <asp:HyperLinkColumn HeaderText="Show Details" Text="Show Details" DataNavigateUrlField="OrderID" DataNavigateUrlFormatString="AllOrderDetail.aspx?OrderID={0}" />
                                                           
                                                            </Columns>
                                                            <FooterStyle CssClass="cartlistfooter" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <AlternatingItemStyle CssClass="CartListItemAlt" BackColor="White" />
                                                            <ItemStyle CssClass="CartListItem" BackColor="#EFF3FB" />
                                                            <HeaderStyle CssClass="CartListHead" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                        </asp:DataGrid>
                                                        &nbsp;
                                                        &nbsp;&nbsp;
                                                    </td>
                                                    <td style="width: 2523%">
                                                        &nbsp;</td>
                                                    <td>
                                                    </td>
                                                    <td style="width: 62px">
                                                        <uc2:_Menu3 ID="_Menu3_1" runat="server" />
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
    </table></form>
</body>
</html>
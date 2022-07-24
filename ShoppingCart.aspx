<%@ Page Language="C#" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    
    void Page_Load(Object sender, EventArgs e) {      
        if (Page.IsPostBack == false) {
           PopulateShoppingCartList();
        }
       
    }
    
    
    
    void UpdateBtn_Click(Object sender, ImageClickEventArgs e){
        UpdateShoppingCartDatabase();
        PopulateShoppingCartList();
    }
    
    
    
    void CheckoutBtn_Click(Object sender, ImageClickEventArgs e) {
    
        UpdateShoppingCartDatabase();
        ShoppingCartDB cart = new ShoppingCartDB();
        String cartId = cart.GetShoppingCartId();
        if (cart.GetItemCount(cartId) !=0) {
            Response.Redirect("Checkout.aspx");
        }
        else {
            MyError.Text = "You can't proceed to the Check Out page with an empty cart.";
        }
    }
    
    
    
    void PopulateShoppingCartList() {
    
        ShoppingCartDB cart = new ShoppingCartDB();
          
        String cartId = cart.GetShoppingCartId();
        if (cart.GetItemCount(cartId) == 0) {
            DetailsPanel.Visible = false;
           // MyError.Text = "There are currently no items in your shopping cart.";
            Label1.Visible = true;
            Image1.EnableViewState = false;
            
        }
        else {
    
            MyList.DataSource = cart.GetItems(cartId);
            MyList.DataBind();
            lblTotal.Text = String.Format( "{0:c}", cart.GetTotal(cartId));
        }
    }
    
    
    
    void UpdateShoppingCartDatabase() {
    
       ShoppingCartDB cart = new ShoppingCartDB();
    
       
        String cartId = cart.GetShoppingCartId();
    
        for (int i=0; i < MyList.Items.Count; i++) {
    
           
            TextBox quantityTxt = (TextBox) MyList.Items[i].FindControl("Quantity");
            CheckBox remove = (CheckBox) MyList.Items[i].FindControl("Remove");
    
            
            int quantity;
            try {
                quantity = Int32.Parse(quantityTxt.Text);
    
               
                if (quantity != (int)MyList.DataKeys[i] || remove.Checked == true) {
    
                    Label lblProductID = (Label) MyList.Items[i].FindControl("ProductID");
    
                    if (quantity == 0 || remove.Checked == true) {
                        cart.RemoveItem(cartId, Int32.Parse(lblProductID.Text));
                    }
                    else {
                        cart.UpdateItem(cartId, Int32.Parse(lblProductID.Text),quantity);
                    }
                }
            }
            catch {
                MyError.Text = "There has been a problem with one or more of your inputs.";
            }
        }
    }

</script>
<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript">
<!--

function IMG1_onclick() {

}

// -->
</script>
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
                                                    <td class="ContentHead" style="background-color: #3399cc; color: #ffffff;">
                                                        <img height="32" src="images/1x1.gif" width="60" align="left" />Shopping Cart 
                                                        <br />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <img height="4" src="images/1x1.gif" width="110" align="left" /> <font color="red">
                                        <asp:Label class="ErrorText" id="MyError" runat="Server" EnableViewState="false"></asp:Label>&nbsp;</font><br />
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        &nbsp; &nbsp;
                                        <img height="15" src="images/1x1.gif" width="24" align="left" border="0" />
                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" ForeColor="Goldenrod"
                                            Style="position: static; color: #ff6600;" Text="There are no items in your Cart ,please add some items" Visible="False"></asp:Label><br />
                                        <asp:panel id="DetailsPanel" runat="server">
                                            <img height="1" src="images/1x1.gif" width="50" align="left" /> 
                                            <table height="100%" cellspacing="0" cellpadding="0" border="0" style="width: 741px">
                                                <tbody>
                                                    <tr valign="top">
                                                        <td style="width: 438px; color: #ff6600;">
                                                            <asp:DataGrid id="MyList" runat="server" AutoGenerateColumns="False" DataKeyField="Quantity" AlternatingItemStyle-CssClass="CartListItemAlt" ItemStyle-CssClass="CartListItem" FooterStyle-CssClass="CartListFooter" HeaderStyle-CssClass="CartListHead" ShowFooter="True" Font-Size="8pt" Font-Name="Verdana" cellpadding="3" BorderColor="#CCCCCC" BackColor="White" BorderStyle="None" BorderWidth="1px" Font-Names="Verdana">
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="Product&#160;ID">
                                                                        <ItemTemplate>
                                                                            <asp:Label id="ProductID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "ProductID") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn HeaderText="Product Name" DataField="ModelName" />
                                                                    <asp:BoundColumn HeaderText="Model Number" DataField="ModelNumber" />
                                                                    <asp:TemplateColumn HeaderText="Quantity">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox id="Quantity" runat="server" Columns="4" MaxLength="3" Text='<%# DataBinder.Eval(Container.DataItem, "Quantity") %>' width="40px" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn HeaderText="Price" DataField="UnitCost" DataFormatString="{0:c}" />
                                                                    <asp:BoundColumn HeaderText="Subtotal" DataField="ExtendedAmount" DataFormatString="{0:c}" />
                                                                    <asp:TemplateColumn HeaderText="Remove">
                                                                        <ItemTemplate>
                                                                            <center>
                                                                                <asp:CheckBox id="Remove" runat="server" />
                                                                            </center>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <FooterStyle CssClass="CartListFooter" BackColor="White" ForeColor="#000066" />
                                                                <AlternatingItemStyle CssClass="CartListItemAlt" />
                                                                <ItemStyle CssClass="CartListItem" ForeColor="#000066" />
                                                                <HeaderStyle CssClass="CartListHead" BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                                                <SelectedItemStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                                                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" Mode="NumericPages" />
                                                            </asp:DataGrid>&nbsp; <span class="NormalBold">Total: </span>
                                                            <asp:Label class="NormalBold" id="lblTotal" runat="server" EnableViewState="false" style="color: #ff6600"></asp:Label>&nbsp;<br />
                                                            <br />
                                                            &nbsp;
                                                            <asp:imagebutton id="update" onclick="UpdateBtn_Click" runat="server" ImageURL="images/update_cart.gif"></asp:imagebutton>&nbsp;
                                                            <img height="1" src="Images/1x1.gif" width="15" /> 
                                                            <asp:imagebutton id="checkout" onclick="CheckoutBtn_Click" runat="server" ImageURL="images/final_checkout.gif"></asp:imagebutton>
                                                            <br />
                                                        </td>
                                                        <td width="550">
                                                            <asp:Image ID="Image1" runat="server" Height="274px" ImageUrl="~/images/Shopping-Cart-314765.jpg"
                                                                Style="position: static" Width="217px" /></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </asp:panel>
                                   
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
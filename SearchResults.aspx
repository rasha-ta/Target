<%@ Page Language="C#" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    
    void Page_Load(Object sender, EventArgs e) {
    
        ProductsDB productCatalogue = new ProductsDB();
    
        MyList.DataSource = productCatalogue.SearchProductDescriptions(Request.Params["txtSearch"]);
        MyList.DataBind();
    
        if (MyList.Items.Count == 0) {
            ErrorMsg.Text = "No items matched your query.";
        }
    }

</script>
<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" background="images/sitebkgrdnogray.gif" topmargin="0" rightmargin="0" marginwidth="0" marginheight="0">
 <form id="myform" runat="server" >
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td colspan="2">
                    <uc1:Header id="Header1" runat="server"></uc1:Header>
                </td>
            </tr>
            <tr valign="top">
            <td colspan="2" style="height: 8px" >
                &nbsp;&nbsp;
                <a href="default.aspx" style="color: goldenrod" >HomePage</a> 
            </td>
        </tr>
            <tr>
                <td valign="top">
                    <uc1:Menu id="Menu1" runat="server"></uc1:Menu>
                    <img height="1" src="images/1x1.gif" width="145" /> 
                </td>
                <td valign="top" nowrap="nowrap" align="left" width="100%">
                    <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                        <tbody>
                            <tr valign="top">
                                <td nowrap="nowrap">
                                    <br />
                                    <asp:DataList id="MyList" runat="server" RepeatColumns="2">
                                        <ItemTemplate>
                                            <table border="0" width="300">
                                                <tr>
                                                    <td width="25">
                                                        &nbsp; 
                                                    </td>
                                                    <td valign="middle" align="right" style="width: 60px">
                                                        <a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'> <img src='ProductImages/thumbs/<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>' width="60" height="50" border="0" /> </a> 
                                                    </td>
                                                    <td width="200" valign="middle">
                                                        <a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID")%>'> <span class="ProductListHead"> <%# DataBinder.Eval(Container.DataItem, "ModelName")%> </span> 
                                                        <br />
                                                        </a> <span class="ProductListItem"><b>Special Price: </b> <%# DataBinder.Eval(Container.DataItem, "UnitCost", "{0:c}")%> </span> 
                                                        <br />
                                                        <a href='AddToCart.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID")%>'> <font color="#9d0000"><b>Add
                                                        To Cart</b></font></a> 
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <img height="1" src="Images/1x1.gif" width="30" /> 
                                    <asp:Label class="ErrorText" id="ErrorMsg" runat="server"></asp:Label>
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
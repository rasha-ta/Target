<%@ Control Language="C#" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ outputcache duration="1" varybyparam="selection" %>


<script runat="server">

    
    
    void Page_Load(Object sender, EventArgs e) {
    
        
        String selectionId = Request.Params["selection"];
    
        if (selectionId != null) {
            MyList.SelectedIndex = Int32.Parse(selectionId);
        }
        ProductsDB products = new ProductsDB();       
        MyList.DataSource = products.GetProductCategories();
        MyList.DataBind();
    }

</script>
<table cellspacing="0" cellpadding="0" width="145" border="0">
    <tbody>
        
        <tr valign="top">
            <td colspan="2">
                <asp:DataList id="MyList" EnableViewState="False" SelectedItemStyle-BackColor="dimgray" width="145px" runat="server" CellSpacing="10">
                    <ItemTemplate>
                        <asp:HyperLink cssclass="MenuUnselected" id="HyperLink1" Text='<%# DataBinder.Eval(Container.DataItem, "CategoryName") %>' NavigateUrl='<%# "productslistforAuction.aspx?CategoryID=" + DataBinder.Eval(Container.DataItem, "CategoryID") + "&selection=" + Container.ItemIndex %>' runat="server" style="color: white" />
                    </ItemTemplate>
                    <SelectedItemTemplate>
                        <asp:HyperLink cssclass="MenuSelected" id="HyperLink2" Text='<%# DataBinder.Eval(Container.DataItem, "CategoryName") %>' NavigateUrl='<%# "productslistforAuction.aspx?CategoryID=" + DataBinder.Eval(Container.DataItem, "CategoryID") + "&selection=" + Container.ItemIndex %>' runat="server" />
                    </SelectedItemTemplate>
                    <SelectedItemStyle BackColor="DimGray" />
                </asp:DataList>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td width="10">
                &nbsp; 
            </td>
            <td>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                
            </td>
        </tr>
    </tbody>
</table>
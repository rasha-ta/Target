<%@ Control Language="C#" %>
<%@ import Namespace="System.Data.SqlClient" %>
<%@ outputcache duration="3600" varybyparam="selection" %>


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
                <asp:DataList id="MyList" EnableViewState="False" SelectedItemStyle-BackColor="dimgray" width="139px" runat="server" CellSpacing="10" Font-Bold="True" Font-Italic="True" Font-Names="Akhbar MT" Font-Overline="False" Font-Size="Larger" Font-Strikeout="False" Font-Underline="False" Height="200px">
                    <ItemTemplate>
                        <asp:HyperLink cssclass="MenuUnselected" id="HyperLink1" Text='<%# DataBinder.Eval(Container.DataItem, "CategoryName") %>' NavigateUrl='<%# "SubCategories.aspx?CategoryID=" + DataBinder.Eval(Container.DataItem, "CategoryID") + "&selection=" + Container.ItemIndex %>' runat="server" style="color: #ffffff" />
                    </ItemTemplate>
                    <SelectedItemTemplate>
                        <asp:HyperLink cssclass="MenuSelected" id="HyperLink2" Text='<%# DataBinder.Eval(Container.DataItem, "CategoryName") %>' NavigateUrl='<%# "SubCategories.aspx?CategoryID=" + DataBinder.Eval(Container.DataItem, "CategoryID") + "&selection=" + Container.ItemIndex %>' runat="server" />
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
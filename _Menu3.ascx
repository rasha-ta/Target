<%@ Control Language="C#" AutoEventWireup="true" CodeFile="_Menu3.ascx.cs" Inherits="_Menu3" %>
<table>
    <tr>
        <td style="width: 3px">
            <asp:HyperLink ID="AddCategory" runat="server" NavigateUrl="~/AddCategory.aspx" style="font-weight: bolder; font-size: large; color: #3333cc; text-decoration: underline">AddCategory</asp:HyperLink>
            <br />
            <asp:HyperLink ID="AddSubCategory" runat="server" NavigateUrl="~/AddSubCategory.aspx" style="font-weight: bolder; font-size: large; color: #3333cc; text-decoration: underline">AddSubCategory</asp:HyperLink>
            <br />
            <asp:HyperLink ID="AddProduct" runat="server" NavigateUrl="~/CreatePro.aspx" style="font-weight: bolder; font-size: large; color: #3333cc; text-decoration: underline">AddProduct</asp:HyperLink>
            <br />
            <asp:HyperLink ID="UpdateProduct" runat="server" NavigateUrl="~/UpdateProduct.aspx" style="font-weight: bolder; font-size: large; color: #3333cc; text-decoration: underline">UpdateProduct</asp:HyperLink>
            
            <br />
            <asp:HyperLink ID="DeleteProduct" runat="server" NavigateUrl="~/Delete.aspx" style="font-weight: bolder; font-size: large; color: #3333cc; text-decoration: underline">DeleteProduct</asp:HyperLink>
            
            <br />
            <asp:HyperLink ID="ShowAllOrders" runat="server" NavigateUrl="~/ShowAllOrder.aspx" style="font-weight: bolder; font-size: large; color: #3333cc; text-decoration: underline">ShowAllOrders</asp:HyperLink>
            <br />
                        <asp:HyperLink ID="CheckAuction" runat="server" NavigateUrl="~/AuctionPage_Admin.aspx" style="font-weight: bolder; font-size: large; color: #3333cc; text-decoration: underline">CheckAuction</asp:HyperLink>
               
            <br />
        </td>
        
    </tr>
</table>

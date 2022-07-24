<%@ Control Language="C#" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    public int ProductID;
    
    
    
    void Page_Load(Object sender, EventArgs e) {
    
       
        ReviewsDB productReviews = new ReviewsDB();
    
        MyList.DataSource = productReviews.GetReviews(ProductID);
        MyList.DataBind();
    
       
        AddReview.NavigateUrl = "ReviewAdd.aspx?productID=" + ProductID.ToString();
    }

</script>
<br>
<br />
<table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tbody>
        <tr>
            <td class="SubContentHead">
                &nbsp;Reviews 
                <br />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp; 
            </td>
        </tr>
        <tr>
            <td>
                <asp:Hyperlink id="AddReview" runat="server">
                    <img align="absbottom" src="images/review_this_product.gif" border="0" /> 
                </asp:Hyperlink>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <asp:DataList id="MyList" runat="server" cellspacing="0" cellpadding="0" width="500">
                    <ItemTemplate>
                        <asp:Label ID="Label1" class="NormalBold" Text='<%#DataBinder.Eval(Container.DataItem, "CustomerName")%>' runat="server" />
                        <span class="Normal">says... </span><img src='images/ReviewRating<%#DataBinder.Eval(Container.DataItem, "Rating")%>.gif' /> 
                        <br />
                        <asp:Label ID="Label2" class="Normal" Text='<%#DataBinder.Eval(Container.DataItem, "Comments")%>' runat="server" />
                    </ItemTemplate>
                    <SeparatorTemplate>
                        <br />
                    </SeparatorTemplate>
                </asp:DataList>
            </td>
        </tr>
    </tbody>
</table>
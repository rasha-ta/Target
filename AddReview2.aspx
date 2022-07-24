<%@ Page Language="C#" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<script runat="server">

   
    
    void Page_Load(Object sender, EventArgs e) {
    
        if (Page.IsPostBack != true) {
           int productID = Int32.Parse(Request["productID"]);
    
           ProductsDB products = new ProductsDB();
           ModelName.Text = products.GetProductDetails(productID).ModelName;

           ViewState["productID"] = productID;
        }
    }
   
    
    void ReviewAddBtn_Click(Object sender, ImageClickEventArgs e) {
    
        
        if (Page.IsValid == true) {
    
            int productID = (int) ViewState["productID"];
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            int CustomerID = Int32.Parse(context.User.Identity.Name);
            int rating = Int32.Parse(Rating.SelectedItem.Value);
 
            ReviewsDB review = new ReviewsDB();
            review.AddReview2(productID, rating, CustomerID);
    
            Response.Redirect("ProductDetails.aspx?ProductID=" + productID);
        }
    }

</script>
<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" marginwidth="0" marginheight="0">
<form id="myform" runat="server">
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
                                                    <td class="ContentHead" style="color: #ffffff; background-color: #3399cc">
                                                        <img height="32" src="images/1x1.gif" width="60" align="left" />Add Review&nbsp;
                                                        <br />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <br />
                                        <img src="Images/1x1.gif" width="92" align="left" /> 
                                        <table width="500" border="0">
                                            <tbody>
                                                <tr valign="top">
                                                    <td>
                                                        <table border="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td valign="top" width="550">
                                                                        &nbsp;
                                                        <asp:label id="ModelName" runat="server" style="color: black; position: static;" Height="16px" Width="213px"></asp:label><br />
                                                                        <br />
                                                                        <span class="NormalBold">
                                                                            <br />
                                                                            Your Rating</span> 
                                                                        <br />
                                                                        <br />
                                                                        <asp:RadioButtonList id="Rating" runat="server" Height="139px" Width="107px">
                                                                            <asp:ListItem text="
                                                                                &lt;img src=&quot;Images/reviewrating5.gif&quot; /&gt;
                                                                            " value="5" selected="True"></asp:ListItem>
                                                                            <asp:ListItem text="
                                                                                &lt;img src=&quot;Images/reviewrating4.gif&quot; /&gt;
                                                                            " value="4"></asp:ListItem>
                                                                            <asp:ListItem text="
                                                                                &lt;img src=&quot;Images/reviewrating3.gif&quot; /&gt;
                                                                            " value="3"></asp:ListItem>
                                                                            <asp:ListItem text="
                                                                                &lt;img src=&quot;Images/reviewrating2.gif&quot; /&gt;
                                                                            " value="2"></asp:ListItem>
                                                                            <asp:ListItem text="
                                                                                &lt;img src=&quot;Images/reviewrating1.gif&quot; /&gt;
                                                                            " value="1"></asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <br />
                                                        <asp:ImageButton id="ImageButton1" onclick="ReviewAddBtn_Click" runat="server" ImageURL="images/submit.gif" ValidationGroup="5" style="position: static"></asp:ImageButton><br />
                                                        <span class="NormalBold"></span> &nbsp;<br />
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <br />
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

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
  
            int rating = Int32.Parse(Rating.SelectedItem.Value);
 
            ReviewsDB review = new ReviewsDB();
            review.AddReview(productID, Server.HtmlEncode(Name.Text), Server.HtmlEncode(Email.Text), rating, Server.HtmlEncode(Comment.Text));
    
            Response.Redirect("ProductDetails.aspx?ProductID=" + productID);
        }
    }

</script>
<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" marginwidth="0" marginheight="0">
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
                                    <form runat="server">
                                        <img src="images/1x1.gif" width="24" align="left" /> 
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="ContentHead" style="color: #ffffff; background-color: #3399cc">
                                                        <img height="32" src="images/1x1.gif" width="60" align="left" />Add Review - 
                                                        <asp:label id="ModelName" runat="server" style="color: #ffffff"></asp:label>
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
                                                                        <span class="NormalBold">Name</span> 
                                                                        <br />
                                                                        <asp:TextBox id="Name" runat="server" size="20"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ErrorMessage="'Name' must not be left blank." Font-Size="9pt" Font-Name="verdana" Display="Dynamic" ControlToValidate="Name"></asp:RequiredFieldValidator>
                                                                        <br />
                                                                        <br />
                                                                        <span class="NormalBold">Email</span> 
                                                                        <br />
                                                                        <asp:TextBox id="Email" runat="server" size="20"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ErrorMessage="'Email' must not be left blank." Font-Size="9pt" Font-Name="verdana" Display="Dynamic" ControlToValidate="Email"></asp:RequiredFieldValidator>
                                                                        <br />
                                                                        <br />
                                                                        <span class="NormalBold">Rating</span> 
                                                                        <br />
                                                                        <br />
                                                                        <asp:RadioButtonList id="Rating" runat="server">
                                                                            <asp:ListItem text="Five" value="5" selected="True">
                                                                                <img src="Images/reviewrating5.gif" />
                                                                            </asp:ListItem>
                                                                            <asp:ListItem text="Four" value="4">
                                                                                <img src="Images/reviewrating4.gif" />
                                                                            </asp:ListItem>
                                                                            <asp:ListItem text="Three" value="3">
                                                                                <img src="Images/reviewrating3.gif" />
                                                                            </asp:ListItem>
                                                                            <asp:ListItem text="Two" value="2">
                                                                                <img src="Images/reviewrating2.gif" />
                                                                            </asp:ListItem>
                                                                            <asp:ListItem text="One" value="1">
                                                                                <img src="Images/reviewrating1.gif" />
                                                                            </asp:ListItem>
                                                                        </asp:RadioButtonList>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <br />
                                                        <br />
                                                        <span class="NormalBold">Comments</span> 
                                                        <br />
                                                        <asp:TextBox id="Comment" runat="server" columns="60" rows="7" textmode="multiline"></asp:TextBox>
                                                        <asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ErrorMessage="'Comment' must not be left blank." Font-Size="9pt" Font-Name="verdana" Display="Dynamic" ControlToValidate="Comment"></asp:RequiredFieldValidator>
                                                        <br />
                                                        <br />
                                                        <asp:ImageButton id="ImageButton1" onclick="ReviewAddBtn_Click" runat="server" ImageURL="images/submit.gif"></asp:ImageButton>
                                                        <br />
                                                        <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </form>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
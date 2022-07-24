<%@ Page Language="C#" EnableViewState="false" %>

<%@ Register TagPrefix="uc1" TagName="ReviewList" Src="_ReviewList.ascx" %>

<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>
<%@ OutputCache Duration="60" VaryByParam="ProductID" %>

<script runat="server">

    
    
    void Page_Load(Object sender, EventArgs e)
    {


        int ProductID = Int32.Parse(Request.Params["ProductID"]);

        ProductsDB products = new ProductsDB();
        ProductDetails myProductDetails = products.GetProductDetails(ProductID);

        companyName.Text = myProductDetails.CompanyName;
        desc.Text = myProductDetails.Description;
        UnitCost.Text = String.Format("{0:c}", myProductDetails.UnitCost);
        ModelName.Text = myProductDetails.ModelName;
        ModelNumber.Text = myProductDetails.ModelNumber.ToString();
        ProductImage.ImageUrl = "ProductImages/big/" + myProductDetails.ProductImageBig;
        addToCart.NavigateUrl = "AddToCart.aspx?ProductID=" + ProductID;
       // ReviewList.ProductID = ProductID;
      //  AlsoBoughtList.ProductID = ProductID;
    }

    protected void AlsoBoughtList_Load(object sender, EventArgs e)
    {

    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        int ProductID = Int32.Parse(Request.Params["ProductID"]);
        
        Response.Redirect("AddReview2.aspx?ProductId="+ProductID);
    }
</script>

<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" marginheight="0"
    marginwidth="0">
    <form id="form1" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody>
                <tr>
                    <td colspan="2">
                        <uc1:Header ID="Header1" runat="server"></uc1:Header>
                    </td>
                </tr>
                <tr>
                    <td valign="top" width="145" style="background-color: #3399cc">
                        <uc1:Menu ID="Menu1" runat="server"></uc1:Menu>
                        <img height="1" src="images/1x1.gif" width="145" />
                    </td>
                    <td valign="top" align="left">
                        <table height="100%" cellspacing="0" cellpadding="0" width="620" align="left" border="0">
                            <tbody>
                                <tr valign="top">
                                    <td>
                                        <br />
                                        <img src="images/1x1.gif" width="24" align="left" />
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="ContentHead" style="background-color: #3399cc">
                                                        <img height="32" src="images/1x1.gif" width="60" align="left" />
                                                        <asp:Label ID="ModelName" runat="server" Style="color: #ffffff"></asp:Label>
                                                        <br />
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0" valign="top">
                                            <tbody>
                                                <tr valign="top">
                                                    <td rowspan="2">
                                                        <img height="1" src="images/1x1.gif" width="24" />
                                                    </td>
                                                    <td style="font-weight: bold; color: seagreen; height: 898px; text-decoration: underline;
                                                        width: 357px;">
                                                        <img height="15" src="images/1x1.gif" />
                                                        <br />
                                                        <asp:Image ID="ProductImage" runat="server" border="0" Width="220" Height="270"></asp:Image>
                                                        <br />
                                                        <br />
                                                        <span class="UnitCost"><b style="font-weight: bolder;
                                                            color: seagreen; text-decoration: underline">Your Price:</b>&nbsp;<asp:Label
                                                                ID="UnitCost" runat="server" Style="color: darkgray"></asp:Label>$ </span>
                                                        <br />
                                                        <span class="ModelNumber"><b style="font-weight: normal;
                                                            font-size: larger; color: seagreen; text-decoration: underline">
                                                            <br />
                                                            ModelNumber:</b>&nbsp;<br />
                                                            <asp:Label
                                                                ID="ModelNumber" runat="server" Style="color: darkgray; font-size: larger;"></asp:Label>
                                                            <br />
                                                        </span>
                                                        <br />
                                                        Company Name:<asp:Label
                                                            ID="companyName" runat="server" Style="color: darkgray" Width="90px"></asp:Label><br />
                                                        <br />
                                                        <br />
                                                        &nbsp;<asp:HyperLink ID="addToCart" runat="server" ImageUrl="~/images/img(1).gif" Height="36px"></asp:HyperLink>
                                                        <br />
                                                        <br />
                                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="24px" ImageUrl="~/images/review_this_product.gif"
                                                            Style="position: static" Width="238px" OnClick="ImageButton1_Click" /><br />
                                                        <br />
                                                        </td>
                                                    <td style="height: 898px">
                                                        <table width="300" border="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td valign="top">
                                                                        <br />
                                                                        <br />
                                                                        <asp:Label class="NormalDouble" ID="desc" runat="server"></asp:Label>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <img src="images/1x1.gif" style="width: 42px; height: 165px" />&nbsp;<br />
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <br />
                                                        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
                                                            id="coolspot" style="width: 584px; height: 130px">
                                                            <param name="movie" value="images/coolspot.swf">
                                                            <param name="quality" value="high">
                                                            <param name="bgcolor" value="#000000">
                                                            <embed name="coolspot" src="images/coolspot.swf" quality="high" bgcolor="#000000"
                                                                width="800" height="60" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
                                                            </embed>
                                                        </object>
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table border="0">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <img height="20" src="images/1x1.gif" width="89" />
                                                    </td>
                                                    <td width="100%">
                                                        &nbsp;</td>
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

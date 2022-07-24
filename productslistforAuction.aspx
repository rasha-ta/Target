<%@ Page Language="C#" EnableViewState="false" %>

<%@ Register TagPrefix="ASPNETCommerce" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="ASPNETCommerce" TagName="Menu" Src="_Menu.ascx" %>
<%@ OutputCache Duration="1" VaryByParam="CategoryID" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    
    
    void Page_Load(Object sender, EventArgs e)
    {

        // Obtain categoryId from QueryString
        //int categoryId = Int32.Parse(Request.Params["CategoryID"]);

        // Obtain products and databind to an asp:datalist control
        ProductsDB productCatalogue = new ProductsDB();
        DateTime d = DateTime.Now;
        MyList.DataSource = productCatalogue.GetProductsForAuction(d);
        MyList.DataBind();
    }

</script>

<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
<form id="form1" runat=server>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td colspan="2">
                    <ASPNETCommerce:Header ID="Header1" runat="server"></ASPNETCommerce:Header>
                </td>
            </tr>
            <tr>
                <td valign="top" style="width: 212px; height: 449px; background-color: #3399cc;">
                    <ASPNETCommerce:Menu ID="Menu1" runat="server"></ASPNETCommerce:Menu>
                    <img height="1" src="images/1x1.gif" width="145" />
                </td>
                <td valign="top" nowrap="nowrap" align="left" width="100%" style="height: 449px">
                    <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                        <tbody>
                            <tr valign="top">
                                <td nowrap="nowrap" style="width: 792px; height: 449px;">
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
                                    <br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                                    <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Size="X-Large" ForeColor="Goldenrod"
                                        Height="37px" Style="position: static; font-weight: bold; color: #ff6600;"
                                        Text="Products For Auction:" Width="358px"></asp:Label>&nbsp;<br />
                                    <br />
                                    <br />
                                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
                                        id="coolspot" width="800" height="60">
                                        <param name="movie" value="images/coolspot.swf">
                                        <param name="quality" value="high">
                                        <param name="bgcolor" value="#000000">
                                        <embed name="coolspot" src="images/coolspot.swf" quality="high" bgcolor="#000000"
                                            width="800" height="60" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
                                        </embed>
                                    </object>
                                    <br />
                                    <br />
                                    <asp:DataList ID="MyList" runat="server" RepeatColumns="2">
                                        <ItemTemplate>
                                            <table border="0" width="300">
                                                <tr>
                                                    <td width="25">
                                                        &nbsp;
                                                    </td>
                                                    <td width="100" valign="middle" align="right">
                                                        <a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'>
                                                            <img src='ProductImages/thumbs/<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>'
                                                                width="100" height="75" border="0" />
                                                        </a>
                                                    </td>
                                                    <td width="200" valign="middle">
                                                        <a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'
                                                            width="100"><span class="ProductListHead">
                                                                <%# DataBinder.Eval(Container.DataItem, "ModelName") %>
                                                            </span>
                                                            <br />
                                                        </a><span class="ProductListItem"><b>Last Price: </b>
                                                            <%# DataBinder.Eval(Container.DataItem, "LastPrice") %>
                                                        </span>
                                                        <br />
                                                        <span class="ProductListItem"><b>Date Begin For Auction: </b>
                                                            <%# DataBinder.Eval(Container.DataItem, "DateBegin") %>
                                                        </span>
                                                        <br />
                                                        <span class="ProductListItem"><b>Date End For Auction: </b>
                                                            <%# DataBinder.Eval(Container.DataItem, "DateEnd") %>
                                                        </span>
                                                        <br />
                                                    <a href='<%# "AddAuctionPrice.aspx?productID="+ DataBinder.Eval(Container.DataItem, "ProductID") + "&LastPrice="+DataBinder.Eval(Container.DataItem, "LastPrice")+ "&DateEnd=" + DataBinder.Eval(Container.DataItem, "DateEnd")%>'>
                                                            <span class="ProductListItem"><font color="#9d0000"><b style="color: #3333cc">Share Auction</b></font></span></a></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList><br />
                                    <br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
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

<%@ Page Language="C#" EnableViewState="false" %>

<%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<%@ OutputCache Duration="1" VaryByParam="CategoryID" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">    
    void Page_Load(Object sender, EventArgs e)
    {


        int subCategoryId = Int32.Parse(Request.Params["subCategoryID"]);
       // Label1.Text = Request.Params["subcategoryname"];


        ProductsDB productCatalogue = new ProductsDB();

        MyList.DataSource = productCatalogue.GetProductsBYSubCat(subCategoryId);
        MyList.DataBind();
    }

</script>

<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="form1" runat="server">
        <br />
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody>
                <tr>
                    <td colspan="2">
                        <uc1:Header ID="Header1" runat="server"></uc1:Header>
                    </td>
                </tr>
                <tr>
                    <td valign="top" style="background-color: #3399cc; height: 493px;">
                        <uc1:Menu ID="Menu1" runat="server"></uc1:Menu>
                        <img height="1" src="images/1x1.gif" width="145" />
                    </td>
                    <td valign="top" nowrap="nowrap" align="left" width="100%" style="height: 493px">
                        <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                            <tbody>
                                <tr valign="top">
                                    <td nowrap="nowrap" style="width: 892px">
                                        <br />
                                        <asp:DataList id="MyList" runat="server" RepeatColumns="2">
                                        <ItemTemplate>
                                            <table border="0" width="300">
                                                <tr>
                                                        <td width="25">
                                                        &nbsp; 
                                                        </td>
                                                        <td width="100" valign="middle" align="right">
                                                        <a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'> 
                                                        <img src='ProductImages/thumbs/<%# DataBinder.Eval(Container.DataItem, "ProductImage") %>' width="60" height="50" border="0" /> </a> 
                                                        </td>
                                                        <td width="200" valign="middle" style="font-size: medium">
                                                        <a href='ProductDetails.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'> <span class="ProductListHead"> <%# DataBinder.Eval(Container.DataItem, "ModelName") %> </span> 
                                                        <br />
                                                        </a><span class="ProductListItem"><b style="color: #339933">Special Price: </b> <%# DataBinder.Eval(Container.DataItem, "UnitCost", "{0:c}") %> </span> 
                                                        <br />
                                                        <a href='AddToCart.aspx?productID=<%# DataBinder.Eval(Container.DataItem, "ProductID") %>'> <span class="ProductListItem"><font color="#9d0000"><b style="color: #009933">Add
                                                        To Cart<b>
                                                        </b>
                                                        </b></font></span> </a> 
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                       <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
  codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
  id="welcomecurl" style="width: 888px; height: 97px;">
  <param name="movie" value="images/123-banner_com_332433.swf">
  <param name="quality" value="high">
  <param name="bgcolor" value="#FFFFFF">
  <embed name="welcomecurl" src=" images/123-banner_com_332433.swf" quality="high" bgcolor="#FFFFFF"
    width="468" height="60"
    type="application/x-shockwave-flash"
    pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
  </embed></object>&nbsp;</td>
                                    <td nowrap="nowrap">
                                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
  codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
  id="Object1" style="width: 181px; height: 414px">
  <param name="movie" value="images/123-banner-com_21632.swf">
  <param name="quality" value="high">
  <param name="bgcolor" value="#FFFFFF">
  <embed name="welcomecurl" src="images/123-banner-com_21632.swf" quality="high" bgcolor="#FFFFFF"
    width="468" height="60"
    type="application/x-shockwave-flash"
    pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
  </embed>
</object>
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

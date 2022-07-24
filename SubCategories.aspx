<%@ Page Language="C#" EnableViewState="false" %>

<%@ Register TagPrefix="uc1" TagName="_Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<%@ OutputCache Duration="1" VaryByParam="CategoryID" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">    
    void Page_Load(Object sender, EventArgs e)
    {


        int categoryId = Int32.Parse(Request.Params["CategoryID"]);


        SubCategoryDB SubCategories = new SubCategoryDB();

        MyList1.DataSource = SubCategories.GetSubCategories(categoryId);
        MyList1.DataBind();
    }

    protected void MyList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
</script>

<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
    <form id="form1" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody>
                <tr>
                    <td colspan="2" style="height: 147px">
                        <uc1:_Header ID="_Header1" runat="server"></uc1:_Header>
                    </td>
                </tr>
                <tr>
                    <td valign="top" style="background-color: #3399cc">
                        <uc1:Menu ID="Menu1" runat="server"></uc1:Menu>
                        <img height="1" src="images/1x1.gif" width="145" />
                    </td>
                    <td valign="top" nowrap="nowrap" align="left" width="100%">
                        <table cellspacing="0" cellpadding="0" width="100%" align="left" border="0" style="height: 97%">
                            <tbody>
                                <tr valign="top">
                                    <td nowrap="nowrap" style="height: 149px; color: #3399cc; width: 283px;">
                                        &nbsp; &nbsp;&nbsp;<br />
                                        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                                        <br />
                                        <asp:DataList ID="MyList1" runat="server" RepeatColumns="1" CellPadding="4" Font-Bold="True"
                                            Font-Italic="True" Font-Names="Calisto MT" Font-Overline="False" Font-Size="Larger"
                                            Font-Strikeout="False" Font-Underline="False" ForeColor="#3399CC" Style="color: #3333cc; font-size: large;"
                                            HorizontalAlign="Justify" OnSelectedIndexChanged="MyList1_SelectedIndexChanged">
                                            <ItemTemplate>
                                                <table border="0" width="300">
                                                    <tr>
                                                        <td width="25" style="font-size: large; color: #0033cc">
                                                            &nbsp;
                                                        </td>
                                                        <td valign="middle" width="200" style="color: #0033cc; font-size: large;">
                                                            <a href='ProductsList.aspx?subCategoryID=<%# DataBinder.Eval(Container.DataItem, "SubCategoryID")+"&subcategoryname="+DataBinder.Eval(Container.DataItem, "SubCategoryName") %>'>
                                                                <span class="ProductListHead">
                                                                    <%# DataBinder.Eval(Container.DataItem, "SubCategoryName") %>
                                                                </span>
                                                                <br />
                                                            </a>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Italic="False"
                                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" Font-Italic="False" Font-Overline="False"
                                                Font-Strikeout="False" Font-Underline="False" />
                                            <AlternatingItemStyle BackColor="White" />
                                            <ItemStyle BackColor="#EFF3FB" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                                                Font-Size="X-Large" Font-Strikeout="False" Font-Underline="False" ForeColor="#3399CC" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                Font-Underline="False" />
                                            <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
                                                Font-Underline="False" />
                                        </asp:DataList>
                                        &nbsp;&nbsp; &nbsp; &nbsp;<br />
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
                                        &nbsp;</td>
                                    <td nowrap="nowrap" style="width: 388px; color: #3399cc; height: 149px">
                                        <table style="width: 366px; position: static; height: 496px">
                                            <tr>
                                                <td colspan="3" rowspan="2">
                                                </td>
                                            </tr>
                                            <tr>
                                            </tr>
                                            <tr>
                                                <td colspan="3">
                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/Computer2.jpg" Style="position: static" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td nowrap="nowrap" style="color: #3399cc; height: 149px">
                                        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
  codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
  id="welcomecurl" style="width: 257px; position: static; height: 482px">
  <param name="movie" value="images/123-banner-com_21625.swf">
  <param name="quality" value="high">
  <param name="bgcolor" value="#FFFFFF">
  <embed name="welcomecurl" src=" images/123-banner-com_21625.swf" quality="high" bgcolor="#FFFFFF"
    width="100" height="400"
    type="application/x-shockwave-flash"
    pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"> 
             
</embed></object></td>
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

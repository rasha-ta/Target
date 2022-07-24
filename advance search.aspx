<%@ Page Language="C#" %>
<%@ Register Src="_Header.ascx" TagName="_Header" TagPrefix="uc1" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">

   
    
    void Page_Load(Object sender, EventArgs e) {
    
     
       
    }

   
    

    protected void Button2_Click(object sender, EventArgs e)
    {
        
        
             
             
        
        
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string categoryId = DropDownList1.SelectedValue;
        string modelName = TextBox1.Text;
        string subcategoryid = DropDownList2.SelectedValue;
       string companyname = DropDownList3.SelectedValue;
        if (!CheckBox1.Checked)
        {
            companyname = "";
            Response.Redirect("~/default4.aspx?catid=" + categoryId + "&modname=" + modelName + "&subcat=" + 0 + "&compname=" + companyname);

        }
        else
        {
            Response.Redirect("~/default4.aspx?catid=" + categoryId + "&modname=" + modelName + "&subcat=" + subcategoryid+"&compname="+companyname);
        }
       
       

    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        DropDownList2.Visible = !DropDownList2.Visible;
    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
       
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
    {
        DropDownList3.Visible = true;
    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript">
// <!CDATA[

function TABLE2_onclick() {

}

// ]]>
</script>
</head>
<body bottommargin="0" leftmargin="0"  topmargin="0" rightmargin="0" >
 <form id="myform" runat="server" >
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td colspan="2" style="height: 198px">
                    <uc1:_Header id="Header1" runat="server" class="HomeHead">
                    </uc1:_Header>
                    &nbsp;
                    </td>
            </tr>
            <tr>
                <td valign="top" style="height: 451px; width:90px; background-color: #3399cc;">
                    <uc1:Menu id="Menu1" runat="server"></uc1:Menu>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
                <td valign="top" nowrap="nowrap" align="left" width=* style="height: 451px">
                    <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                        <tbody>
                            <tr valign="top">
                                <td nowrap="nowrap" style="height: 392px">
                                    <br />
                                    <img src="images/1x1.gif" width="24" align="left" /> 
                                    <table cellspacing="0" cellpadding="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td style="height: 353px">
                                                    <table cellspacing="0" cellpadding="0" width="100%" id="TABLE2" onclick="return TABLE2_onclick()">
                                                        <tbody>
                                                            <tr>
                                                                <td class="HomeHead" style="color: #3333cc; background-color: #cccccc;">
                                                                    &nbsp;search page</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                   
                                                    <table id="Table1" cellspacing="0" cellpadding="2" width="600" border="0" runat="server">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <td style="height: 91px; width: 496px;">
                                                                    <br />
                                                                    <asp:Label ID="Label1" runat="server" Text="Category Name" style="z-index: 100; left: 285px; position: absolute; top: 264px" Height="17px" Width="125px"></asp:Label>
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<asp:DropDownList ID="DropDownList1"
                                                                        runat="server" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryID" style="z-index: 101; left: 434px; position: absolute; top: 273px" Height="21px" Width="150px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                                    </asp:DropDownList><br />
                                                                    &nbsp; &nbsp;<br />
                                                                    <br />
                                                                    <br />
                                                                    &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    <asp:TextBox ID="TextBox1" runat="server" style="z-index: 102; left: 425px; position: absolute; top: 439px" ValidationGroup="3"></asp:TextBox>
                                                                    &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
                                                                    <asp:RequiredFieldValidator ID="req" runat="server" ControlToValidate="TextBox1"
                                                                        Display="dynamic" ErrorMessage="'product Name' must not be left blank." Font-Name="verdana"
                                                                        Font-Size="9pt" Style="left: 593px; position: absolute; top: 442px; z-index: 103;" Width="281px" ValidationGroup="3"></asp:RequiredFieldValidator>
                                                                    &nbsp;&nbsp;<br />
                                                                    &nbsp; &nbsp; 
                                                                    <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Height="21px" Style="z-index: 104;
                                                                        left: 283px; position: absolute; top: 375px" Text="Company Name" Width="123px" OnCheckedChanged="CheckBox2_CheckedChanged" />
                                                                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3"
                                                                        DataTextField="CompanyName" DataValueField="CompanyName" Height="23px" Style="z-index: 109;
                                                                        left: 478px; position: absolute; top: 382px" Width="151px" Visible="False">
                                                                    </asp:DropDownList>
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
                                                                    &nbsp;&nbsp;
                                                                    <br />
                                                                    <br />
                                                                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox1_CheckedChanged"
                                                                        Style="z-index: 106; left: 282px; position: absolute; top: 326px" Text="SubCategoryName" />
                                                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2"
                                                                        DataTextField="SubCategoryName" DataValueField="SubCategoryID" Height="31px"
                                                                        Style="z-index: 107; left: 472px; position: absolute; top: 326px" Visible="False"
                                                                        Width="157px">
                                                                    </asp:DropDownList>
                                                                    &nbsp;
                                                                    <asp:Label ID="Label2" runat="server" Text="ProductName" style="z-index: 108; left: 285px; position: absolute; top: 439px"></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                </td>
                                                                
                                                                
                                                            </tr>
                                                            <tr valign="top">
                                                                <td style="height: 468px; width: 496px;" >
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                                                                    &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp;&nbsp;<br />
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    &nbsp;<br />
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    &nbsp; &nbsp;
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
                                                                    <asp:Button ID="Button1" runat="server" Style="left: 358px; position: absolute; top: 487px; z-index: 102;"
                                                                        Text="Search" Width="142px" OnClick="Button1_Click" ValidationGroup="3" />
                                                                    &nbsp; &nbsp;<br />
                                                                    <br />
                                                                    <br />
                                                                </td>
                                                                <td style="height: 468px; width: 306px;">
                                                                    <br />
                                                                    <span class="NormalDouble">&nbsp;</span></td>
                                                                <td style="height: 468px; width: 2px;">
                                                                    &nbsp; 
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceeConnectionString %>"
                                                                        OnSelecting="SqlDataSource3_Selecting" SelectCommand="SELECT DISTINCT [CompanyName] FROM [CMRC_Products]">
                                                                    </asp:SqlDataSource>
                                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceeConnectionString %>"
                                                                        SelectCommand="SELECT [SubCategoryName], [SubCategoryID] FROM [CMRC_SubCategory]">
                                                                    </asp:SqlDataSource>
                                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceeConnectionString %>"
                                                                        SelectCommand="SELECT [CategoryID], [CategoryName] FROM [CMRC_Category]"></asp:SqlDataSource>
                                                    
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
    </table></form>
</body>
</html>
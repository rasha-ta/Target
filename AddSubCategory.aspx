<%@ Page Language="C#" %>

<%@ Register Src="_Menu3.ascx" TagName="_Menu3" TagPrefix="uc2" %>
<%@ Register Src="_Header.ascx" TagName="_Header" TagPrefix="uc1" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script runat="server">

   
    
    void Page_Load(Object sender, EventArgs e) {
    
     
       
    }


    protected void AddButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid == true)
        {
            SubCategoryDB sub = new SubCategoryDB();
            sub.AddSubCategory(Int32.Parse(DropDownList1.SelectedValue),CategoryName.Text);

        }
    }

    protected void CategoryID_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Header1_Load(object sender, EventArgs e)
    {

    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0"  topmargin="0" rightmargin="0" >
 <form id="Form1" runat="server" >
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td colspan="2">
                    <uc1:_Header id="Header1" runat="server" OnLoad="Header1_Load">
                    </uc1:_Header>
                    &nbsp;
                    </td>
            </tr>
            <tr>
                <td valign="top" width="145" style="height: 414px; background-color: #3399cc;">
                    <uc1:Menu id="Menu1" runat="server"></uc1:Menu>
                    <img height="1" src="images/1x1.gif" width="145" /> 
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
                    </td>
                <td valign="top" nowrap="nowrap" align="left" width=* style="height: 414px">
                    <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                        <tbody>
                            <tr valign="top">
                                <td nowrap="nowrap" style="height: 392px">
                                    <br />
                                    <img src="images/1x1.gif" width="24" align="left" /> 
                                    <table cellspacing="0" cellpadding="0" width="100%">
                                        <tbody>
                                            <tr>
                                                <td style="height: 353px; background-color: #ffffff;">
                                                    <table cellspacing="0" cellpadding="0" width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td class="HomeHead" style="height: 35px; background-color: #3399cc;">
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                   
                                                    <table id="Table1" cellspacing="0" cellpadding="2" width="600" border="0" runat="server">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <td style="height: 57px; width: 496px;">
                                                                    <table width="300">
                                                                        <tbody>
                                                                            <tr valign="top">
                                                                                <td>
                                                                                    <span class="NormalDouble" style="font-size: 16pt"><strong style="color: #0033cc">Add SubCategory</strong></span></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                
                                                                
                                                            </tr>
                                                            <tr valign="top">
                                                                <td style="height: 468px; width: 496px;" >
                                                                    &nbsp;<br />
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp;&nbsp; &nbsp;
                                                                    <br />
                                                                    <asp:Label ID="Label1" runat="server" Style="position: static;" Text="CategoryName"></asp:Label>&nbsp;&nbsp;
                                                                    &nbsp; &nbsp; &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                                                                        DataTextField="CategoryName" DataValueField="CategoryID" Height="22px" Style="position: static;" Width="146px">
                                                                    </asp:DropDownList><br />
                                                                    <br />
                                                                    <asp:Label ID="SubCategoryNameLabel" runat="server" Style="position: static;"
                                                                        Text="SubCategoryName" Width="98px"></asp:Label>
                                                                    &nbsp; &nbsp;<asp:TextBox ID="CategoryName" runat="server" Style="position: static;" Width="146px"></asp:TextBox>
                                                                    &nbsp;<br />
                                                                    <asp:RequiredFieldValidator ID="req" runat="server" ErrorMessage="'SubCategoryName'is required." Font-Size="9pt" Font-Name="verdana" Display="dynamic" ControlToValidate="CategoryName" style="position: static;" Width="281px"></asp:RequiredFieldValidator><br />
                                                                    <br />
                                                                    &nbsp; &nbsp;&nbsp;<br />
                                                                    <br />
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<asp:Button ID="AddButton" runat="server" Style="position: static;" Text="AddSubCategory" Width="146px" OnClick="AddButton_Click" />
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                                                                    &nbsp;
                                                                    <br />
                                                                    <br />
                                                                </td>
                                                                <td style="height: 468px; width: 306px;">
                                                                    <br />
                                                                    <span class="NormalDouble">
                                                                        <uc2:_Menu3 ID="_Menu3_1" runat="server" />
                                                                    </span></td>
                                                                <td style="height: 468px; width: 2px;">
                                                                    &nbsp; 
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
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
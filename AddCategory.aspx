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
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("CategoryAdd", myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;
          
           

            SqlParameter parameterModelNumber = new SqlParameter("@CategoryName", SqlDbType.NVarChar, 50);
            parameterModelNumber.Value = (String)CategoryName.Text;
            myCommand.Parameters.Add(parameterModelNumber);

            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

        }
    }

    protected void CategoryID_TextChanged(object sender, EventArgs e)
    {

    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" >
 <form id="Form1" runat="server" >
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td colspan="2">
                    <uc1:_Header id="Header1" runat="server">
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
                                                <td style="height: 353px">
                                                    <table cellspacing="0" cellpadding="0" width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td class="HomeHead" style="height: 35px">
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
                                                                                    <span class="NormalDouble" style="font-size: 16pt"><strong style="color: #3333cc; background-color: white">Add&nbsp; Category</strong></span></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </td>
                                                                
                                                                
                                                            </tr>
                                                            <tr valign="top">
                                                                <td style="height: 468px; width: 496px;" >
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="CategoryNameLabel" runat="server" Style="position: static;"
                                                                        Text="CategoryName" Width="98px"></asp:Label>
                                                                    <asp:TextBox ID="CategoryName" runat="server" Style="position: static;" Width="146px"></asp:TextBox><br />
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;<br />
                                                                    <br />
                                                                    <br />
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                                                    <asp:Button ID="AddButton" runat="server" Style="position: static;" Text="AddCategory" Width="146px" OnClick="AddButton_Click" />
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                                                                </td>
                                                                <td style="height: 468px; width: 365px;">
                                                                    <br />
                                                                    <span class="NormalDouble">
                                                                        <uc2:_Menu3 ID="_Menu3_1" runat="server" />
                                                                    </span></td>
                                                                <td style="height: 468px; width: 2px;">
                                                                <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
  codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
  id="welcomecurl" style="width: 164px; height: 369px" >
  <param name="movie" value="images/123-banner-com_21636.swf">
  <param name="quality" value="high">
  <param name="bgcolor" value="#FFFFFF">
  <embed name="welcomecurl" src="images/123-banner-com_21636.swf" quality="high" bgcolor="#FFFFFF"
    width="468" height="60"
    type="application/x-shockwave-flash"
    pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
  </embed></object>&nbsp; 
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
                </td>
            </tr>
        </tbody>
    </table></form>
</body>
</html>
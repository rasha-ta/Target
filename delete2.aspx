
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="delete2.aspx.cs" Inherits="Default7" %>

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

   
    

    protected void Button2_Click(object sender, EventArgs e)
    {
           
           
        
        
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      

    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0"topmargin="0" rightmargin="0" >
<form id="Form1" runat="server" >
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td colspan="2">
                    <uc1:_Header id="Header1" runat="server" class="HomeHead">
                    </uc1:_Header>
                    &nbsp;
                    </td>
            </tr>
            <tr>
                <td valign="top" style="height: 451px; width: 145px; background-color: #3399cc ">
                    <uc1:Menu id="Menu1" runat="server"></uc1:Menu>
                    <img height="1" src="images/1x1.gif" width="145" />&nbsp;<br />
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
                                                    <table cellspacing="0" cellpadding="0" width="100%">
                                                        <tbody>
                                                            <tr>
                                                                <td class="HomeHead">
                                                                    &nbsp;</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    
                                                    <table id="Table1" cellspacing="0" cellpadding="2" width="600" border="0" runat="server">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <td style="height: 105px; width: 496px;">
                                                                    <table width="300">
                                                                        <tbody>
                                                                            <tr valign="top">
                                                                                <td>
                                                                                    <span class="NormalDouble" style="font-size: 16pt; color: #3333cc;"><strong style="background-color: #cccccc">Delete Product
                                                                                        successfully</strong></span></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    &nbsp;
                                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Medium"
                                                                        ForeColor="Crimson" Height="1px" Style="z-index: 102; left: 263px; position: absolute;
                                                                        top: 391px" Text="Product Deleted Successfully " Width="529px"></asp:Label>
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                </td>
                                                                <td style="width: 496px; height: 105px">
                                                                    <uc2:_Menu3 ID="_Menu3_1" runat="server" />
                                                                </td>
                                                                
                                                                
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                        &nbsp;
                                                    
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
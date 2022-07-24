<%@ Page Language="C#" %>


<%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu2.ascx" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

    void Page_Load(Object sender, EventArgs e)
    {
        string lp=Request.Params["LastPrice"];
         Label2.Text = "Your Price   "+ lp +" Is Accepted " ;

        //Label2.Text = "Your Price is  : " + Request.Params["LastPrice"];
        // string date = Request.Params["EndDate"];
       // Label1.Text = "Auction will finish in :  " + date + "We Will Send You  Email If You Are The  Winner ";
    }



    void CheckoutBtn_Click(Object sender, ImageClickEventArgs e)
    {
       
    }
   
</script>

<html>
<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0">
<form id="form1"  runat=server>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tbody>
            <tr>
                <td colspan="2">
                    &nbsp;<uc1:Header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td valign="top" style="background-color: #3399cc">
                    <uc1:Menu ID="Menu1" runat="server"></uc1:Menu>
                    <img height="1" src="images/1x1.gif" width="145" />
                </td>
                <td valign="top" nowrap="nowrap" align="left" width="100%">
                    <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                        <tbody>
                            <tr valign="top">
                                <td nowrap="nowrap">
                                    <br />
                                   
                                        <img src="images/1x1.gif" width="24" align="left" />
                                    <img height="4" src="images/1x1.gif" width="110" align="left" />
                                    <font color="red">
                                            &nbsp;</font><br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;<table cellspacing="0" cellpadding="0" width="100%" border="0" style="position: static">
                                            <tbody>
                                                <tr>
                                                    <td class="ContentHead" style="color: #3399cc; background-color: #cccccc">
                                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Price Accepted !</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        <img height="15" src="images/1x1.gif" width="24" align="left" border="0" />
                                        <asp:Panel ID="DetailsPanel" runat="server">
                                            <img height="1" src="images/1x1.gif" width="50" align="left" />
                                            <table height="100%" cellspacing="0" cellpadding="0" width="550" border="0">
                                                <tbody>
                                                    <tr valign="top">
                                                        <td style="width: 654px">
                                                            <img height="1" src="Images/1x1.gif" width="350" />&nbsp;&nbsp;<br />
                                                            &nbsp; &nbsp;
                                                            <br />
                                                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True"
                                        Style="color: #ff6600; position: static; font-size: large;" Text="Your Price accepted "></asp:Label><br />
                                                            <br />
                                                            <br />
                                                            &nbsp;
                                                            <br />
                                                            <asp:Label ID="Label1" runat="server" Height="35px" Style="position: static; color: #ff6600; font-weight: bold; font-size: large;" Text="We Will Send You Email If you Win The Auction "
                                                                Width="515px"></asp:Label>
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <br />
                                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
  codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
  id="welcomecurl" style="width: 989px; position: static; height: 89px;">
  <param name="movie" value="images/123-banner_com_332433.swf">
  <param name="quality" value="high">
  <param name="bgcolor" value="#000000">
  <embed name="er" src=" 
images/123-banner_com_332433.swf" quality="high" bgcolor="#000000"
    width="60" height="604"
    type="application/x-shockwave-flash"
    pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"> 
 </embed></object></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <br />
                                            </asp:Panel>
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


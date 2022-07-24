
<%@ import Namespace="System.Data.SqlClient" %>
<%@ Control Language="C#" %>
<script language="javascript" type="text/javascript">
// <!CDATA[


// ]]>
</script>


<script runat="server">

    
    void Page_Load(Object sender, EventArgs e)
    {
        System.Web.HttpContext context = System.Web.HttpContext.Current;

        if (context.User.Identity.Name != "")
        {
            //CheckCard.Visible = true;
           // SignOut.Visible = true;
           // SignInTd.Visible = false;
        }

    }
    void f1()
    {
        Response.Cookies["FullName"].Value = null;
       // SignInTd.Visible = true;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {

    }

    protected void LinkButton6_Click(object sender, EventArgs e)
    {

    }

    protected void LinkButton11_Click(object sender, EventArgs e)
    {

    }

    protected void LinkButton8_Click(object sender, EventArgs e)
    {
        LinkButton7.Visible = true;
        LinkButton8.Visible = false;
        
    }

    protected void LinkButton7_Click(object sender, EventArgs e)
    {
        LinkButton8.Visible = true;
       // LinkButton7.Visible = false;
       Response.Cookies["FullName"].Value = " in our site";
       
        
        
    }
</script>

<table cellspacing="0" cellpadding="0"  border="0" id="TABLE2" onclick="return TABLE2_onclick()"  width="100%" style="">
    <tr >
        <td colspan="0"  nowrap style="background-color: #3399cc;">
            <table cellspacing="0" cellpadding="0"    border="0" style="height: 41px; width: 1241px;">
                <tr  >
                    <td colspan="0" style=" color: #3399cc; font-style: italic; font-weight: bolder; font-size: larger; background-color: white; height: 105px;" class="HomeHead">
                        &nbsp;<asp:Image ID="Image1" runat="server" Style="position: static" ImageUrl="~/images/dhs_connect.jpg"  />OurTarget&nbsp;</td>
                    <td colspan="0" style=" color: #3399cc; background-color: #3399cc; height: 105px;">
                    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
  codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
  id="welcomecurl" style="width: 990px; height: 100px; background-color: #3399cc;">
  <param name="movie" value="images/welcomecurl.swf">
  <param name="quality" value="high">
  <param name="bgcolor" value="#FFFFFF">
  <embed name="welcomecurl" src="images/welcomecurl.swf" quality="high" bgcolor="#FFFFFF"
    width="468" height="60"
    type="application/x-shockwave-flash"
    pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
  </embed></object>&nbsp;
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="0" nowrap style="background-color: #3399cc;" >
            
                <table cellspacing="0" cellpadding="0"  border="0" id="TABLE1" onclick="return TABLE1_onclick()"  width="100% "style="WIDTH: 1212px; height: 1px;">
                    <tr bgcolor="#9D0000">
                        
                        <td align="right"  colspan="3" style=" background-color: #ff9900; width: 1048px; ">
                            <table cellspacing="0" cellpadding="0"  width="100%" style="  position:static; background-color: #ff9900;">
                                <tr>
                                <td colspan="1" rowspan="3" style="HEIGHT: 10px">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="LinkButton12" runat="server" style="color: #3399cc; font-weight: bold;" PostBackUrl="Default.aspx" OnClick="LinkButton11_Click">Home</asp:LinkButton></td>
                                <td colspan="1" rowspan="3" style="HEIGHT: 10px">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="LinkButton11" runat="server" style="color: #3399cc; font-weight: bold;" PostBackUrl="advance search.aspx" OnClick="LinkButton11_Click">Search</asp:LinkButton></td>
                                    <td colspan="1" rowspan="3" style="HEIGHT: 10px">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="LinkButton10" runat="server" style="color: #3399cc; font-weight: bold;" PostBackUrl="AboutUs.aspx">AboutUs</asp:LinkButton></td>
                                        <td colspan="0" rowspan="0" style=" height: 10px;">
                                        &nbsp; &nbsp; 
                                        <asp:LinkButton ID="LinkButton1" runat="server" style="color: #3399cc; font-weight: bold;" PostBackUrl="~/Register.aspx">SignUp</asp:LinkButton></td>
                                    <td colspan="0" rowspan="0" style=" height: 10px">
                                        &nbsp; &nbsp;&nbsp;
                                        <asp:LinkButton ID="LinkButton7" runat="server" style="color: #3399cc; font-weight: bold;" PostBackUrl="~/Default.aspx" OnClick="LinkButton7_Click">SignOut</asp:LinkButton></td>
                                        
                                    <td colspan="0" rowspan="0" style=" height: 10px;">
                                        &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="LinkButton8" runat="server" style="color: #3399cc; font-weight: bold;" PostBackUrl="~/Login.aspx" OnClick="LinkButton8_Click">SignIn</asp:LinkButton></td>
                                        
                                    <td colspan="0" rowspan="0" style=" height: 10px;">
                                        &nbsp; &nbsp; 
                                        <asp:LinkButton ID="LinkButton6" runat="server" style="color: #3399cc; font-weight: bold;" PostBackUrl="CheckAccount.aspx">CheckAccount</asp:LinkButton></td>
                                    <td colspan="0" rowspan="0" style="height: 10px; ">
                                        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                        <asp:LinkButton ID="LinkButton5" runat="server" style="color: #3399cc; font-weight: bold;" PostBackUrl="~/ChargeYourAccount.aspx">ChargeAccount</asp:LinkButton></td>
                                    <td colspan="0" rowspan="0" style=" height: 10px">
                                        &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="LinkButton4" runat="server" style="color: #3399cc; font-weight: bold;" PostBackUrl="~/BuyCard2.aspx">BuyCard</asp:LinkButton></td>
                                    <td colspan="0" rowspan="0" style=" height: 10px; ">
                                        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;
                                        <asp:LinkButton ID="LinkButton3" runat="server" style="color: #3399cc; font-weight: bold;" PostBackUrl="~/OrderList.aspx">Orders</asp:LinkButton></td>
                                    <td colspan="0" rowspan="0" style=" height: 10px">
                                        &nbsp; &nbsp; &nbsp;&nbsp;
                                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" style="color: #3399cc; font-weight: bold;" PostBackUrl="productslistforAuction.aspx" >Auction</asp:LinkButton></td>
                                        <td colspan="1" rowspan="3" style="HEIGHT: 10px">
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:LinkButton ID="LinkButton13" runat="server" style="color: #3399cc; font-weight: bold;" PostBackUrl="ShoppingCart.aspx" OnClick="LinkButton11_Click">Cart</asp:LinkButton></td>
                                    <td colspan="0" rowspan="0" style="width: 37px; height: 10px">
                                    </td>
                                    <td colspan="0" rowspan="0" style="width: 37px; height: 10px; background-color: #ff9900;">
                                    </td>
                                </tr>
                                
                            </table>
                        </td>
                    </tr>
                </table>
            
        </td>
    </tr>
</table>

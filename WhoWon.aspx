<%@ Page Language="C#" %>
<%@ Register Src="_Header.ascx" TagName="_Header" TagPrefix="uc1" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu2.ascx" %>
<script runat="server">
    void Page_Load(Object sender, EventArgs e) {
    
        
        
        int ProductID = Int32.Parse(Request.Params["AuctionProductID"]);
        
        
       AuctionDB Auction = new AuctionDB();
       int[] value=new int[3];
       value = Auction.GetAuctionInfo(ProductID);
      
             if (value != null)
             {
                 CustomersDB Costomer = new CustomersDB();
                 CustomersDB Custom = new CustomersDB();
                 CustomerDetails CustomDetaile = Custom.GetCustomerDetails(value[0].ToString());
               PriceLabel.Text = value[1].ToString();
                 ProductsDB prod = new ProductsDB();
                 ProductDetails prodDetaile = prod.GetProductDetails(ProductID);
                 Image1.ImageUrl = "ProductImages/thumbs/" + prodDetaile.ProductImage;
                 productNameLabel.Text = prodDetaile.ModelName;
                 CustomerLabel.Text = CustomDetaile.FullName;
                 //System.Web.HttpContext context = System.Web.HttpContext.Current;
                 //int CusID = Int32.Parse(context.User.Identity.Name);
                 //if (CusID == value[0])
                 //{
                     //Label1.Visible = true;
                 //}

                // HyperLink1.Visible = false;
             }

           
       
            
            
       
        
    }

   
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
<script language="javascript" type="text/javascript">
// <!CDATA[



// ]]>
</script>
</head>
<body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" >
<form id="form1" runat=server>
    <table id="table" cellspacing="0" cellpadding="0" width="100%" border="0" style="height: 568px">
        <tbody>
            <tr>
                <td colspan="2" style="height: 83px">
                    <uc1:_Header id="Header1" runat="server">
                    </uc1:_Header></td>
            </tr>
            <tr>
                <td valign="top" width="145" style="background-color: #3399cc">
                    <uc1:Menu id="Menu1" runat="server"></uc1:Menu>
                    <img height="1" src="images/1x1.gif" width="145" /> 
                </td>
                <td valign="top" nowrap="nowrap" align="left" width=*>
                    <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                        <tbody>
                            <tr valign="top">
                                <td nowrap="nowrap" style="height: 473px">
                                    &nbsp;<table cellspacing="0" cellpadding="0" width="100%" style="height: 413px">
                                        <tbody>
                                            <tr>
                                                <td style="height: 437px">
                                                                    <table
                                                                        style="width: 587px; height: 251px;">
                                                                        <tr>
                                                                            <td colspan="3" style="font-size: 20pt; height: 1px; background-color: #cccccc;">
                                                                                WINNER</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 194px; height:1px;">
                                                                                <br />
                                                                                <br />
                                                                                The Winner Coustomer Name :<br />
                                                                                <br />
                                                                                &nbsp; &nbsp; &nbsp;&nbsp;</td>
                                                                            <td style="width: 185px; height: 1px;">
                                                                                <asp:Label ID="CustomerLabel" runat="server" Font-Underline="False" ForeColor="Red"
                                                                                    Height="34px" Style="font-weight: bold; font-size: 20pt; color: #000000; position: static"
                                                                                    Width="147px"></asp:Label><br />
                                                                            </td>
                                                                            <td style="width: 147px; height: 1px;">
                                                                                <br />
                                                                                <br />
                                                                                <br />
                                                                                <br />
                                                                    </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 194px; height: 3px">
                                                                                &nbsp;<br />
                                                                                <br />
                                                                                With Price &nbsp; &nbsp; &nbsp;:&nbsp;<br />
                                                                                <br />
                                                                            </td>
                                                                            <td style="width: 185px; height: 3px">
                                                                                &nbsp;<asp:Label ID="PriceLabel" runat="server" Style="font-size: 15pt; color: #000000;
                                                                                    position: static" Width="113px"></asp:Label></td>
                                                                            <td style="width: 147px; height: 3px">
                                                                                &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
                                                                                <asp:Image ID="Image1" runat="server" Height="73px" Style="position: static" Width="99px" /></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 194px; height: 3px">
                                                                                <br />
                                                                                On Product&nbsp; :<br />
                                                                            </td>
                                                                            <td style="width: 185px; height: 3px">
                                                                                <asp:Label ID="productNameLabel" runat="server" Style="position: static" Text="  ProductNameLabel"></asp:Label></td>
                                                                            <td style="width: 147px; height: 3px">
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                    <table cellspacing="0" cellpadding="2" width="600" border="0" id="TABLE1" onclick="return TABLE1_onclick()">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <td style="width: 536px; height: 14px;">
                                                                    <table width="300">
                                                                        <tbody>
                                                                            <!--tr valign="top">
                                                                                <td style="width: 323px; height: 22px;">
                                                                                    <span class="NormalDouble">&nbsp;<strong><span style="font-size: 14pt">Winner</span></strong></span></td>
                                                                            </tr-->
                                                                        </tbody>
                                                                    </table>
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br />
                                                                    &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp;&nbsp; 
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;</td>  
                                                            </tr>
                                                            <tr valign="top">
                                                                
                                                                
                                                                
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <br />
                                    &nbsp;</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </tbody>
    </table></form>
</body>
</html>
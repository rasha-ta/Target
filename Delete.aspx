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
 

    

    protected void Button2_Click(object sender, EventArgs e)
    {
        ProductsDB prod = new ProductsDB();
        
        ProductDetails proddetaile=new ProductDetails();
        
        proddetaile=prod.GetProductDetails(Int32.Parse(DropDownList1.SelectedValue));
        ModelName.Visible = true;
        ModelNameLabel.Visible = true;
        ModelNumber.Visible = true;
        Cost.Visible = true;
       


        Image1.Visible = true;         
       
        Button1.Visible = true;
        DescriptionLabel.Visible = true;
        Description.Visible = true;
        ModelNumberLabel.Visible = true;
        
        
        CostLabel.Visible = true;
       
        
        ModelNumber.Text = proddetaile.ModelNumber;
        ModelName.Text = proddetaile.ModelName;
        Cost.Text = proddetaile.UnitCost.ToString();
        
        
        Description.InnerText = proddetaile.Description;
        Image1.ImageUrl = "ProductImages/big/" + proddetaile.ProductImageBig;
        if (proddetaile.ForAuction == 1)
        {
            EndDateTextBox.Visible = true;
            CheckBox1.Visible = true;
            CheckBox1.Checked = true;
                
            Label1.Visible = true;
            EndDateTextBox.Text = proddetaile.DateEnd.ToString();
        }
        
             
             
        
        
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
        SqlCommand myCommand = new SqlCommand("DeleteProduct", myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
        parameterProductID.Value = DropDownList1.SelectedValue;
        myCommand.Parameters.Add(parameterProductID);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
        Response.Redirect("~/delete2.aspx");

    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>
    <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
</head>
<body bottommargin="0" leftmargin="0"  topmargin="0" rightmargin="0" >
<form id="myform" runat="server" >
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
                <td valign="top" style="height: 451px; width: 145px; background-color: #3399cc">
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
                                                                                <td style="height: 22px">
                                                                                    <span class="NormalDouble" style="font-size: 16pt; color: #3333cc;"><strong>Delete Product</strong></span></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <br />
                                                                    <asp:Label ID="CatLabel" runat="server" Style="position: static;"
                                                                        Text="SelectProduct" Width="111px" ></asp:Label>
                                                                    &nbsp; &nbsp;&nbsp; &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                                                                        DataTextField="ModelName" DataValueField="ProductID" Style="position: static;" Width="151px">
                                                                    </asp:DropDownList>
                                                                    &nbsp;&nbsp;
                                                                    <br />
                                                                    <asp:Button ID="Button2" runat="server" Text="Select Product" Width="162px" OnClick="Button2_Click" style="position: static;" Font-Bold="True" Font-Overline="False" Font-Strikeout="False" />
                                                                    &nbsp;&nbsp;
                                                                    <br />
                                                                </td>
                                                                
                                                                
                                                            </tr>
                                                            <tr valign="top">
                                                                <td style="height: 384px; width: 496px;" >
                                                                    &nbsp; &nbsp;<br />
                                                                    &nbsp;
                                                                    <asp:Label ID="ModelNumberLabel" runat="server" Text="ModelNumber" Width="93px" Visible="false" style="position: static;"></asp:Label>
                                                                    <asp:TextBox ID="ModelName" runat="server" Style="left: 356px; position: absolute;
                                                                        top: 437px; z-index: 100;" Width="146px" Visible="false" Enabled="False"></asp:TextBox>
                                                                        
                                                                    <asp:Label ID="ModelNameLabel" runat="server" Style="left: 246px; position: absolute; top: 438px; z-index: 101;"
                                                                        Text="ProductName" Width="98px" Visible="False"></asp:Label>
                                                                    <asp:TextBox ID="Cost" runat="server" Style="left: 353px; position: absolute; top: 480px; z-index: 102;" Width="146px" Visible="false" Enabled="False"></asp:TextBox>
                                                                    <asp:Label ID="CostLabel" runat="server" Style="left: 244px; position: absolute;
                                                                        top: 469px; z-index: 103;" Text="Cost" Width="56px" Visible="False"></asp:Label>
                                                                    <asp:TextBox ID="ModelNumber" runat="server" style="left: 352px; position: absolute; top: 400px; z-index: 110;" Width="146px" Visible="false" Enabled="False"></asp:TextBox>
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp;&nbsp; &nbsp;
                                                                    &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                                                                    &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                                                                    <br />
                                                                    <br />
                                                                        <asp:Label ID="DescriptionLabel" runat="server" Style="font-weight: bold; z-index: 105; left: 253px; position: absolute; top: 516px;" Text="Description"
                                                                            Width="158px" Visible="false"></asp:Label>
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
                                                                    <asp:TextBox ID="EndDateTextBox" runat="server" Style="left: 370px; position: absolute;
                                                                        top: 717px; z-index: 106;" Width="146px" Enabled="False" Visible="False"></asp:TextBox>
                                                                    <asp:Label ID="Label1" runat="server" Style="left: 236px; position: absolute; top: 720px; z-index: 107;"
                                                                        Text="EndActionDate&#13;&#10;      "
                                                                        Width="105px" Visible="False"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                                    <br />
                                                                    <asp:CheckBox ID="CheckBox1" runat="server" Text="For Auction" Visible="False" style="z-index: 108; left: 236px; position: absolute; top: 678px" Height="19px" Width="116px" />
                                                                    &nbsp;<br />
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                                                    <asp:Button ID="Button1" runat="server" Style="position: static;"
                                                                        Text="DeleteProduct" Width="142px" OnClick="Button1_Click" Visible="false" />
                                                                    &nbsp;&nbsp;&nbsp;<br />
                                                                    <br />
                                                                    <br />
                                                                </td>
                                                                <td style="height: 384px; width: 306px;">
                                                                    <br />
                                                                    <span class="NormalDouble">
                                                                        <textarea id="Description" runat="server" style="left: 265px; width: 240px; position: absolute;
                                                                            top: 552px; height: 93px" visible="false"></textarea>
                                                                        &nbsp;
                                                                        <asp:Image ID="Image1" runat="server" border="0" Height="270" Width="220" Visible="False" /></span></td>
                                                                <td style="height: 384px; width: 2px;">
                                                                    <uc2:_Menu3 ID="_Menu3_1" runat="server" />
                                                                    &nbsp; 
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceeConnectionString %>"
                                                                        SelectCommand="SELECT [ProductID], [ModelName] FROM [CMRC_Products]"></asp:SqlDataSource>
                                                    
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
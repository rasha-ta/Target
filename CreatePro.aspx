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
            SqlConnection myConnection1 = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand1 = new SqlCommand("getcategoryid", myConnection1);

            myCommand1.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterProductID = new SqlParameter("@subcategoryid", SqlDbType.Int, 4);
            parameterProductID.Value =DropDownList2.SelectedValue ;
            myCommand1.Parameters.Add(parameterProductID);

            SqlParameter parameterCategoryID1 = new SqlParameter("@CategoryID", SqlDbType.Int, 4);
            parameterCategoryID1.Direction = ParameterDirection.Output; ;
            myCommand1.Parameters.Add(parameterCategoryID1);
            myConnection1.Open();
            myCommand1.ExecuteNonQuery();
            myConnection1.Close();

            int categoryid = (int)parameterCategoryID1.Value;

            string text1 = FileUpload1.FileName.ToString();
            string text2 = FileUpload2.FileName.ToString();
            
            if (!CheckBox1.Checked)
            {
                SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
                SqlCommand myCommand = new SqlCommand("ProductAdd", myConnection);
                myCommand.CommandType = CommandType.StoredProcedure;
               
                SqlParameter parameterSubCat = new SqlParameter("@SubCategoryID", SqlDbType.Int, 4);
                parameterSubCat.Value = DropDownList2.SelectedValue;
                myCommand.Parameters.Add(parameterSubCat);

                SqlParameter parameterCat = new SqlParameter("@CategoryID", SqlDbType.Int, 4);
                parameterCat.Value = categoryid;
                myCommand.Parameters.Add(parameterCat);
                
                SqlParameter parameterModelNumber = new SqlParameter("@ModelNumber", SqlDbType.NVarChar, 50);
                parameterModelNumber.Value = (String)ModelNumber.Text;
                myCommand.Parameters.Add(parameterModelNumber);

                SqlParameter parameterModelName = new SqlParameter("@ModelName", SqlDbType.NVarChar, 50);
                parameterModelName.Value = (String)ModelName.Text;
                myCommand.Parameters.Add(parameterModelName);
                
                SqlParameter parameterCompanyName = new SqlParameter("@CompanyName", SqlDbType.NVarChar, 50);
                parameterCompanyName.Value = (String)companynamedrop.SelectedValue;
                myCommand.Parameters.Add(parameterCompanyName);

                SqlParameter parameterProductImage = new SqlParameter("@ProductImage", SqlDbType.NVarChar, 50);
                parameterProductImage.Value = text1;
                myCommand.Parameters.Add(parameterProductImage);

                SqlParameter parameterCost = new SqlParameter("@UnitCost", SqlDbType.Int, 4);
                parameterCost.Value = Int32.Parse(Cost.Text);
                myCommand.Parameters.Add(parameterCost);

                SqlParameter parameterDescription = new SqlParameter("@Description", SqlDbType.NVarChar, 3800);
                parameterDescription.Value = (String)Description.InnerText;
                myCommand.Parameters.Add(parameterDescription);

                SqlParameter parameterProductImageBig = new SqlParameter("@ProductImageBig", SqlDbType.NVarChar, 50);
                parameterProductImageBig.Value = text2;
                myCommand.Parameters.Add(parameterProductImageBig);



                myConnection.Open();
                myCommand.ExecuteNonQuery();
                myConnection.Close();

            }
            else
            {
                SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
                SqlCommand myCommand = new SqlCommand("AuctionProductAdd", myConnection);
                myCommand.CommandType = CommandType.StoredProcedure;
               
                

                SqlParameter parameterModelNumber = new SqlParameter("@ModelNumber", SqlDbType.NVarChar, 50);
                parameterModelNumber.Value = (String)ModelNumber.Text;
                myCommand.Parameters.Add(parameterModelNumber);

                SqlParameter parameterCompanyName = new SqlParameter("@CompanyName", SqlDbType.NVarChar, 50);
                parameterCompanyName.Value = (String)companynamedrop.SelectedValue;
                myCommand.Parameters.Add(parameterCompanyName);
                
                SqlParameter parameterModelName = new SqlParameter("@ModelName", SqlDbType.NVarChar, 50);
                parameterModelName.Value = (String)ModelName.Text;
                myCommand.Parameters.Add(parameterModelName);

                SqlParameter parameterProductImage = new SqlParameter("@ProductImage", SqlDbType.NVarChar, 50);
                parameterProductImage.Value = text1;
                myCommand.Parameters.Add(parameterProductImage);

                SqlParameter parameterCost = new SqlParameter("@UnitCost", SqlDbType.Int, 4);
                parameterCost.Value = Int32.Parse(Cost.Text);
                myCommand.Parameters.Add(parameterCost);

                SqlParameter parameterDescription = new SqlParameter("@Description", SqlDbType.NVarChar, 3800);
                parameterDescription.Value = (String)Description.InnerText;
                myCommand.Parameters.Add(parameterDescription);

                SqlParameter parameterProductImageBig = new SqlParameter("@ProductImageBig", SqlDbType.NVarChar, 50);
                parameterProductImageBig.Value = text2;
                myCommand.Parameters.Add(parameterProductImageBig);

                SqlParameter parameterForAuction = new SqlParameter("@ForAuction", SqlDbType.Int, 4);
                parameterForAuction.Value = 1;
                myCommand.Parameters.Add(parameterForAuction);

                SqlParameter parameterLastPrice = new SqlParameter("@LastPrice", SqlDbType.Int, 4);
                parameterLastPrice.Value = 0;
                myCommand.Parameters.Add(parameterLastPrice);

                SqlParameter parameterDateBegin = new SqlParameter("@DateBegin", SqlDbType.DateTime, 8);
                parameterDateBegin.Value = DateTime.Now ;
                myCommand.Parameters.Add(parameterDateBegin);

                SqlParameter parameterDateEnd = new SqlParameter("@DateEnd", SqlDbType.DateTime, 8);
                parameterDateEnd.Value = DateTime.Parse(EndDateTextBox.Text);
                myCommand.Parameters.Add(parameterDateEnd);
                SqlParameter parameterSubCat = new SqlParameter("@SubCategoryID", SqlDbType.Int, 4);
                parameterSubCat.Value = DropDownList2.SelectedValue;
                myCommand.Parameters.Add(parameterSubCat);

                SqlParameter parameterCat = new SqlParameter("@CategoryID", SqlDbType.Int, 4);
                parameterCat.Value = categoryid;
                myCommand.Parameters.Add(parameterCat);

                myConnection.Open();
                myCommand.ExecuteNonQuery();
                myConnection.Close();
            }
                 
        }
        Response.Redirect("~/add2.aspx");

    }
    

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        EndDateTextBox.Visible = true;
        Label1.Visible = true;
        
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
                    <uc1:_Header id="Header1" runat="server">
                    </uc1:_Header>
                    &nbsp;
                    </td>
            </tr>
            <tr>
                <td valign="top" style="height: 451px; width: 145px; background-color: #3399cc;">
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
                    </td>
                <td valign="top" nowrap="nowrap" align="left" width=* style="height: 451px">
                    <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
                        <tbody>
                            <tr valign="top">
                                <td nowrap="nowrap" style="height: 392px">
                                    <br />
                                    <img src="images/1x1.gif" width="24" align="left" />&nbsp;
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
                                                    
                                                    <table cellspacing="0" cellpadding="2" width="600" border="0" runat="server">
                                                        <tbody>
                                                            <tr valign="top">
                                                                <td style="height: 73px; width: 496px;">
                                                                    <table width="300">
                                                                        <tbody>
                                                                            <tr valign="top">
                                                                                <td style="height: 22px">
                                                                                    <span class="NormalDouble" style="font-size: 16pt"><strong style="color: #0033cc">Add Product</strong></span></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <br />
                                                                    <br />
                                                                    <br />
                                                                </td>
                                                                
                                                                
                                                            </tr>
                                                            <tr valign="top">
                                                                <td style="height: 468px; width: 496px;" >
                                                                    &nbsp;<asp:TextBox ID="ModelNumber" runat="server" style="left: 348px; position: absolute; top: 327px; z-index: 100;" Width="146px"></asp:TextBox>&nbsp;
                                                                    <asp:Label ID="ModelNumberLabel" runat="server" Text="ModelNumber" Width="93px" style="position: absolute; left: 235px; top: 326px; z-index: 101;"></asp:Label>
                                                                    <asp:TextBox ID="ModelName" runat="server" Style="left: 350px; position: absolute;
                                                                        top: 367px; z-index: 102;" Width="146px"></asp:TextBox>
                                                                        
                                                                    <asp:Label ID="ModelNameLabel" runat="server" Style="left: 233px; position: absolute; top: 361px; z-index: 103;"
                                                                        Text="ProductName" Width="98px"></asp:Label>
                                                                    &nbsp;
                                                                    <asp:TextBox ID="Cost" runat="server" Style="left: 358px; position: absolute; top: 492px; z-index: 104;" Width="146px"></asp:TextBox>
                                                                    <asp:FileUpload ID="FileUpload2" runat="server" Height="20px" Style="z-index: 120;
                                                                        left: 351px; position: absolute; top: 446px" Width="186px" />
                                                                    <asp:Label ID="CostLabel" runat="server" Style="left: 239px; position: absolute;
                                                                        top: 490px; z-index: 106;" Text="Cost" Width="56px"></asp:Label>
                                                                    &nbsp;
                                                                    <asp:FileUpload ID="FileUpload1" runat="server" Style="z-index: 107; left: 348px;
                                                                        position: absolute; top: 405px" Width="188px" />
                                                                    &nbsp;
                                                                    <asp:Label ID="ProductImageLabel" runat="server" Style="position: absolute; left: 235px; top: 408px; z-index: 108;" Text="ProductImage" Width="103px"></asp:Label>
                                                                    <asp:Label ID="ProductImageBigLabel" runat="server" Text="ProductImageBig" style="left: 230px; position: absolute; top: 451px; z-index: 109;" Width="111px"></asp:Label>
                                                                    <asp:Button ID="AddButton" runat="server" Style="left: 351px; position: absolute;
                                                                        top: 813px; z-index: 110;" Text="AddProduct" Width="146px" OnClick="AddButton_Click" />
                                                                    &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                                                                    <asp:CheckBox ID="CheckBox1" runat="server"  OnCheckedChanged="CheckBox1_CheckedChanged"
                                                                        Style="left: 241px; position: absolute; top: 627px; z-index: 111;" Text="For Auction Product"
                                                                        Width="151px" AutoPostBack="True" />
                                                                    <asp:TextBox ID="EndDateTextBox" runat="server" Style="left: 312px; position: absolute;
                                                                        top: 702px; z-index: 112;" Visible="False" Width="146px"></asp:TextBox>
                                                                    <asp:Label ID="Label1" runat="server" Style="left: 252px; position: absolute; top: 669px; z-index: 113;"
                                                                        Text="EndActionDate&#13;&#10;                                                                      In form mm/dd/yyyy " Width="363px" Visible="False"></asp:Label>
                                                                    &nbsp;
                                                                    <asp:DropDownList ID="companynamedrop" runat="server" Style="left: 362px;
                                                                        position: absolute; top: 529px; z-index: 116;" Width="151px">
                                                                            <asp:ListItem>DELL</asp:ListItem>
                                                                            <asp:ListItem>Microsoft</asp:ListItem>
                                                                            <asp:ListItem>Netgear</asp:ListItem>
                                                                            <asp:ListItem>Linksys</asp:ListItem>
                                                                            <asp:ListItem>DLink System</asp:ListItem>
                                                                            <asp:ListItem>Acer</asp:ListItem>
                                                                            <asp:ListItem>MyVu</asp:ListItem>
                                                                            <asp:ListItem>Symantic Corporation</asp:ListItem>
                                                                            <asp:ListItem>Corel Corporation </asp:ListItem>
                                                                            <asp:ListItem>Brother</asp:ListItem>
                                                                            <asp:ListItem>HP</asp:ListItem>
                                                                            <asp:ListItem>ASUS COMPUTER INTERNATIONAL</asp:ListItem>
                                                                            <asp:ListItem>Intel</asp:ListItem>
                                                                            <asp:ListItem>Jaguard</asp:ListItem>
                                                                            <asp:ListItem>IBM</asp:ListItem>
                                                                            <asp:ListItem>Western Digital</asp:ListItem>
                                                                            <asp:ListItem>Sumsung</asp:ListItem>
                                                                            <asp:ListItem>Electronic Arts</asp:ListItem>
                                                                            <asp:ListItem>Logitech</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    <asp:Label ID="Label3" runat="server" Style="z-index: 117; left: 235px; position: absolute;
                                                                        top: 530px" Text="SelectCompany" Width="111px"></asp:Label><asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2"
                                                                        DataTextField="SubCategoryName" DataValueField="SubCategoryID" Style="left: 366px;
                                                                        position: absolute; top: 576px; z-index: 118;" Width="151px">
                                                                        </asp:DropDownList>
                                                                    <asp:Label ID="Label4" runat="server" Style="z-index: 119; left: 229px; position: absolute;
                                                                        top: 575px" Text="SelectSubCatagory" Width="111px"></asp:Label>
                                                                </td>
                                                                <td style="height: 468px; width: 349px;">
                                                                    <br />
                                                                    <span class="NormalDouble">
                                                                        <textarea id="Description" runat="server" style="left: 549px; width: 164px; position: absolute;
                                                                            top: 530px; height: 93px"></textarea>
                                                                        <asp:Label ID="DescriptionLabel" runat="server" Style="font-weight: bold" Text="Description"
                                                                            Width="158px"></asp:Label></span></td>
                                                                <td style="width: 349px; height: 468px">
                                                                </td>
                                                                <td style="height: 468px; width: 2px;">
                                                                    &nbsp;<uc2:_Menu3 ID="_Menu3_1" runat="server" />
                                                                </td>
                                                                <td style="width: 2px; height: 468px">
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                        &nbsp; &nbsp;
                                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceeConnectionString %>"
                                                                        SelectCommand="SELECT * FROM [CMRC_Category]"></asp:SqlDataSource>
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceeConnectionString %>"
                                                            SelectCommand="SELECT [SubCategoryID], [SubCategoryName] FROM [CMRC_SubCategory]">
                                                        </asp:SqlDataSource>
                                                    
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
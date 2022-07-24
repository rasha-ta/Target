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
                if (!CheckBox1.Checked)
                {
                    SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
                    SqlCommand myCommand = new SqlCommand("UpdateProduct", myConnection);
                    myCommand.CommandType = CommandType.StoredProcedure;
                   
                    SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
                    parameterProductID.Value =DropDownList1.SelectedValue;
                    myCommand.Parameters.Add(parameterProductID);
                  
                    SqlParameter parameterModelNumber = new SqlParameter("@ModelNumber", SqlDbType.NVarChar, 50);
                    parameterModelNumber.Value = (String)ModelNumber.Text;
                    myCommand.Parameters.Add(parameterModelNumber);

                    SqlParameter parameterModelName = new SqlParameter("@ModelName", SqlDbType.NVarChar, 50);
                    parameterModelName.Value = (String)ModelName.Text;
                    myCommand.Parameters.Add(parameterModelName);

                 
                    SqlParameter parameterCost = new SqlParameter("@UnitCost", SqlDbType.Decimal, 4);
                    parameterCost.Value = decimal.Parse(Cost.Text);
                    myCommand.Parameters.Add(parameterCost);

                    SqlParameter parameterDescription = new SqlParameter("@Description", SqlDbType.NVarChar, 3800);
                    parameterDescription.Value = (String)Description.InnerText;
                    myCommand.Parameters.Add(parameterDescription);

                 
                    

                    myConnection.Open();
                    myCommand.ExecuteNonQuery();
                    myConnection.Close();

                }
                else
                {
                    SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
                    SqlCommand myCommand = new SqlCommand("UpdateProductForAuction", myConnection);
                    myCommand.CommandType = CommandType.StoredProcedure;
                  
                    SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
                    parameterProductID.Value = DropDownList1.SelectedValue;
                    myCommand.Parameters.Add(parameterProductID);
                    
                    SqlParameter parameterModelNumber = new SqlParameter("@ModelNumber", SqlDbType.NVarChar, 50);
                    parameterModelNumber.Value = (String)ModelNumber.Text;
                    myCommand.Parameters.Add(parameterModelNumber);

                    SqlParameter parameterModelName = new SqlParameter("@ModelName", SqlDbType.NVarChar, 50);
                    parameterModelName.Value = (String)ModelName.Text;
                    myCommand.Parameters.Add(parameterModelName);

         
                    SqlParameter parameterCost = new SqlParameter("@UnitCost", SqlDbType.Int, 4);
                    parameterCost.Value =decimal.Parse(Cost.Text);
                    myCommand.Parameters.Add(parameterCost);

                    SqlParameter parameterDescription = new SqlParameter("@Description", SqlDbType.NVarChar, 3800);
                    parameterDescription.Value = (String)Description.InnerText;
                    myCommand.Parameters.Add(parameterDescription);

         
                    SqlParameter parameterForAuction = new SqlParameter("@ForAuction", SqlDbType.Int, 4);
                    parameterForAuction.Value =1;
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

                    myConnection.Open();
                    myCommand.ExecuteNonQuery();
                    myConnection.Close();
                }
                Response.Redirect("~/update2.aspx");
                     
            }
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
            CheckBox1.Visible = true;
            EndDateTextBox.Visible = true;
           
           AddButton.Visible = true;
            DescriptionLabel.Visible = true;
            Description.Visible = true;
            ModelNumberLabel.Visible = true;
            
            
            
            CostLabel.Visible = true;
            Label1.Visible = true;
           
            Image1.ImageUrl = "ProductImages/big/" + proddetaile.ProductImageBig;
            ModelNumber.Text = proddetaile.ModelNumber;
            ModelName.Text = proddetaile.ModelName;
            Cost.Text = proddetaile.UnitCost.ToString();
            
            
           
            Description.InnerText = proddetaile.Description;
            
            if (proddetaile.ForAuction == 1)
            {
                CheckBox1.Checked = true;
                EndDateTextBox.Text = proddetaile.DateEnd.ToString();
               
            }
            
            
            
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
                    <td valign="top" width="145" style="height: 451px; background-color: #3399cc ">
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
                                                                    <td style="height: 73px; width: 496px;">
                                                                        <table width="300">
                                                                            <tbody>
                                                                                <tr valign="top">
                                                                                    <td>
                                                                                        <span class="NormalDouble" style="font-size: 16pt; color: #3333cc;"><strong>Update Product</strong></span></td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                        <br />
                                                                        <asp:Label ID="CatLabel" runat="server" Style="position: static;"
                                                                            Text="SelectProduct" Width="111px"></asp:Label>
                                                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1"
                                                                            DataTextField="ModelName" DataValueField="ProductID" Style="position: static;" Width="151px">
                                                                        </asp:DropDownList><br />
                                                                        <br />
                                                                        &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
                                                                        <asp:Button ID="Button2" runat="server" Text="Select Product" Width="162px" OnClick="Button2_Click" style="position: static;" /></td>
                                                                    
                                                                    
                                                                </tr>
                                                                <tr valign="top">
                                                                    <td style="height: 468px; width: 496px;" >
                                                                        <asp:Label ID="ModelNumberLabel" runat="server" Text="ModelNumber" Width="93px" style="position: static;" Visible="False"></asp:Label>
                                                                        <asp:TextBox ID="ModelNumber" runat="server" style="position: static;" Width="146px" Visible="False"></asp:TextBox>&nbsp;<br />
                                                                        <br />
                                                                            
                                                                        <asp:Label ID="ModelNameLabel" runat="server" Style="position: static;"
                                                                            Text="ProductName" Width="98px" Visible="False"></asp:Label>
                                                                        &nbsp;<asp:TextBox ID="ModelName" runat="server" Style="position: static;" Width="130px" Visible="False" Height="16px"></asp:TextBox>
                                                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br />
                                                                        <asp:Label ID="CostLabel" runat="server" Style="position: static;" Text="Cost" Width="56px" Visible="False"></asp:Label>
                                                                        &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:TextBox ID="Cost" runat="server" Style="position: static;" Width="132px" Visible="False" Height="16px"></asp:TextBox><br />
                                                                        <br />
                                                                        <asp:Label ID="DescriptionLabel" runat="server" Style="font-weight: bold; position: static;" Text="Description"
                                                                                Width="158px" Visible="False"></asp:Label><br />
                                                                            <textarea id="Description" runat="server" style="width: 240px; position: static; height: 93px" visible="false"></textarea><br />
                                                                        <br />
                                                                        <asp:CheckBox ID="CheckBox1" runat="server"   Style="position: static;" Text="For Auction Product"
                                                                            Width="213px" Visible="False" /><br />
                                                                        <br />
                                                                        &nbsp;<br />
                                                                        &nbsp; &nbsp; &nbsp; &nbsp;
                                                                        &nbsp;<br />
                                                                        <br />
                                                                        <asp:Label ID="Label1" runat="server" Style="position: static;"
                                                                            Text="EndActionDate&#13;&#10;                                                                        In form mm/dd/yyyy" Width="363px" Visible="False"></asp:Label><br />
                                                                        <asp:TextBox ID="EndDateTextBox" runat="server" Style="position: static;" Width="146px" Visible="False"></asp:TextBox><br />
                                                                        <br />
                                                                        <br />
                                                                        <asp:Button ID="AddButton" runat="server" Style="position: static;" Text="Update Product" Width="146px" OnClick="AddButton_Click" Visible="False" /><br />
                                                                        <br />
                                                                        <br />
                                                                        <br />
                                                                        <br />
                                                                        <br />
                                                                        <br />
                                                                        <br />
                                                                        <br />
                                                                        &nbsp;<br />
                                                                        <br />
                                                                    </td>
                                                                    <td style="height: 468px; width: 306px;">
                                                                        <br />
                                                                        <span class="NormalDouble">&nbsp;<br />
                                                                            <br />
                                                                            <asp:Image ID="Image1" runat="server" border="0" Height="270" Visible="False" Width="220" /><br />
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
                                                                            </span></td>
                                                                    <td style="width: 306px; height: 468px">
                                                                        <uc2:_Menu3 ID="_Menu3_1" runat="server" />
                                                                    </td>
                                                                    <td style="height: 468px; width: 2px;">
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
        </table> </form>
    </body>
    </html>
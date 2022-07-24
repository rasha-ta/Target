<%@ Page Language="C#" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
<script runat="server">

  void RegisterBtn_Click(Object sender, ImageClickEventArgs e){
    
        if (Page.IsValid == true) {
    
            ShoppingCartDB shoppingCart = new ShoppingCartDB();
            
            String tempCartId = shoppingCart.GetShoppingCartId();
    
            CustomersDB accountSystem = new CustomersDB();
            String customerId = accountSystem.AddCustomer(Server.HtmlEncode(Name.Text), Email.Text,Security.Encrypt(Password.Text));
    
            if (customerId != "") {
    
                FormsAuthentication.SetAuthCookie(customerId, false);
    
                shoppingCart.MigrateCart(tempCartId, customerId);
    
                Response.Cookies["FullName"].Value = Server.HtmlEncode(Name.Text);
    
                Response.Redirect("Default.aspx");
            }
            else {
                MyError.Text = "Registration failed:&nbsp; That email address is already registered.<br><img align=left height=1 width=92 src=images/1x1.gif>";
            }
        }
    }

    
</script>
<html>
	<head>
		<link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
	</head>
	
	<body bottommargin="0" leftmargin="0"  topmargin="0" rightmargin="0" marginheight="0" marginwidth="0">
	<form id="Form1" runat="server">
		<table cellspacing="0" cellpadding="0" width="100%" border="0">
			<tbody>
				<tr>
					<td colspan="2">
						<uc1:Header id="Header1" runat="server" ></uc1:Header>
					</td>
				</tr>
				<tr>
					<td valign="top" style="background-color: #3399cc">
						<uc1:Menu id="Menu1" runat="server"></uc1:Menu>
						<img height="1" src="images/1x1.gif" width="145" />
					</td>
					<td valign="top" nowrap="nowrap" align="left" width="100%">
						<table height="100%" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
							<tbody>
								<tr valign="top">
									<td nowrap="nowrap">
										<br />
										
											<img height="1" src="images/1x1.gif" width="24" align="left" />
											<table cellspacing="0" cellpadding="0" width="100%" border="0">
												<tbody>
													<tr>
														<td class="ContentHead" style="color: #ffffff; background-color: #3399cc">
															<img height="32" src="images/1x1.gif" width="60" align="left" />Create a New 
															Account
															<br />
														</td>
													</tr>
												</tbody>
											</table>
											<img height="1" src="images/1x1.gif" width="92" align="left" />
											<asp:Label id="MyError" runat="Server" CssClass="ErrorText" EnableViewState="false"></asp:Label>
											<table height="100%" cellspacing="0" cellpadding="0" width="500" border="0">
												<tbody>
													<tr valign="top">
														<td width="550">
															<br />
															<br />
															<span class="NormalBold">Full Name</span>
															<br />
															<asp:TextBox id="Name" runat="server" size="25" ValidationGroup="2"></asp:TextBox>
															&nbsp;
															<asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server" ControlToValidate="Name" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="The Name is required !" ValidationGroup="2"></asp:RequiredFieldValidator>
															<br />
															<br />
															<span class="NormalBold">Email</span>
															<br />
															<asp:TextBox id="Email" runat="server" size="25" ValidationGroup="2"></asp:TextBox>
															&nbsp;
															<asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" ControlToValidate="Email" Display="Dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="Must use a valid email address." ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+" ValidationGroup="2"></asp:RegularExpressionValidator>
															<asp:RequiredFieldValidator id="RequiredFieldValidator2" runat="server" ControlToValidate="Email" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="The Email is required !" ValidationGroup="2"></asp:RequiredFieldValidator>
															<br />
															<br />
															<span class="NormalBold">Password</span>
															<br />
															<asp:TextBox id="Password" runat="server" size="25" TextMode="Password" ValidationGroup="2"></asp:TextBox>
															&nbsp;
															<asp:RequiredFieldValidator id="RequiredFieldValidator3" runat="server" ControlToValidate="Password" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="'Password' must not be left blank." ValidationGroup="2"></asp:RequiredFieldValidator>
															<br />
															<br />
															<span class="NormalBold">Confirm Password</span>
															<br />
															<asp:TextBox id="ConfirmPassword" runat="server" size="25" TextMode="Password" ValidationGroup="2"></asp:TextBox>
															&nbsp;
															<asp:RequiredFieldValidator id="RequiredFieldValidator4" runat="server" ControlToValidate="ConfirmPassword" Display="dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="'Confirm' must not be left blank." ValidationGroup="2"></asp:RequiredFieldValidator>
															<asp:CompareValidator id="CompareValidator1" runat="server" ControlToValidate="ConfirmPassword" Display="Dynamic" Font-Name="verdana" Font-Size="9pt" ErrorMessage="Password fields do not match." ControlToCompare="Password" ValidationGroup="2"></asp:CompareValidator>
															<br />
															<br />
															<asp:ImageButton id="RegisterBtn" onclick="RegisterBtn_Click" runat="server" ImageUrl="images/submit.gif" ValidationGroup="2"></asp:ImageButton>
															<br />
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

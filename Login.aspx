    <%@ Page Language="C#" %>

    <%@ Register TagPrefix="uc1" TagName="Menu" Src="_Menu.ascx" %>
    <%@ Register TagPrefix="uc1" TagName="Header" Src="_Header.ascx" %>

    <script runat="server">

        void LoginBtn_Click(Object sender, ImageClickEventArgs e)
        {


            ShoppingCartDB shoppingCart = new ShoppingCartDB();
            String tempCartID = shoppingCart.GetShoppingCartId();


            CustomersDB accountSystem = new CustomersDB();
            String customerId = accountSystem.Login(email.Text, Security.Encrypt(password.Text));

            if (customerId != null)
            {


                shoppingCart.MigrateCart(tempCartID, customerId);

                CustomerDetails customerDetails = accountSystem.GetCustomerDetails(customerId);
                Response.Cookies["FullName"].Value = customerDetails.FullName;

                if (RememberLogin.Checked == true)
                {
                    Response.Cookies["FullName"].Expires = DateTime.Now.AddMonths(1);
                }
                if (customerDetails.Admin == 0)
                    FormsAuthentication.RedirectFromLoginPage(customerId, RememberLogin.Checked);
                else

                    Response.Redirect("Default_Admin.aspx");

            }
            else
            {
                Message.Text = "Login Failed!";
            }
        }
       

    </script>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link href="ASPNETCommerce.css" type="text/css" rel="stylesheet" />
    </head>
    <body bottommargin="0" leftmargin="0" topmargin="0" rightmargin="0" marginwidth="0"
        marginheight="0">
        <form id="form1" runat="server">
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tbody>
                    <tr>
                        <td colspan="2">
                            <uc1:Header ID="Header1" runat="server"></uc1:Header>
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
                                        <td nowrap="nowrap" style="background-color: #f2f5ff">
                                            <br />
                                            <img height="1" src="images/1x1.gif" width="24" align="left" />
                                            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td class="ContentHead" style="color: #ffffff; background-color: #3399cc">
                                                            <img height="32" src="images/1x1.gif" width="60" align="left" style="color: #cccccc" />Sign
                                                            Into Your Account
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                            <img height="1" src="images/1x1.gif" width="92" align="left" />
                                            <table height="100%" cellspacing="0" cellpadding="0" border="0">
                                                <tbody>
                                                    <tr valign="top">
                                                        <td width="550" align=left>
                                                            <asp:Label class="ErrorText" ID="Message" runat="server"></asp:Label>
                                                            <br />
                                                            <br />
                                                            &nbsp;<span class="NormalBold">Email</span>
                                                            <br />
                                                            &nbsp;<asp:TextBox ID="email" runat="server" size="25" ValidationGroup="1"></asp:TextBox>
                                                            &nbsp;
                                                            <asp:RequiredFieldValidator ID="emailRequired" runat="server" ErrorMessage="The name is required."
                                                                Font-Size="9pt" Font-Name="verdana" Display="dynamic" ControlToValidate="email"
                                                                ValidationGroup="1"></asp:RequiredFieldValidator>
                                                            <asp:RegularExpressionValidator ID="emailValid" runat="server" ErrorMessage="the e-mail isn't valid!"
                                                                Display="Dynamic" ControlToValidate="email" ValidationExpression="[\w\.-]+(\+[\w-]*)?@([\w-]+\.)+[\w-]+"
                                                                ValidationGroup="1"></asp:RegularExpressionValidator>
                                                            <br />
                                                            <br />
                                                            &nbsp;<span class="NormalBold">Password</span>
                                                            <br />
                                                            &nbsp;<asp:TextBox ID="password" runat="server" size="25" TextMode="password" ValidationGroup="1"></asp:TextBox>
                                                            &nbsp;
                                                            <asp:RequiredFieldValidator ID="passwordRequired" runat="server" ErrorMessage="the Password is required"
                                                                Font-Size="9pt" Font-Name="verdana" Display="Static" ControlToValidate="password"
                                                                ValidationGroup="1"></asp:RequiredFieldValidator>&nbsp;
                                                            <br />
                                                            <br />
                                                            <asp:CheckBox ID="RememberLogin" runat="server"></asp:CheckBox>
                                                            <span class="NormalBold">Remember My Sign-In Across Browser Restarts</span>
                                                            <br />
                                                            <br />
                                                            <asp:ImageButton ID="LoginBtn" OnClick="LoginBtn_Click" runat="server" ImageUrl="images/sign_in_now.gif"
                                                                ValidationGroup="1"></asp:ImageButton>&nbsp;<br />
                                                            <br />
                                                            <br />
                                                            <br />
                                                            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0"
                                                                id="welcomecurl" style="width: 979px; height: 104px">
                                                                <param name="movie" value="images/123-banner_com_332463.swf">
                                                                <param name="quality" value="high">
                                                                <param name="bgcolor" value="#FFFFFF">
                                                                <embed name="welcomecurl" src=" images/123-banner_com_332463.swf" quality="high"
                                                                    bgcolor="#FFFFFF" width="979px" height="104px" type="application/x-shockwave-flash"
                                                                    pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash">
      </embed></object><br />
                                                            
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

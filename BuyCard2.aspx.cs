using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class BuyCard2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
     int creditCardPassword  =int.Parse( TextBoxCreditpassword.Text);
     int card_value =int.Parse( DropDownListValue.SelectedValue);
     CustomersDB c = new CustomersDB();
     int credit_account = c.GetCreditAccount(creditCardPassword);
     if (credit_account < card_value)
       LabelError.Text = "we are sorry you don't have enough account to buy this card";
      else 
      {
          int newAccount = credit_account - card_value;
          c.updateCreditAccount(creditCardPassword, newAccount);
          int card_password = c.GetCard_password(card_value);
         // c.updateCard(card_value);
          TextBoxNewAccount.Text = "" + newAccount;
          TextBoxCardPassword.Text = "" + card_password;

       }  
    }
    protected void _Header1_Load(object sender, EventArgs e)
    {

    }
}

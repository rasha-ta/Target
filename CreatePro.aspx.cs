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
using System.Xml;
using System.Xml.XPath;

public partial class AddProduct1 : System.Web.UI.Page
{
    XmlDocument docXML = new XmlDocument();
    XmlElement root;

    // --- 0
    protected void Page_Load(object sender, EventArgs e)
    {
        Label3.Text = ConfigurationSettings.AppSettings["myname"];
 
        docXML.Load(Server.MapPath("cdcatalog.xml"));
        root = docXML.DocumentElement;

    }
    protected bool check_fields()
    {
        if ((TITLE.Text.Equals("")))
        {
            lableTitle.Text = "you must fill this field";
            lableTitle.Visible = true;
            return false;
        }else
            if ((COMPANY.Text.Equals("")))
            {
                lableCompany.Text = "you must fill this field";
                lableCompany.Visible = true;
                return false;
            }
            else
            if ((DESCRIPTION.Text.Equals("")))
        {
            lableDesc.Text = "you must fill this field";
            lableDesc.Visible = true;
            return false;
        }
        else if ((SMALE.Text.Equals("")))
        {
            lableSmall.Text = "you must fill this field";
            lableSmall.Visible = true;
            return false;
        }
        else if ((LARGE.Text.Equals("")))
        {
            lableLarge.Text = "you must fill this field";
            lableLarge.Visible = true;
            return false;
        }
        else
        {


            if (PRICE.Text.Equals(""))
            {
                lablePrice.Text = "you must fill this field";
                lablePrice.Visible = true;
                return false;
            }
            else
            {
                double i = Double.Parse(PRICE.Text);
                if (i < 0)
                {
                    lablePrice.Text = "The Price must be greater than 0";
                    lablePrice.Visible = true;
                    return false;
                }
                String ii = SMALE.Text;


            }
        }
        return true;
    }
    protected void clear_All()
    {
        TITLE.Text = "";
        PRICE.Text = "";
        DESCRIPTION.Text = "";
        COMPANY.Text = "";
        SMALE.Text = "";
    }
    

    protected void Button1_Click(object sender, EventArgs e)
    {
        bool ok = check_fields();
        if (ok==true)
        {
            XmlElement elmXML = docXML.CreateElement("CD");
            string strNEW = "<TITLE>"+TITLE.Text+"</TITLE>"+
            "<COMPANY>"+COMPANY.Text+"</COMPANY>"+
            "<PRICE>"+PRICE.Text+"</PRICE>"+
            "<DESCRIPTION>"+DESCRIPTION.Text+"</DESCRIPTION>"+
            "<PICTURE>"+SMALE.Text+"</PICTURE>"+
            "<BIGPICTURE>"+LARGE.Text+"</BIGPICTURE>";
            elmXML.InnerXml = strNEW;
            docXML.DocumentElement.AppendChild(elmXML);
            docXML.Save(Server.MapPath("cdcatalog.xml"));
            clear_All();
        }
    }
}
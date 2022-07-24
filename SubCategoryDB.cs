using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

/// <summary>
/// Summary description for SubCategoryDB
/// </summary>
public class SubCategoryDB
{
	public SubCategoryDB()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public SqlDataReader GetSubCategories(int categoryID)
    {
             SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
        SqlCommand myCommand = new SqlCommand("SubCategoryList", myConnection);

        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterCategoryID = new SqlParameter("@CategoryID", SqlDbType.Int, 4);
        parameterCategoryID.Value = categoryID;
        myCommand.Parameters.Add(parameterCategoryID);

        myConnection.Open();
       
        SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);

        return result;
    }
    public void AddSubCategory(int CategoryId,string subcategoryname)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
        SqlCommand myCommand = new SqlCommand("SubCategoryAdd", myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterCategoryID= new SqlParameter("@CategoryId", SqlDbType.Int, 4);
        parameterCategoryID.Value = CategoryId;
        myCommand.Parameters.Add(parameterCategoryID);


        SqlParameter parametersubcategoryname = new SqlParameter("@SubCategoryName", SqlDbType.NVarChar, 50);
        parametersubcategoryname.Value = subcategoryname;
        myCommand.Parameters.Add(parametersubcategoryname);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();


    }
   
}

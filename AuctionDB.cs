using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


public class AuctionDB
{
    public AuctionDB()
    {
    }
    public int CheckAccount( String Pass)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
        SqlCommand myCommand = new SqlCommand("CheckAccount", myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;

        //SqlParameter parameterCardID = new SqlParameter("@CardID", SqlDbType.Int, 4);
       // parameterCardID.Value = id;
       // myCommand.Parameters.Add(parameterCardID);

        SqlParameter parameterCardPassword = new SqlParameter("@CardPassword", SqlDbType.NVarChar, 50);
        parameterCardPassword.Value = Pass;
        myCommand.Parameters.Add(parameterCardPassword);

        SqlParameter parameterAccount = new SqlParameter("@Account", SqlDbType.Int, 4);
        parameterAccount.Direction = ParameterDirection.Output;

        myCommand.Parameters.Add(parameterAccount);
        myConnection.Open();
        int i = myCommand.ExecuteNonQuery();
        myConnection.Close();
        if (parameterAccount.Value.ToString() != "")
            return (int)parameterAccount.Value;
        else
            return -1;

    }
    public Boolean CheckAccountforPrice(int id, decimal price)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
        SqlCommand myCommand = new SqlCommand("CheckAccountForPrice", myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterCardID = new SqlParameter("@CardID", SqlDbType.Int, 4);
        parameterCardID.Value = id;
        myCommand.Parameters.Add(parameterCardID);



        SqlParameter parameterAccount = new SqlParameter("@Account", SqlDbType.Int, 4);
        parameterAccount.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(parameterAccount);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

        if ((int)parameterAccount.Value >= price)
            return true;
        return false;





    }
    public void UpdatePrice(int ProductID, int NewPrice)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
        SqlCommand myCommand = new SqlCommand("UpdateAuctionTable", myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterCardID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
        parameterCardID.Value = ProductID;
        myCommand.Parameters.Add(parameterCardID);

        SqlParameter parameterCardPassword = new SqlParameter("@Price", SqlDbType.Int, 4);
        parameterCardPassword.Value = NewPrice;
        myCommand.Parameters.Add(parameterCardPassword);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();


    }
    public int PlaceAauctionOrder(int ProductID, int CustoumerID, int Price, DateTime Date)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
        SqlCommand myCommand = new SqlCommand("PlaceAauctionOrder", myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
        parameterProductID.Value = ProductID;
        myCommand.Parameters.Add(parameterProductID);



        SqlParameter parameterCustomerID = new SqlParameter("@CustomerID", SqlDbType.Int, 4);
        parameterCustomerID.Value = CustoumerID;
        myCommand.Parameters.Add(parameterCustomerID);

        SqlParameter parameterPrice = new SqlParameter("@Price", SqlDbType.Int, 4);
        parameterPrice.Value = Price;
        myCommand.Parameters.Add(parameterPrice);

        SqlParameter parameterAuctionDate = new SqlParameter("@AuctionDate", SqlDbType.DateTime, 8);
        parameterAuctionDate.Value = Date;
        myCommand.Parameters.Add(parameterAuctionDate);

        SqlParameter parameterOrederID = new SqlParameter("@OrderID", SqlDbType.Int, 4);
        parameterOrederID.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(parameterOrederID);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();

        return (int)parameterOrederID.Value;

    }
    //-----------------------------------------------
    public int[] GetAuctionInfo (int ProductID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
        SqlCommand myCommand = new SqlCommand("GetOrderAuctionDetail", myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterCustomerID = new SqlParameter("@CustomerID", SqlDbType.Int, 4);
        parameterCustomerID.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(parameterCustomerID);

        SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
        parameterProductID.Value = ProductID;
        myCommand.Parameters.Add(parameterProductID);

        SqlParameter parameterMaxPrice = new SqlParameter("@Price", SqlDbType.Int, 4);
        parameterMaxPrice.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(parameterMaxPrice);

        SqlParameter parameterOrderID = new SqlParameter("@OrderID", SqlDbType.Int, 4);
        parameterOrderID.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(parameterOrderID);

        myConnection.Open();
        int i = myCommand.ExecuteNonQuery();
        myConnection.Close();

       

        if (parameterMaxPrice.Value.ToString() != "")
        {
            int[] Value = new int[3];

            Value[0] = (int)parameterCustomerID.Value;
            Value[1] = (int)parameterMaxPrice.Value;
            Value[2] = (int)parameterOrderID.Value;
           
            return Value;
        } return null;

    }
    //-----------------------------------------------
    public String GetModelName(int ProductID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
        SqlCommand myCommand = new SqlCommand("getModelNameByID", myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterModelName = new SqlParameter("@ModelName", SqlDbType.NVarChar, 50);
        parameterModelName.Direction = ParameterDirection.Output;
        myCommand.Parameters.Add(parameterModelName);

        SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
        parameterProductID.Value = ProductID;
        myCommand.Parameters.Add(parameterProductID);

        myConnection.Open();
        int i=myCommand.ExecuteNonQuery();
        myConnection.Close();
        return (String)parameterModelName.Value;
    }
    //-----------------------------------------------------------------------------
    public void Delete(int OrderID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
        SqlCommand myCommand = new SqlCommand("DeleteFailedOrder", myConnection);


        myCommand.CommandType = CommandType.StoredProcedure;


        SqlParameter parameterOrderID = new SqlParameter("@OrderID", SqlDbType.Int, 4);
        parameterOrderID.Value = OrderID;
        myCommand.Parameters.Add(parameterOrderID);

        
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();


    }

    public void DeleteProduct(int ProductID)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
        SqlCommand myCommand = new SqlCommand("DeleteProduct", myConnection);


        myCommand.CommandType = CommandType.StoredProcedure;


        SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
        parameterProductID.Value = ProductID;
        myCommand.Parameters.Add(parameterProductID);



        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
    }
    public void UpdateAccount(int CustomerID, decimal Price)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
        SqlCommand myCommand = new SqlCommand("UpdateAccount", myConnection);


        myCommand.CommandType = CommandType.StoredProcedure;
        SqlParameter parameterCustomerID = new SqlParameter("@CustomerID", SqlDbType.Int, 4);
        parameterCustomerID.Value = CustomerID;
        myCommand.Parameters.Add(parameterCustomerID);
        SqlParameter parameterPrice = new SqlParameter("@Price", SqlDbType.Int, 4);
        parameterPrice.Value = Price;
        myCommand.Parameters.Add(parameterPrice);
        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
    }

    public SqlDataReader GetFinishedAuctionProduct(DateTime EndDate)
    {


        SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
        SqlCommand myCommand = new SqlCommand("getFinishedAuctionProduct", myConnection);


        myCommand.CommandType = CommandType.StoredProcedure;


        SqlParameter parameterEndDate = new SqlParameter("@DateEnd", SqlDbType.DateTime, 8);
        parameterEndDate.Value = (DateTime)EndDate;
        myCommand.Parameters.Add(parameterEndDate);



        myConnection.Open();
        SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);


        return result;
    }

    public void UpdateAccount2(int CustomerID, decimal CardPrice)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
        SqlCommand myCommand = new SqlCommand("UpdateAccount2", myConnection);
        myCommand.CommandType = CommandType.StoredProcedure;

        SqlParameter parameterCustomerID = new SqlParameter("@CustomerID", SqlDbType.Int, 4);
        parameterCustomerID.Value = CustomerID;
        myCommand.Parameters.Add(parameterCustomerID);

        SqlParameter parameterPrice = new SqlParameter("@Price", SqlDbType.Int, 4);
        parameterPrice.Value = CardPrice;
        myCommand.Parameters.Add(parameterPrice);

        myConnection.Open();
        myCommand.ExecuteNonQuery();
        myConnection.Close();
    }
}

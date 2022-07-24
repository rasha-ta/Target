using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;



  

    public class OrderDetails {

        public DateTime  OrderDate;
        public DateTime  ShipDate;
        public decimal   OrderTotal;
        public DataSet   OrderItems;
    }

    

    public class OrdersDB {

       

        public SqlDataReader GetCustomerOrders(String customerID) 
        {

            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("OrdersList", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterCustomerid = new SqlParameter("@CustomerID", SqlDbType.Int, 4);
            parameterCustomerid.Value = Int32.Parse(customerID);
            myCommand.Parameters.Add(parameterCustomerid);

            myConnection.Open();
            SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);

            return result;
        }
        public SqlDataReader GetAllOrders(int type)
        {
            if (type == 0)
            {
                SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
                SqlCommand myCommand = new SqlCommand("AllOrdersList", myConnection);

                myCommand.CommandType = CommandType.StoredProcedure;
                myConnection.Open();
                SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);

                return result;
            }
            else 
            {
                SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
                SqlCommand myCommand = new SqlCommand("AllOrdersAuctionList", myConnection);

                myCommand.CommandType = CommandType.StoredProcedure;
                myConnection.Open();
                SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
                return result;
            }
        }
       

        public OrderDetails GetOrderDetails(int orderID, string customerID) 
        {

            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlDataAdapter myCommand = new SqlDataAdapter("OrdersDetail", myConnection);

            myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;

            
            SqlParameter parameterOrderID = new SqlParameter("@OrderID", SqlDbType.Int, 4);
            parameterOrderID.Value = orderID;
            myCommand.SelectCommand.Parameters.Add(parameterOrderID);

            SqlParameter parameterCustomerID = new SqlParameter("@CustomerID", SqlDbType.Int, 4);
            parameterCustomerID.Value = Int32.Parse(customerID);
            myCommand.SelectCommand.Parameters.Add(parameterCustomerID);

            SqlParameter parameterOrderDate = new SqlParameter("@OrderDate", SqlDbType.DateTime, 8);
            parameterOrderDate.Direction = ParameterDirection.Output;
            myCommand.SelectCommand.Parameters.Add(parameterOrderDate);

            SqlParameter parameterShipDate = new SqlParameter("@ShipDate", SqlDbType.DateTime, 8);
            parameterShipDate.Direction = ParameterDirection.Output;
            myCommand.SelectCommand.Parameters.Add(parameterShipDate);

            SqlParameter parameterOrderTotal = new SqlParameter("@OrderTotal", SqlDbType.Money, 8);
            parameterOrderTotal.Direction = ParameterDirection.Output;
            myCommand.SelectCommand.Parameters.Add(parameterOrderTotal);

            DataSet myDataSet = new DataSet();
            myCommand.Fill(myDataSet, "OrderItems");
            
            
            if (parameterShipDate.Value != DBNull.Value) {
            
                OrderDetails myOrderDetails = new OrderDetails();

                myOrderDetails.OrderDate = (DateTime)parameterOrderDate.Value;
                myOrderDetails.ShipDate = (DateTime)parameterShipDate.Value;
                myOrderDetails.OrderTotal = (decimal)parameterOrderTotal.Value;
                myOrderDetails.OrderItems = myDataSet;

                return myOrderDetails;
            }
            else
                return null;
        }
        public OrderDetails GetOrderDetails2(int orderID)
        {

            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlDataAdapter myCommand = new SqlDataAdapter("OrdersDetail2", myConnection);

            myCommand.SelectCommand.CommandType = CommandType.StoredProcedure;


            SqlParameter parameterOrderID = new SqlParameter("@OrderID", SqlDbType.Int, 4);
            parameterOrderID.Value = orderID;
            myCommand.SelectCommand.Parameters.Add(parameterOrderID);


            SqlParameter parameterOrderDate = new SqlParameter("@OrderDate", SqlDbType.DateTime, 8);
            parameterOrderDate.Direction = ParameterDirection.Output;
            myCommand.SelectCommand.Parameters.Add(parameterOrderDate);

            SqlParameter parameterShipDate = new SqlParameter("@ShipDate", SqlDbType.DateTime, 8);
            parameterShipDate.Direction = ParameterDirection.Output;
            myCommand.SelectCommand.Parameters.Add(parameterShipDate);

            SqlParameter parameterOrderTotal = new SqlParameter("@OrderTotal", SqlDbType.Money, 8);
            parameterOrderTotal.Direction = ParameterDirection.Output;
            myCommand.SelectCommand.Parameters.Add(parameterOrderTotal);

            DataSet myDataSet = new DataSet();
            myCommand.Fill(myDataSet, "OrderItems");


            if (parameterShipDate.Value != DBNull.Value)
            {

                OrderDetails myOrderDetails = new OrderDetails();

                myOrderDetails.OrderDate = (DateTime)parameterOrderDate.Value;
                myOrderDetails.ShipDate = (DateTime)parameterShipDate.Value;
                myOrderDetails.OrderTotal = (decimal)parameterOrderTotal.Value;
                myOrderDetails.OrderItems = myDataSet;

                return myOrderDetails;
            }
            else
                return null;
        }

        
        public DateTime CalculateShippingDate(String customerID, string cartID) {

            Random x = new Random();
            double myrandom = (double)x.Next(0,3);
            return DateTime.Now.AddDays(myrandom);
        }

       
        public int PlaceOrder(string customerID, string cartID) 
        {

            
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("OrdersAdd", myConnection);

          
            myCommand.CommandType = CommandType.StoredProcedure;

          
            SqlParameter parameterCustomerID = new SqlParameter("@CustomerID", SqlDbType.Int, 4);
            parameterCustomerID.Value = Int32.Parse(customerID);
            myCommand.Parameters.Add(parameterCustomerID);

            SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
            parameterCartID.Value = cartID;
            myCommand.Parameters.Add(parameterCartID);

            SqlParameter parameterShipDate = new SqlParameter("@ShipDate", SqlDbType.DateTime, 8);
            parameterShipDate.Value = CalculateShippingDate(customerID, cartID);
            myCommand.Parameters.Add(parameterShipDate);

            SqlParameter parameterOrderDate = new SqlParameter("@OrderDate", SqlDbType.DateTime, 8);
            parameterOrderDate.Value = DateTime.Now;
            myCommand.Parameters.Add(parameterOrderDate);

            SqlParameter parameterOrderID = new SqlParameter("@OrderID", SqlDbType.Int, 4);
            parameterOrderID.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterOrderID);

           
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

           
            return (int)parameterOrderID.Value;
        }
    }



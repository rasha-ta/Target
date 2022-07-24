using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;



    

    public class ShoppingCartDB {

        public SqlDataReader GetItems(string cartID) {

          
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ShoppingCartList", myConnection);

            
            myCommand.CommandType = CommandType.StoredProcedure;

           
            SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
            parameterCartID.Value = cartID;
            myCommand.Parameters.Add(parameterCartID);

            myConnection.Open();
            SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
            return result;
        }

        

        public void AddItem(string cartID, int productID, int quantity) {

            
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ShoppingCartAddItem", myConnection);

            
            myCommand.CommandType = CommandType.StoredProcedure;

          
            SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
            parameterProductID.Value = productID;
            myCommand.Parameters.Add(parameterProductID);

            SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
            parameterCartID.Value = cartID;
            myCommand.Parameters.Add(parameterCartID);

            SqlParameter parameterQuantity = new SqlParameter("@Quantity", SqlDbType.Int, 4);
            parameterQuantity.Value = quantity;
            myCommand.Parameters.Add(parameterQuantity);
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

        

        public void UpdateItem(string cartID, int productID, int quantity) {

           
            if (quantity < 0) {
                throw new Exception("Quantity cannot be a negative number");
            }

           
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ShoppingCartUpdate", myConnection);

            
            myCommand.CommandType = CommandType.StoredProcedure;

            
            SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
            parameterProductID.Value = productID;
            myCommand.Parameters.Add(parameterProductID);

            SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
            parameterCartID.Value = cartID;
            myCommand.Parameters.Add(parameterCartID);

            SqlParameter parameterQuantity = new SqlParameter("@Quantity", SqlDbType.Int, 4);
            parameterQuantity.Value = quantity;
            myCommand.Parameters.Add(parameterQuantity);

           
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

       

        public void RemoveItem(string cartID, int productID) {

          
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ShoppingCartRemoveItem", myConnection);

            
            myCommand.CommandType = CommandType.StoredProcedure;

            
            SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
            parameterProductID.Value = productID;
            myCommand.Parameters.Add(parameterProductID);

            SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
            parameterCartID.Value = cartID;
            myCommand.Parameters.Add(parameterCartID);

           
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

        

        public int GetItemCount(string cartID) {

           
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ShoppingCartItemCount", myConnection);

       
            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
            parameterCartID.Value = cartID;
            myCommand.Parameters.Add(parameterCartID);

            SqlParameter parameterItemCount = new SqlParameter("@ItemCount", SqlDbType.Int, 4);
            parameterItemCount.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterItemCount);

            
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

            
            return ((int)parameterItemCount.Value);
        }

        

        public decimal GetTotal(string cartID) {

         
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ShoppingCartTotal", myConnection);

            
            myCommand.CommandType = CommandType.StoredProcedure;

           
            SqlParameter parameterCartID = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
            parameterCartID.Value = cartID;
            myCommand.Parameters.Add(parameterCartID);

            SqlParameter parameterTotalCost = new SqlParameter("@TotalCost", SqlDbType.Money, 8);
            parameterTotalCost.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterTotalCost);

         
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

           
            if (parameterTotalCost.Value.ToString() != "") {
                return (decimal)parameterTotalCost.Value;
            }
            else {
                return 0;
            }
        }

        

        public void MigrateCart(String oldCartId, String newCartId) {

            
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ShoppingCartMigrate", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter cart1 = new SqlParameter("@OriginalCartId ", SqlDbType.NVarChar, 50);
            cart1.Value = oldCartId;
            myCommand.Parameters.Add(cart1);

            SqlParameter cart2 = new SqlParameter("@NewCartId ", SqlDbType.NVarChar, 50);
            cart2.Value = newCartId;
            myCommand.Parameters.Add(cart2);

            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

        

        public void EmptyCart(string cartID) {

            
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("CMRC_ShoppingCartEmpty", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;
            
            SqlParameter cartid = new SqlParameter("@CartID", SqlDbType.NVarChar, 50);
            cartid.Value = cartID;
            myCommand.Parameters.Add(cartid);

            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

        

        public String GetShoppingCartId() {           
            System.Web.HttpContext context = System.Web.HttpContext.Current;           
            if (context.User.Identity.Name != "") {
                return context.User.Identity.Name;
            }           
            if (context.Request.Cookies["CartID"] != null) {
                return context.Request.Cookies["CartID"].Value;
            }
            else {            
                Guid tempCartId = Guid.NewGuid();
               context.Response.Cookies["CartID"].Value = tempCartId.ToString();
               return tempCartId.ToString();
            }
        }
    }


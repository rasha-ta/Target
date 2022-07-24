using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;



    
    public class ReviewsDB {

        

        public SqlDataReader GetReviews(int productID) {

            
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ReviewsList", myConnection);

          
            myCommand.CommandType = CommandType.StoredProcedure;

         
            SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
            parameterProductID.Value = productID;
            myCommand.Parameters.Add(parameterProductID);

            
            myConnection.Open();
            SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);

        
            return result;
        }


        public void AddReview(int productID, string customerName, string customerEmail, int rating, string comments) {

            
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ReviewsAdd", myConnection);

            
            myCommand.CommandType = CommandType.StoredProcedure;

            
            SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
            parameterProductID.Value = productID;
            myCommand.Parameters.Add(parameterProductID);

            SqlParameter parameterCustomerName = new SqlParameter("@CustomerName", SqlDbType.NVarChar, 50);
            parameterCustomerName.Value = customerName;
            myCommand.Parameters.Add(parameterCustomerName);

            SqlParameter parameterEmail = new SqlParameter("@CustomerEmail", SqlDbType.NVarChar, 50);
            parameterEmail.Value = customerEmail;
            myCommand.Parameters.Add(parameterEmail);

            SqlParameter parameterRating = new SqlParameter("@Rating", SqlDbType.Int, 4);
            parameterRating.Value = rating;
            myCommand.Parameters.Add(parameterRating);

            SqlParameter parameterComments = new SqlParameter("@Comments", SqlDbType.NVarChar, 3850);
            parameterComments.Value = comments;
            myCommand.Parameters.Add(parameterComments);

            SqlParameter parameterReviewID = new SqlParameter("@ReviewID", SqlDbType.Int, 4);
            parameterReviewID.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterReviewID);

            
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }

        public void AddReview2(int productID, int rating, int CustomerID)
        {

            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ReviewsAdd2", myConnection);


            myCommand.CommandType = CommandType.StoredProcedure;


            SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
            parameterProductID.Value = productID;
            myCommand.Parameters.Add(parameterProductID);
                     

            SqlParameter parameterRating = new SqlParameter("@Rating", SqlDbType.Int, 4);
            parameterRating.Value = rating;
            myCommand.Parameters.Add(parameterRating);

            SqlParameter parameterComments = new SqlParameter("@CustomerID", SqlDbType.NVarChar, 3850);
            parameterComments.Value = CustomerID;
            myCommand.Parameters.Add(parameterComments);

            


            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
       

        }


    }



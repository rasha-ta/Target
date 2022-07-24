using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;



    

    public class CustomerDetails {

        public String FullName;
        public String Email;
        public String Password;
        public int Admin;
    }

   

    public class CustomersDB {

        public void updateCreditAccount(int creditPassword, int NewAccount)
        {

            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("updateCreditAccount", myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterCreditPassword = new SqlParameter("@CreditCardPassword", SqlDbType.Int, 4);
            parameterCreditPassword.Value = creditPassword;
            myCommand.Parameters.Add(parameterCreditPassword);


            SqlParameter parameterAccount = new SqlParameter("@NewAccount", SqlDbType.Int, 4);
            parameterAccount.Value = NewAccount;
            myCommand.Parameters.Add(parameterAccount);

            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
        }
        //----------------------------------------------------------------------------------------------------
        public int GetCreditAccount(int password)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("GetCreditAccountByPassword", myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterCreditPassword = new SqlParameter("@CreditCardPassword", SqlDbType.Int, 4);
            parameterCreditPassword.Value = password;
            myCommand.Parameters.Add(parameterCreditPassword);


            SqlParameter parameterAccount = new SqlParameter("@CreditCardAccount", SqlDbType.Int, 4);
            parameterAccount.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterAccount);

            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();
            int account= (int)(parameterAccount.Value);
            return (account);
        }
        //---------------------------------------------------------------------------------------------
        public int GetCard_password(int account)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("GetCardPassword", myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterCardAccount = new SqlParameter("@Account", SqlDbType.Int, 4);
            parameterCardAccount.Value = account;
            myCommand.Parameters.Add(parameterCardAccount);


            SqlParameter parameterCardPassword = new SqlParameter("@CardPassword", SqlDbType.Int, 4);
            parameterCardPassword.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterCardPassword);

            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

            return (int)(parameterCardPassword.Value);
        }

        //-----------------------------------------------------------------------------------------------------
        public void updateCard(int account)
        {

            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("updateCard", myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterCardAccount = new SqlParameter("@Account", SqlDbType.Int, 4);
            parameterCardAccount.Value = account;
            myCommand.Parameters.Add(parameterCardAccount);

            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();


        }
        //---------------------------------------------------------------------------------------------
      

        public CustomerDetails GetCustomerDetails(String customerID) 
        {

           
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("CustomerDetail", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterCustomerID = new SqlParameter("@CustomerID", SqlDbType.Int, 4);
            parameterCustomerID.Value = Int32.Parse(customerID);
            myCommand.Parameters.Add(parameterCustomerID);

        

            SqlParameter parameterFullName = new SqlParameter("@FullName", SqlDbType.NVarChar, 50);
            parameterFullName.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterFullName);

            SqlParameter parameterEmail = new SqlParameter("@Email", SqlDbType.NVarChar, 50);
            parameterEmail.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterEmail);

           SqlParameter parameterPassword = new SqlParameter("@Password", SqlDbType.NVarChar, 50);
            parameterPassword.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterPassword);

            SqlParameter parameteradmin = new SqlParameter("@Admin", SqlDbType.Int, 4);
            parameteradmin.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameteradmin);


            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

            CustomerDetails myCustomerDetails = new CustomerDetails();

            myCustomerDetails.FullName = (string)parameterFullName.Value;
            myCustomerDetails.Password = (string)parameterPassword.Value;
            myCustomerDetails.Email = (string)parameterEmail.Value;
            myCustomerDetails.Admin = (int)parameteradmin.Value;

            return myCustomerDetails;
        }


        public int ChargeYourAccount(int Money, int CustomerID, string CardPassword)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ChargeYourAccount", myConnection);
            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterCustomerID = new SqlParameter("@CustomerID", SqlDbType.Int, 4);
            parameterCustomerID.Value = CustomerID;
            myCommand.Parameters.Add(parameterCustomerID);
            SqlParameter parameterCardID = new SqlParameter("@CardPassword", SqlDbType.NVarChar, 50);
            parameterCardID.Value = CardPassword;
            myCommand.Parameters.Add(parameterCardID);
            SqlParameter parameterMoney = new SqlParameter("@Money", SqlDbType.Int, 4);
            parameterMoney.Value= Money;
            myCommand.Parameters.Add(parameterMoney);

            SqlParameter parameterAccount = new SqlParameter("@NewAccount", SqlDbType.Int, 4);
            parameterAccount.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterAccount);

            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

            return (int)parameterAccount.Value;


        }
        public String AddCustomer(string fullName, string email, string password) 
        {

           
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("CustomerAdd", myConnection);

            
            myCommand.CommandType = CommandType.StoredProcedure;

           
            SqlParameter parameterFullName = new SqlParameter("@FullName", SqlDbType.NVarChar, 50);
            parameterFullName.Value = fullName;
            myCommand.Parameters.Add(parameterFullName);

            SqlParameter parameterEmail = new SqlParameter("@Email", SqlDbType.NVarChar, 50);
            parameterEmail.Value = email;
            myCommand.Parameters.Add(parameterEmail);

            SqlParameter parameterPassword = new SqlParameter("@Password", SqlDbType.NVarChar, 50);
            parameterPassword.Value = password;
            myCommand.Parameters.Add(parameterPassword);

            SqlParameter parameterCustomerID = new SqlParameter("@CustomerID", SqlDbType.Int, 4);
            parameterCustomerID.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterCustomerID);

            try {
                myConnection.Open();
                myCommand.ExecuteNonQuery();
                myConnection.Close();

                
                int customerId = (int)parameterCustomerID.Value;

                return customerId.ToString();
            }
            catch {
                return String.Empty;
            }
        }

       

        public String Login(string email, string password) 
        {

           
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("CustomerLogin", myConnection);

            
            myCommand.CommandType = CommandType.StoredProcedure;

          
            SqlParameter parameterEmail = new SqlParameter("@Email", SqlDbType.NVarChar, 50);
            parameterEmail.Value = email;
            myCommand.Parameters.Add(parameterEmail);

            SqlParameter parameterPassword = new SqlParameter("@Password", SqlDbType.NVarChar, 50);
            parameterPassword.Value = password;
            myCommand.Parameters.Add(parameterPassword);

            SqlParameter parameterCustomerID = new SqlParameter("@CustomerID", SqlDbType.Int, 4);
            parameterCustomerID.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterCustomerID);

           
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

            int customerId = (int)(parameterCustomerID.Value);

            if (customerId == 0) {
                return null;
            }
            else {
                return customerId.ToString();
            }
        }
        
    }



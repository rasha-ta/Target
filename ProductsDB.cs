using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;



    

    public class ProductDetails {

        public String  ModelNumber;
        public String  ModelName;
        public String CompanyName;
        public String  ProductImage;
        public decimal UnitCost;
        public String  Description;
        public String ProductImageBig;
        public int ProductID;
        public int CategoryID;
        public int ForAuction;
        public DateTime DateEnd;
        public DateTime DateBegin;
        public int LastPrice;
    }

    

    public class ProductsDB {

        

        public SqlDataReader GetProductCategories() 
        {

          
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ProductCategoryList", myConnection);

           
            myCommand.CommandType = CommandType.StoredProcedure;

          
            myConnection.Open();
            SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);

           
            return result;
        }

       

        public SqlDataReader GetProductsByCat(int categoryID) {

           
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ProductsByCategory", myConnection);

           
            myCommand.CommandType = CommandType.StoredProcedure;

         
            SqlParameter parameterCategoryID = new SqlParameter("@CategoryID", SqlDbType.Int, 4);
            parameterCategoryID.Value = categoryID;
            myCommand.Parameters.Add(parameterCategoryID);

          
            myConnection.Open();
            SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);
            
          
            return result;
        }
        public SqlDataReader GetProductsBYSubCat(int subCategoryID)
        {
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ProductsBySubCategory", myConnection);


            myCommand.CommandType = CommandType.StoredProcedure;


            SqlParameter parameterSubCategoryID = new SqlParameter("@SubCategoryID", SqlDbType.Int, 4);
            parameterSubCategoryID.Value = subCategoryID;
            myCommand.Parameters.Add(parameterSubCategoryID);


            myConnection.Open();
            SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);


            return result;

        }
        public SqlDataReader GetProductsForAuction(DateTime EndDate)
        {

            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ProductsForAuction", myConnection);

            myCommand.CommandType = CommandType.StoredProcedure;

            /*SqlParameter parameterCategoryID = new SqlParameter("@CategoryID", SqlDbType.Int, 4);
            parameterCategoryID.Value = categoryID;
            myCommand.Parameters.Add(parameterCategoryID);*/

            SqlParameter parameterEndDate = new SqlParameter("@DateEnd", SqlDbType.DateTime, 8);
            parameterEndDate.Value = (DateTime)EndDate;
            myCommand.Parameters.Add(parameterEndDate);


            myConnection.Open();
            myConnection.Close();
            myConnection.Open();
            SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);

            return result;
        }
        

        public ProductDetails GetProductDetails(int productID) {

          
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ProductDetail", myConnection);
                 
            myCommand.CommandType = CommandType.StoredProcedure;
                      
            SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
            parameterProductID.Value = productID;
            myCommand.Parameters.Add(parameterProductID);

            SqlParameter parameterUnitCost = new SqlParameter("@UnitCost", SqlDbType.Money, 8);
            parameterUnitCost.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterUnitCost);

            SqlParameter parameterModelNumber = new SqlParameter("@ModelNumber", SqlDbType.NVarChar, 50);
            parameterModelNumber.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterModelNumber);

            SqlParameter parameterModelName = new SqlParameter("@ModelName", SqlDbType.NVarChar, 50);
            parameterModelName.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterModelName);

            SqlParameter parametercompanyName = new SqlParameter("@CompanyName", SqlDbType.NVarChar, 50);
            parametercompanyName.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parametercompanyName);

            SqlParameter parameterProductImage = new SqlParameter("@ProductImage", SqlDbType.NVarChar, 50);
            parameterProductImage.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterProductImage);

            SqlParameter parameterDescription = new SqlParameter("@Description", SqlDbType.NVarChar, 3800);
            parameterDescription.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterDescription);

            SqlParameter parameterImageBig = new SqlParameter("@ProductImageBig", SqlDbType.NVarChar, 50);
            parameterImageBig.Direction = ParameterDirection.Output;
            myCommand.Parameters.Add(parameterImageBig);

            SqlParameter parameterCategoryID = new SqlParameter("@CategoryID", SqlDbType.Int, 4);
            parameterCategoryID.Direction = ParameterDirection.Output; ;
            myCommand.Parameters.Add(parameterCategoryID);

            SqlParameter parameterSubCategoryID = new SqlParameter("@SubCategoryID", SqlDbType.Int, 4);
            parameterSubCategoryID.Direction = ParameterDirection.Output; ;
            myCommand.Parameters.Add(parameterSubCategoryID);

            SqlParameter parameterForAuction = new SqlParameter("@ForAuction", SqlDbType.Int, 4);
            parameterForAuction.Direction = ParameterDirection.Output; ;
            myCommand.Parameters.Add(parameterForAuction);

            SqlParameter parameterLastPrice = new SqlParameter("@LastPrice", SqlDbType.Int, 4);
            parameterLastPrice.Direction = ParameterDirection.Output; ;
            myCommand.Parameters.Add(parameterLastPrice);

            SqlParameter parameterDateBegin = new SqlParameter("@DateBegin", SqlDbType.DateTime, 8);
            parameterDateBegin.Direction = ParameterDirection.Output; ;
            myCommand.Parameters.Add(parameterDateBegin);

            SqlParameter parameterDateEnd = new SqlParameter("@DateEnd", SqlDbType.DateTime, 8);
            parameterDateEnd.Direction = ParameterDirection.Output; ;
            myCommand.Parameters.Add(parameterDateEnd);
          
            myConnection.Open();
            myCommand.ExecuteNonQuery();
            myConnection.Close();

           
      
            ProductDetails myProductDetails = new ProductDetails();

            myProductDetails.ModelNumber = (string)parameterModelNumber.Value;
            myProductDetails.ModelName = (string)parameterModelName.Value;
            myProductDetails.CompanyName = (string)parametercompanyName.Value;
            myProductDetails.ProductImage = ((string)parameterProductImage.Value).Trim();
            myProductDetails.UnitCost = (decimal)parameterUnitCost.Value;
            myProductDetails.Description = ((string)parameterDescription.Value).Trim();
            myProductDetails.ProductImageBig = ((string)parameterImageBig.Value).Trim();
            myProductDetails.CategoryID = (int)parameterCategoryID.Value;
            myProductDetails.ForAuction=(int)parameterForAuction.Value;
            if (parameterLastPrice.Value.ToString() != "")
                myProductDetails.LastPrice = (int)parameterLastPrice.Value;
            if (parameterDateBegin.Value.ToString() != "")
                myProductDetails.DateBegin = (DateTime)parameterDateBegin.Value;
            if (parameterDateEnd.Value.ToString() != "")
                myProductDetails.DateEnd = (DateTime)parameterDateEnd.Value;

            return myProductDetails;
        }

       

        public SqlDataReader GetProductsAlsoPurchased(int productID) {

          
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("CustomerAlsoBought", myConnection);

      
            myCommand.CommandType = CommandType.StoredProcedure;

            SqlParameter parameterProductID = new SqlParameter("@ProductID", SqlDbType.Int, 4);
            parameterProductID.Value = productID;
            myCommand.Parameters.Add(parameterProductID);

           
            myConnection.Open();
            SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);

           
            return result;
        }

        

        public SqlDataReader GetMostPopularProductsOfWeek() {

           
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ProductsMostPopular", myConnection);           
            myCommand.CommandType = CommandType.StoredProcedure;           
            myConnection.Open();
            SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);         
            return result;
        }

        

        public SqlDataReader SearchProductDescriptions(string searchString) {

            
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ProductSearch", myConnection);

           
            myCommand.CommandType = CommandType.StoredProcedure;

            
            SqlParameter parameterSearch = new SqlParameter("@Search", SqlDbType.NVarChar, 255);
            parameterSearch.Value = searchString;
            myCommand.Parameters.Add(parameterSearch);

            
            myConnection.Open();
            SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);

            
            return result;
        }
    

  public SqlDataReader AdvanceSearch(string searchString,int CategoryID) {

            
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ProductSearchAdvance", myConnection);

           
            myCommand.CommandType = CommandType.StoredProcedure;

            
            SqlParameter parameterSearch = new SqlParameter("@modelname", SqlDbType.NVarChar, 50);
            parameterSearch.Value = searchString;
            myCommand.Parameters.Add(parameterSearch);

            SqlParameter parameterCategoryID = new SqlParameter("@CategoryID", SqlDbType.NVarChar, 50);
            parameterCategoryID.Value = CategoryID;
            myCommand.Parameters.Add(parameterCategoryID);

            myConnection.Open();
            SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);

            
            return result;
    }   
     public SqlDataReader moreAdvanceSearch(string searchString,int CategoryID,int subid,string company) {

            
            SqlConnection myConnection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
            SqlCommand myCommand = new SqlCommand("ProductSearchmoreAdvance", myConnection);

           
            myCommand.CommandType = CommandType.StoredProcedure;

            
            SqlParameter parameterSearch = new SqlParameter("@modelname", SqlDbType.NVarChar, 50);
            parameterSearch.Value = searchString;
            myCommand.Parameters.Add(parameterSearch);

            SqlParameter parametercompany= new SqlParameter("@company", SqlDbType.NVarChar, 50);
            parametercompany.Value = company;
            myCommand.Parameters.Add(parametercompany);

            SqlParameter parameterCategoryID = new SqlParameter("@CategoryID", SqlDbType.NVarChar, 50);
            parameterCategoryID.Value = CategoryID;
            myCommand.Parameters.Add(parameterCategoryID);
         
            SqlParameter parametersubCategoryID = new SqlParameter("@SubCategoryID", SqlDbType.NVarChar, 50);
            parametersubCategoryID.Value = subid;
            myCommand.Parameters.Add(parametersubCategoryID);

            myConnection.Open();
            SqlDataReader result = myCommand.ExecuteReader(CommandBehavior.CloseConnection);

            
            return result;
    }    }
  
<%@ Page Language="C#" %>
<script runat="server">

    
    
    void Page_Load(Object sender, EventArgs e) {
    
        if (Request.Params["ProductID"] != null) {   
            ShoppingCartDB cart = new ShoppingCartDB();           
            String cartId = cart.GetShoppingCartId();           
            cart.AddItem(cartId, Int32.Parse(Request.Params["ProductID"]), 1);
        }   
        Response.Redirect("ShoppingCart.aspx");
    }

</script>
<html>
<head>
</head>
<body>
</body>
</html>
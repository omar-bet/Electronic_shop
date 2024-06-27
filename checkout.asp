<!-- checkout.asp -->
<%@ Language="VBScript" %>
<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>payment page</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>payment page</h1>
    </header>
    <main>
        <h2 id="ch">products in your shopping cart</h2>
        <div id="checkout-items">
            <%
            Dim checkoutCart
            checkoutCart = Session("cart")
            
            If IsArray(checkoutCart) Then
                For Each item In checkoutCart
            %>
            <div class="checkout-item">
                <span><%= item("name") %></span>
                <span>Quantity: <%= item("quantity") %></span>
                <span>Price: <%= item("price") %></span>
            </div>
            <%
                Next
            End If
            %>
        </div>
        <form id="checkout-form" method="post" action="process_order.asp">
            <h2>user information</h4>
            <label for="name">username</label><br>
            <input type="text" id="name" name="name" required placeholder="name" title="type your name">
            <br>
            <label for="address">address</label><br>
            <textarea id="address" name="address" required placeholder="address" title="type your address"></textarea>
            <br>
            <label for="email">email</label><br>
            <input type="email" id="email" name="email" required placeholder="email" title="type your email">
            <br>
            <label for="phone">phone number</label><br>
            <input type="text" id="phone" name="phone" required placeholder="phone number" title="type your phone number">
            <br>
            <button type="submit">Complete Purchase</button>
        </form>
    </main>
    <footer>
        <p>&copy; All rights are save</p>
    </footer>
</body>
</html>

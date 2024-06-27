<!-- cart.asp -->
<%@ Language="VBScript" %>
<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>the cart</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>the cart</h1>
    </header>
    <main id="main">
        <div id="cartDiv">
            <h2 id="cart">Requested devices</h2>
            <div id="cart-items">
                <%
                ' جلب البيانات من سلة التسوق المخزنة في الجلسة
                Dim cart, item, total
                cart = Session("cart")
                total = 0

                If IsArray(cart) Then
                    For Each item In cart
                %>
                <div class="cart-item">
                    <span><%= item("name") %></span>
                    <span>Quantity: <%= item("quantity") %></span>
                    <span>Price: <%= item("price") %></span>
                </div>
                <%
                    total = total + (item("price") * item("quantity"))
                    Next
                End If
                %>
            </div>
            <div class="total-price">Total Price: <%= total %>$</div>
            <button id="checkout-btn" onclick="location.href='checkout.asp'" title="تأكيد الطلبية">complete your purchase</button>
        </div>
    </main>
    <footer>
        <p>&copy; All rights are save</p>
    </footer>
    <script src="script.js"></script>
</body>
</html>

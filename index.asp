<!-- index.asp -->
<%@ Language="VBScript" %>
<!--#include file="db.asp" -->
<!DOCTYPE html>
<html lang="ar">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Electronic Shop</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1 id="head">welcome to our website for selling smart devices from several companies</h1>
        <h2>"We offer the best smart devices at the best prices"</h2>
    </header>
    <main>
        <section class="products">
            <h2 style="box-shadow: 0px 0px 10px 5px red;"><b><---Available devices---></b></h2>
            <%
            ' جلب البيانات من قاعدة البيانات
            Dim rs, sql
            Set rs = Server.CreateObject("ADODB.Recordset")
            sql = "SELECT * FROM Products"
            rs.Open sql, conn

            Do While Not rs.EOF
            %>
            <div class="product" id="<%= rs("ID") %>">
                <p>..<%= rs("ID") %>..</p>
                <img src="imagic/<%= rs("Image") %>" alt="mobile <%= rs("ID") %>">
                <h3><%= rs("Name") %></h3>
                <p>the price : <%= rs("Price") %>$</p>
                <a href="product<%= rs("ID") %>.html" title="عرض التفاصيل">View details</a>
                <button class="add-to-cart" data-id="<%= rs("ID") %>" data-name="<%= rs("Name") %>" data-price="<%= rs("Price") %>" title="اضافة الى سلة التسوق">Add to Cart</button>
            </div>
            <%
                rs.MoveNext
            Loop
            rs.Close
            Set rs = Nothing
            %>
            <div id="a">
                <a id="cart" href="cart.asp" title="سلة التسوق" target="_blank"> cart </a>
                <a id="check" href="checkout.asp" title="صفحة الدفع" target="_blank">checkout</a>
            </div>
        </section>
    </main>
    <footer>
        <p>&copy; All rights are save</p>
    </footer>
    <script src="script.js"></script>
</body>
</html>
<%
' إغلاق الاتصال بقاعدة البيانات
Call CloseConnection()
%>

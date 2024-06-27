<!-- db.asp -->
<%
' إعداد اتصال قاعدة البيانات
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")
conn.ConnectionString = "Driver={SQL Server};Server=Database Engine;Database=onlineshopping;Uid=YOUR_USERNAME;Pwd=YOUR_PASSWORD;"
conn.Open

' تأكد من إغلاق الاتصال بعد الانتهاء
Sub CloseConnection()
    conn.Close
    Set conn = Nothing
End Sub
%>

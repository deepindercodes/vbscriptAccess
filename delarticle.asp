<!--#include virtual="/includes/dbconn.asp"-->
<%
    Dim id
    id=Int(Request("id")&"")

    '//opening connection to DB to fetch the records of examcategory table
    set conn = Server.CreateObject("ADODB.Connection")
    conn.Open dbConnectionString

    Dim commandText
    commandText = "DELETE FROM tblarticles WHERE id="& id &""

    conn.Execute commandText

    conn.Close

    Response.Redirect("/")
%>
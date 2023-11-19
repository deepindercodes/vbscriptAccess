<%
    Dim dbPath
    dbPath = Server.MapPath("/db") &"\vbscriptaccessdb.MDB"

    Dim dbConnectionString
    dbConnectionString = "PROVIDER=Microsoft.Jet.OLEDB.4.0;Data Source="& dbpath &""
%>
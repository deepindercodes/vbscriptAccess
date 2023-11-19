<!--#include virtual="/includes/dbconn.asp"-->
<%
    Dim articletitle
    articletitle = ""

    Dim articleauthor
    articleauthor = "Administrator"

    Dim articlebody
    articlebody = ""

    Dim articleimage
    articleimage = ""

    Dim createdonUTC
    createdonUTC = ""

    Dim id
    id=Int(Request("id")&"")

    '//opening connection to DB to fetch the records of examcategory table
    set conn = Server.CreateObject("ADODB.Connection")
    conn.Open dbConnectionString

    Dim commandText
    commandText = "SELECT * FROM tblarticles WHERE id="& id &""

    set objRs = Server.CreateObject("ADODB.recordset") 
    objRs.Open commandText,conn
    if not objRs.EOF then
        articletitle = objRs("articletitle")
        articleauthor = objRs("articleauthor")
        articlebody = objRs("articlebody")
        articleimage = objRs("articleimage")
        createdonUTC = objRs("createdonUTC")
    end if
    objRs.Close()

    conn.Close
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title><%=articletitle %></title>
    <!--#include virtual="/includes/boostrap_include.asp"-->
</head>
<body>

    <div class="container">

        <div class="row">
            <div class="col-sm-1">
                &nbsp;
            </div>
            <div class="col-sm-10">
                <ul class='list-group'>
                    <li class='list-group-item fs-5 p-3 bg-primary text-white'><%=articletitle %></li>
                    <li class='list-group-item p-2'>
                        <p>
                            <%
                                if articleimage<>"" then
                                    Response.Write("<img class='img-fluid rounded' style='max-width:200px;margin:15px;float:left' src='"& articleimage &"' />")
                                end if
                            %>
                            <b>Author:</b>&nbsp;<%=articleauthor %><br />
                            <b>Date (UTC):</b>&nbsp;<%=createdonUTC %><br /><br />
                            <%=articlebody %>
                        </p>
                    </li>
                </ul>
            </div>
            <div class="col-sm-1">
                &nbsp;
            </div>
        </div>
    </div>


</body>
</html>
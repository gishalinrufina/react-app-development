<%-- 
    Document   : user_setting
    Created on : 07-Dec-2022, 11:54:07 am
    Author     : GAVASKAR S
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Education Page</title>
    </head>
    <body>
<%@include file="header.jsp" %>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="pms.prs_education"%>
<h1 class="h3 mb-4 text-gray-800">Education Setting</h1>
<div class="row">
<div class="col-lg-12"> 
<%
String usercode="";
String ug="";
String pg="";
String hsc="";
String sslc="";
String id=request.getParameter("id").toString();
    if(request.getParameter("option").toString().contains("edit"))
        {
            prs_education iu_prs_education=new prs_education();
            ResultSet resultSet = null; 
            iu_prs_education.id=id;
            resultSet = iu_prs_education.retrivewithid_prs_education();
            int sno=0;
            while(resultSet.next())
            {
               usercode=resultSet.getString("usercode");
                ug=resultSet.getString("ug");
                pg=resultSet.getString("pg");
               hsc=resultSet.getString("hsc");
                sslc=resultSet.getString("sslc");
            }
        }
                   
    if(request.getParameter("option").toString().contains("add") || request.getParameter("option").toString().contains("edit"))
        {           
%>
<form action="prs_education.jsp?option=" method="post">
    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <tr>
            <td align="right">User Code:</td>
            <td>
                <input  class="form-control form-control-user" type="text" name="usercode" value="<%=usercode%>" required=""/>
            </td>
        </tr>
        <tr>
            <td align="right">UG:</td>
            <td>
                <input  class="form-control form-control-user" type="text" name="ug" value="<%=ug%>" required=""/>
            </td>
        </tr>
        <tr>
            <td align="right">PG:</td>
            <td>
                <input  class="form-control form-control-user" type="text" name="pg" value="<%=pg%>" required=""/>
            </td>
        </tr>
        <tr>
            <td align="right">HSC:</td>
            <td>
                <input  class="form-control form-control-user" type="text" name="hsc" value="<%=hsc%>" required=""/>
            </td>
        </tr>
        <tr>
            <td align="right">SSLC:</td>
            <td>
                <input  class="form-control form-control-user" type="text" name="sslc" value="<%=sslc%>" required=""/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="hidden" name="id" value="<%=id%>"/>
                <input  type="submit" name="save" value="Save"/>
            </td>
        </tr>
    </table>
</form>
</div>
<%                               
    }
    else if(request.getParameter("option").toString().contains("delete"))
        {
            prs_education delete_prs_education=new prs_education();
            delete_prs_education.id=request.getParameter("id");
            String delete_message= delete_prs_education.delete_prs_education();
            out.println("<script type = 'text/javascript'>");
            out.println("window.alert('Data Deleted sucessfully')");
            out.println("window.location = 'prs_education.jsp?option=view&id=0'");
            out.println("</script>");
        }
    else if(request.getParameter("option").toString().contains("view"))
        {
%>
<div class="card shadow mb-4">
    <div class="card-body">
        <div class="table-responsive">
        <center>
            <a href="prs_education.jsp?option=add&id=0" >Add Education Details</a>
        </center>
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th>Sl.No</th>
                        <th>User Code</th>
                        <th>UG</th>
                        <th>PG</th>
                        <th>HSC</th>
                          <th>SSLC</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
<%
           prs_education userview=new prs_education();
            ResultSet resultSet = null;
            resultSet = userview.retriveall_prs_education();
            int sno=0;
            while(resultSet.next())
            {
                sno=sno+1;
%>
                        <tr>
                            <td><%=sno%></td>
                            <td><%=resultSet.getString("usercode") %></td>
                            <td><%=resultSet.getString("ug") %></td>
                            <td><%=resultSet.getString("pg") %></td>
                            <td><%=resultSet.getString("hsc") %></td>
                            <td><%=resultSet.getString("sslc") %></td>
                            <td><a href="prs_education.jsp?option=edit&id=<%=resultSet.getString("id")%>">Edit</a>|<a href="prs_education.jsp?option=delete&id=<%=resultSet.getString("id")%>">Delete</a></td>
                        </tr>
<%
            }
%>
                    </tbody>
            </table>
        </div>
    </div>
</div>
<%
        }
        else
            {
%>
<%
                prs_education create_prs_education=new  prs_education();
                create_prs_education.usercode=request.getParameter("usercode");
                create_prs_education.ug=request.getParameter("ug");
                create_prs_education.pg=request.getParameter("pg");
                create_prs_education.hsc=request.getParameter("hsc");
                create_prs_education.sslc=request.getParameter("sslc");
                create_prs_education.id=request.getParameter("id");
                String create_message="";
                    if(create_prs_education.id.equals("0"))
                        {
                            create_message=create_prs_education.create_prs_education();
                        }
                    else
                        {
                            create_message=create_prs_education.update_prs_education();
                        }
                if(create_message.contains("1"))
                    {
                        out.println("<script type = 'text/javascript'>");
                        out.println("window.alert('Education Details saved sucessfully')");
                        out.println("window.location = 'prs_education.jsp?option=view&id=0'");
                        out.println("</script>");
                    }
                else
                    {
                        out.println("<script type = 'text/javascript'>");
                        out.println("window.alert('Eduaction Details not saved')");
                        out.println("window.location = 'prs_education.jsp?option=view&id=0'");
                        out.println("</script>");
                    }
            }
                                %>
        </div>
<%@include file="footer.jsp" %>
    </body>
</html>
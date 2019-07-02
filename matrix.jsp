<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import= "com.hinguapps.graph.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>MATRIX</h1>

<%
   int row= Integer.parseInt(request.getParameter("row"));
   int col= Integer.parseInt(request.getParameter("col"));
   String numbers=request.getParameter("matrix");


    String[] splitText = numbers.split(" ");
    int[] mat = new int[splitText.length];
    for(int i = 0; i < splitText.length; i++) 
    { 
     mat[i] = Integer.parseInt(splitText[i]);//parse every element from string to int and store it in array. 

    }

    int matrix[][] = new int[row][col];
    int count=0;
    for(int i=0; i<row;i++)
    {
        for(int j=0;j<col;j++) {

            if(count==mat.length)
                break;
            matrix[i][j]=mat[i*col + j];//conversion of 1d array to 2d

            count++;
        }

        }
    
    
		   
%>	

<TABLE border=1>
<% for(int r=0;r<row;r++) { %>
    <TR>
<%      for(int c=0;c<col;c++) { %>
        <TD> <%=matrix[r][c]%>
        </TD>
        <% } %>
    </TR>
<% } %>
</TABLE>


 <br/>
 <br />
 
<form action='calculate.jsp'> 
<input type = "submit" value = "Calculate" onclick="openPage('calculate.jsp')"/> 
<br /> 
<br />
</form>  

<script type="text/javascript">
 function openPage(pageURL)
 {
 window.location.href = pageURL;
 }
</script>
 
 
<% int ROW = row;
session.setAttribute("rowsize",ROW);

int COL = col;
session.setAttribute("colsize",COL);

int[][]MAT = matrix;
session.setAttribute("MATRIX",MAT);

%>



</body>
</html>
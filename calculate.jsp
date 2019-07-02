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

<%
HttpSession hs = request.getSession(true);
int row=(int)hs.getAttribute("rowsize");
int col=(int)hs.getAttribute("colsize");
int[][] matrix =(int[][])hs.getAttribute("MATRIX");

%>

<%

int temp = row;
if (row < col) {
	while(row!=col) {
		row++;
	}
}


int x = temp;
if (temp < col)  {
	while(temp!=col) {
		for(int i=0; i<col; i++)
			matrix[temp][i] = 0;
		temp++;
	}
}

HungarianBipartiteMatching hbm = new HungarianBipartiteMatching(matrix);
int[] result = hbm.execute();
int n = Math.min(x, matrix[0].length);%>
  <h1>Optimal Job Assignment</h1>
  
  
  <table border="1">
        <tr>
            <td>Machine assigned:</td>
            <td>Job available :</td>
            
        </tr>
  
<% for(int i=0; i<n; i++){%>
   <tr>
      
          <td><%=i+1%></td>
                <td><%=result[i] + 1%></td>
    <tr>
    <%}%>
    



 </table> 


   
    
    <%
    
    int[][] cost = matrix;
    int res[]=result;
    
    	double min = 0;
    	for(int i=0; i<cost.length; i++) {
    		for(int j=0; j<cost[0].length; j++) {
    			if(j == res[i]) {
    				min = min + cost[i][j];
    				break;
    			}
    		}
    	}
    

    %>
    
    The cost of assignment = <%=min %>


</body>
</html>
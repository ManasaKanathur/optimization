package com.hinguapps.graph;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Matrix
 */
@WebServlet("/Matrix")
public class Matrix extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Matrix() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		    response.setContentType("text/html");  
		    PrintWriter out = response.getWriter();  
		          
		 
		    int row= Integer.parseInt(request.getParameter("row"));
		    int col= Integer.parseInt(request.getParameter("col"));
		    
		    if(row<col)
		    {
		    	out.print("Row size should be greater than or equal to column size. Please re-enter values.\n");  
		        RequestDispatcher rd=request.getRequestDispatcher("index.html");  
		        rd.include(request,response);  
		    }
		    	
		    
		    else
		    {
		    RequestDispatcher rd=request.getRequestDispatcher("matrix.jsp");  
		    rd.forward(request,response); 
		   
		    out.close();
		    }
	}

}

<%-- 
    Document   : agregarEstado
    Created on : 5 jul. 2020, 15:50:48
    Author     : jose eduardo ramirez
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String titulo = "agregar Estado", estado = "", action = "agregarEstado1.jsp";
    int id = 0;
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
        titulo = "Editar Estado";
        action = "editarEstado.jsp";
        Connection conexion = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/provedores", "root", "");
            stmt = conexion.prepareStatement("SELECT * FROM cad_estados WHERE id=?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            rs.next();
            estado = rs.getString("estado");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
%>  
<html>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<body background="https://us.123rf.com/450wm/iulika1/iulika11707/iulika1170700264/82962287-fondo-en-colores-pastel-colorido-en-estilo-ilustraci%C3%B3n-de-vector-de-fondo-geom%C3%A9trico-low-poly.jpg?ver=6">    
 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar estado</title>
    </head>
    <body>
     
        <h1 class="text-center"><font COLOR="white"><%=titulo%></h1>
        <br>
        
        <div class="container">
            <form action="<%=action%>" method="GET" >
                <div class="form-row">   
                    <% if (id != 0) {%>
                    <div class="col">
                        <input type="hidden" class="form-control"  name="id_estado" value="<%=id%>"/>
                    </div>
                    <% }%>
                    <div class="col">
                        <input type="text" value="<%=estado%>" class="form-control" placeholder="Nombre" name="estado" required>
                    </div>
                   
                    <div class="col">
                        <input type="submit"  class="btn btn-success  btn-block " value="Enviar"/>
                        <br>
         <td><a class="btn btn-primary btn-block" href="tablaEstados.jsp"  method="POST">Ver Estados</a></td>
          <td><a class="btn btn-primary btn-block" href="index.jsp"  method="POST">Ver Provedores</a></td>
    </body>
</html>

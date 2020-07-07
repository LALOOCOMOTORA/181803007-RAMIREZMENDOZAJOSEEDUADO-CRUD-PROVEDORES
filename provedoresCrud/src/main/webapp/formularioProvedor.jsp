<%-- 
    Document   : formularioProvedor
    Created on : 5 jul. 2020, 16:20:37
    Author     : jose eduardo ramirez
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String titulo = "Agregar Provedor", telefono = "",empresa = "",produ ="",estado="", action = "agregarProvedor.jsp";
    int id  = 0;
    if (request.getParameter("id") != null) {
        id = Integer.parseInt(request.getParameter("id"));
        
        titulo = "Editar Provedor";
        action = "editarProvedor.jsp";
        Connection conexion = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://localhost/provedores", "root", "");
            stmt = conexion.prepareStatement("SELECT * FROM provedores WHERE id=?");
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            rs.next();
            empresa = rs.getString("empresa");
            telefono = rs.getString("telefono");
            produ = rs.getString("producto");
            int id_estado = rs.getInt("id_estado");
               
                

                    PreparedStatement stmt1 = null;
                    ResultSet rs1 = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conexion = DriverManager.getConnection("jdbc:mysql://localhost/provedores", "root", "");
                        stmt1 = conexion.prepareStatement("SELECT * FROM provedores JOIN cat_estados ON provedores.id_estado = cat_estados.id WHERE id_estado=?");
                        stmt1.setInt(1, id);
                        rs1 = stmt1.executeQuery();
                        rs1.next();
                        estado = rs1.getString("estado");

                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                
           
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
%>  
<html>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<body background="https://us.123rf.com/450wm/iulika1/iulika11707/iulika1170700264/82962287-fondo-en-colores-pastel-colorido-en-estilo-ilustraci%C3%B3n-de-vector-de-fondo-geom%C3%A9trico-low-poly.jpg?ver=6">    
   <title>pendiente</title>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%=titulo%></h1>
         <div class="container">
            <form action="<%=action%>" method="GET" >
                <div class="form-row">
                     <div class="col">
                        <input type="text" class="form-control"  name="empresa" value="<%=empresa%>"/>
                    </div>
                     <div class="col">
                        <input type="text" class="form-control"  name="telefono" value="<%=telefono%>"/>
                    </div>
                   <div class="col">
                        <input type="text" class="form-control"  name="producto" value="<%=produ%>"/>
                    </div>
                    <div class="col">
                        
                        <select  class="form-control" name="estados" id="estado" />
                        
                        
  <%
    Connection conexion;
    ResultSet rs = null;

    try {
        String url = "jdbc:mysql://localhost/provedores";
        String Driver = "com.mysql.jdbc.Driver";
        String user = "root";
        String clave = "";
        Class.forName(Driver);
        conexion = DriverManager.getConnection(url, user, clave);

        PreparedStatement stmt;
        stmt = conexion.prepareStatement("Select * from cat_estados");
        rs = stmt.executeQuery();
    } catch (Exception e) {
        out.println("error" + e);
    }


%>
                            
  <%while(rs.next()){%>
  
  <option value="id_Estado"><%=rs.getString("estado")%></option>
  

  <%}%>
</select>                        
                    </div>
                    <div class="col">
                    <input type="reset"  class="btn btn-primary btn-block">
                    </div>
                   
                    <div class="col">
                        <input type="submit"  class="btn btn-success btn-block" value="Enviar"/>
                        <br>
         <br>
         <td><a class="btn btn-primary btn-block" href="tablaEstados.jsp"  method="POST">Ver Estados</a></td>
          <td><a class="btn btn-primary btn-block" href="index.jsp"  method="POST">Ver Provedores</a></td>
    </body>
</html>

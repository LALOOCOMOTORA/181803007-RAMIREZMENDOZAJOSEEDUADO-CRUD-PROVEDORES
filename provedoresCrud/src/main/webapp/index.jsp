
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html

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
            stmt = conexion.prepareStatement("Select * from provedores");
            rs = stmt.executeQuery();
        } catch (Exception e) {
            out.println("error" + e);
        }


    %>
    <html>
<head  method="POST">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<body background="https://us.123rf.com/450wm/iulika1/iulika11707/iulika1170700264/82962287-fondo-en-colores-pastel-colorido-en-estilo-ilustraci%C3%B3n-de-vector-de-fondo-geom%C3%A9trico-low-poly.jpg?ver=6">    
    <title>Tabla Provedores</title>


    <h1 class="text-center"> TABLA PROVEDORES  <br><small class="text-center">Aqui podra consultar la lista de  provededores como sus demas datos y podra consultar,comidificar y eliminar resitros</small></h1>
    <div class="container-fluid"  method="POST">

        <table class="table table-hover">

            <thead class="thead-dark">
                <tr>
                    <td class="table-sm" colspan="2"><h2>Provedores:</h2> </td>
                    <td></td>
                   
                     <td></td>
            <td><a class="btn btn-primary  btn-lg btn-block  "  href="tablaEstados.jsp"  method="POST" ><img src="https://image.flaticon.com/icons/png/512/720/720466.png" alt="" width="30" height="30" /><br> Ver tabla de los estados </a></td> <br>
             <td></td>
            <td><a class="btn btn-success  btn-lg btn-block" href="formularioProvedor.jsp"  method="POST" ><img src="https://img2.freepng.es/20180523/wjz/kisspng-computer-icons-computer-software-clip-art-open-list-5b051a2cc48529.975643191527061036805.jpg" alt="" width="30" height="30" /><br>Agregar Provedor </a></td>     
            </tr>

            <tr


                <br><th  class="text-center">#</th>
                <th  class="text-center">Empresa</th>
                <th  class="text-center">Numero</th>
                <th  class="text-center">Producto</th>
                <th  class="text-center">Estado de la empresa</th>
                
                
                <th  class="text-center" >Opciones</th>
                <th></th>
               


            </thead>
            <body>
                <%  while (rs.next()) { %>
            <tr>
                <%
                    String estado = "";
                    int id = rs.getInt("id_estado");

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
                %> 

                <th class="text-center"><%=rs.getInt("id")%></th>  
                <th class="text-center"><%=rs.getString("Empresa")%> </th>
                <th class="text-center"><%=rs.getLong("telefono")%> </th>
                <th class="text-center"><%=rs.getString("producto")%></th>  
                <th class="text-center"> <%=(estado)%></th>  
                <th><a class=" btn btn-warning btn-block" href="formularioProvedor.jsp?id=<%=rs.getInt("id")%>" class="glyphicon glyphicon-pencil"><sglyphicon glyphicon-pencil">Editar</a></th>
               
                <th><a class="btn btn-danger btn-block"  href="eliminarProvedor.jsp?id=<%out.print(rs.getInt("id"));%>">Eliminar<a> </th>
                


            </tr>
            <%}%>
            <div class="text-center">
  <img src="https://img2.freepng.es/20190305/wpa/kisspng-computer-icons-clip-art-vector-graphics-portable-n-supplier-icon-free-download-png-and-vector-5c7f41117d4035.874380201551843601513.jpg" class="rounded" alt="300*300"width="300" height="300">
</div>
            </body>

        </table>   
    </div>     
</head>
<body>

</body>
</html>

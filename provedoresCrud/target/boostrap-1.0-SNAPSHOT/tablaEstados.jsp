<%-- 
    Document   : tablaEstados.jsp
    Created on : 5 jul. 2020, 15:25:16
    Author     : jose eduardo ramirez
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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

<head  method="POST">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<body background="https://us.123rf.com/450wm/iulika1/iulika11707/iulika1170700264/82962287-fondo-en-colores-pastel-colorido-en-estilo-ilustraci%C3%B3n-de-vector-de-fondo-geom%C3%A9trico-low-poly.jpg?ver=6">    
    <title>Tabla Estados</title>


    <h1 class="text-center">TABLA ESTADOS  <br><small class="text-center">Aqui podra consultar los estados , agregar y modificar </small></h1>
    <div class="container-fluid"  method="POST">

        <table class="table table-dark">

            <thead class="thead-hover">
                <tr>
                    <td class="table-hover" colspan="2"><font COLOR="white"> <h2>Estados:</h2> </td>
            

            <td><a class="btn btn-primary  btn-block  "  href="index.jsp"  method="POST" ><img src="https://image.flaticon.com/icons/png/512/720/720466.png" alt="" width="30" height="30" /><br> Ver tabla de los provedores </a></td> <br>
            <td><a class="btn btn-success  btn-block" href="agregarEstado.jsp"  method="POST" ><img src="https://img2.freepng.es/20180523/wjz/kisspng-computer-icons-computer-software-clip-art-open-list-5b051a2cc48529.975643191527061036805.jpg" alt="" width="30" height="30" /><br>Agregar Estado </a></td>     
            </tr>

            <tr


                <br><th  class="text-center " ><font COLOR="white">  #</th>
                <th  class="text-center"><font COLOR="white"> Estado</th>
               

                <th  class="text-center" ><font COLOR="white"> Opciones</th>
               
            </tr>

            </thead>
            <body>
                <%  while (rs.next()) {%>
            <tr>


                <th class="text-center "><font COLOR="white"><%=rs.getInt("id")%></th>  
                <th class="text-center"><font COLOR="white"><%=rs.getString("estado")%> </th>




                <th><a class="btn btn-danger btn-block"  href="eliminarEstado.jsp?id=<%out.print(rs.getInt("id"));%>"> Eliminar el Estado </a> </th>



            </tr>
            <%}%>
            <div class="text-center">
                <img src="data:image/jpeg;base64,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" class="rounded" alt="">
            </div>
            </body>

        </table>   
    </div>     
</head>
<body>

</body>
</html>

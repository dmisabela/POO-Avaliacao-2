<%-- 
    Document   : index
    Created on : 22 de nov. de 2021, 19:43:10
    Author     : isabela
--%>

<%@page import="db.Tasks"%>
<%@page import="web.IsabelaDbListener"%>
<%@page import="db.IsabelaTasksConnector"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
    
    String nameUser = (String) session.getAttribute("session-name");

    Exception requestException = null;   
     ArrayList<Tasks> taskList = new ArrayList<>();    
    try {
        
        if(request.getParameter("add")!=null){
            String taskName = request.getParameter("taskName");
            IsabelaTasksConnector.addTask(taskName, nameUser);
            response.sendRedirect(request.getRequestURI());            
        }
         if(request.getParameter("remove")!=null){
            String taskName = request.getParameter("taskName");
            IsabelaTasksConnector.removeTask(taskName);
            response.sendRedirect(request.getRequestURI());            
        }
         
         taskList = IsabelaTasksConnector.getTasks();
    }
    catch(Exception ex){
        requestException = ex;
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IsabelaTasksApp</title>
    </head>
    <body>
         <%@include file ="WEB-INF/jspf/header.jspf"%>
        
        
        <%if(sessionName==null) {%>
        
        <div class="container">
            
            <div class="alert alert-danger" role="alert">
               Você não tem permissão para acessar esta página.
               Efetue login e tente novamente. 
              </div>
        </div>
        
        <%} else  { %>
         <div class="container">
        <br>
        
        <div style="text-align:center">
            
        <h1>Avaliação 2 - POO</h1>
        <br>
        <h2>IsabelaTasksApp
        <img src="https://i.pinimg.com/originals/09/2f/d0/092fd0a6692251c33744c77697c9b544.png" style="width:40px">
        </h2>
        
        <br>
        <hr>
        <%if(IsabelaDbListener.exception!=null) { %>
        <div style="color:red">
            Erro na criação do DB: <%= IsabelaDbListener.exception.getMessage() %>       
        </div>        
        <%}%>
        <%if(requestException!=null) { %>
        <div style="color:red">
            Erro na leitura ou gravação das tarefas <%= requestException.getMessage() %>       
        </div>        
        <%}%>
        
        <form>
            <input type="text" name="taskName"/>
            <input type="submit" name="add" value="+"/>
        </form>
        
        <br>
            <table class="table table-hover">
            <% for(Tasks taskName: taskList) { %>
            <tr>
                <td><%= taskName.getUser() %></td>
                <td><%= taskName.getTitle() %></td>
                <td>
                 <form>
                    <input type="hidden" name="taskName" value="<%= taskName.getTitle() %>"/>
                    <input type="submit" name="remove" value="-"/>
                </form>                
                </td>
            </tr>
            
            <%}%>
        </table> 
   </div>  
          
        </div>
        <% }%>
    </body>
</html>

<style>
    
body {    
    margin: 0px;
    width: 100vw;
    height: 100vh;
    overflow-x: hidden;   
}
    
.container {

    width: 100vw;
    height: 90vh;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
}
</style>
<%--
  Created by IntelliJ IDEA.
  User: kevint
  Date: 4/11/20
  Time: 10:59 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
  <title>User Management Application</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>

<header>
  <nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div>
      <a href="https://www.github.com/kevintoro" target="_blank" class="navbar-brand"> User
        Management App </a>
    </div>

    <ul class="navbar-nav">
      <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Users</a></li>
    </ul>
  </nav>
</header>
<br>

<div class="row">
  <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

  <div class="container">
    <h3 class="text-center">List of Users</h3>
    <hr>
    <div class="container text-left">

      <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add
        New User</a>
    </div>
    <br>
    <table class="table table-bordered">
      <thead>
      <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <!--   for (Todo todo: todos) {  -->
      <c:forEach var="user" items="${listUser}">

        <tr>
          <td>
            <c:out value="${user.user_id}"/>
          </td>
          <td>
            <c:out value="${user.user_name}"/>
          </td>
          <td>
            <c:out value="${user.user_email}"/>
          </td>
          <td>
            <c:out value="${user.user_country}"/>
          </td>
          <td><a href="edit?user_id=<c:out value='${user.user_id}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
                  href="delete?user_id=<c:out value='${user.user_id}' />">Delete</a></td>
        </tr>
      </c:forEach>
      <!-- } -->
      </tbody>

    </table>
  </div>
</div>
</body>

</html>

<%--
  Created by IntelliJ IDEA.
  User: kevint
  Date: 4/11/20
  Time: 10:58 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      <a href="https://www.github.com/kevintoro" target="_blank" class="navbar-brand"> User Management App </a>
    </div>

    <ul class="navbar-nav">
      <li><a href="<%=request.getContextPath()%>/list" class="nav-link">Users</a></li>
    </ul>
  </nav>
</header>
<br>
<div class="container col-md-5">
  <div class="card">
    <div class="card-body">
      <c:if test="${user != null}">
      <form action="update" method="post">
        </c:if>
        <c:if test="${user == null}">
        <form action="insert" method="post">
          </c:if>

          <caption>
            <h2>
              <c:if test="${user != null}">
                Edit User
              </c:if>
              <c:if test="${user == null}">
                Add New User
              </c:if>
            </h2>
          </caption>

          <c:if test="${user != null}">
            <input type="hidden" name="user_id" value="<c:out value='${user.user_id}' />"/>
          </c:if>

          <fieldset class="form-group">
            <label>User Name</label> <input type="text" value="<c:out value='${user.user_name}' />" class="form-control"
                                            name="user_name" required="required">
          </fieldset>

          <fieldset class="form-group">
            <label>User Email</label> <input type="email" value="<c:out value='${user.user_email}' />" class="form-control"
                                             name="user_email">
          </fieldset>

          <fieldset class="form-group">
            <label>User Country</label> <input type="text" value="<c:out value='${user.user_country}' />"
                                               class="form-control" name="user_country">
          </fieldset>

          <button type="submit" class="btn btn-success">Save</button>
            <a href="<%=request.getContextPath()%>/list" class="btn btn-danger">Cancel</a>
        </form>
    </div>
  </div>
</div>
</body>

</html>

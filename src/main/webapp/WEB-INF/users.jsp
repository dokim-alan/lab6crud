<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>UsersTab</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </head>
    <body>
        <h1>User Management System</h1>
        <div class=""container">
            <div class="row">
                <table>
                    <tr>
                        <th>
                            <div class="col2">
                                <h2>User List</h2>
                                    <table class="table">
                                        <thead> 
                                            <tr>
                                                <th>E-mail</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Active</th>
                                                <th>Role</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                            <tbody>
                                                <c:forEach var="user" items="${users}" >
                                                    <tr>
                                                        <td>${user.email}</td>
                                                        <td>${user.firstName}</td>
                                                        <td>${user.lastName}</td>
                                                        <td>${user.active ? "Y" : "N"}</td>
                                                        <!-- <c:if test="${user.active == true}">active</c:if> -->
                                                        <td>${user.getRole().getName()}</td>
                                                        <!--<td>
                                                            <a href="javascript:getAll()">Edit</a>
                                                            <a href="">Delete</a>
                                                        </td> -->
                                                        <td>
                                                        <form action="user" method="post">
                                                        <button type="submit" name="edit" id="edit" value="${user.email}">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                                            <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                                                            </svg>
                                                        </button>
                                                
                                                        <button type="submit" name="delete" id="delete" value="${user.email}">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                            <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                                                            </svg>
                                                        </button> 
                                                        </form></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                    </table> 
                            </div>
                        </th>
                        <th>
                            <div class="col1">
                                <h2>Create User</h2>
                                    <form action="user" method="post">
                                        <label for="email">Email: </label>
                                        <input type="text" name="email" id="email" placeholder="Email" required><br>
                                        <label for="firstname">First Name: </label>
                                        <input type="text" name="firstname" id="firstname" placeholder="First Name" required><br>
                                        <label for="lastname">Last Name: </label>
                                        <input type="text" name="lastname" id="lastname" placeholder="Last Name" required><br>
                                        <label for="password">Password: </label>
                                        <input type="text" name="password" id="password" placeholder="Password" required><br>
                                        <!--<label for="active" for="flexCheckDefault">Active: </label>
                                        <input type="checkbox" name="active" value="" id="flexCheckDefault" value="${input_active}"><br>
                                        -->
                                         <label for="role">Role: </label>
                                         <select name="role" id="role">
                                            <option value="" selected hidden disabled>Define a role</option>
                                            <option value="1" >System Administrator</option>
                                            <option value="2" >Regular user</option>
                                            <option value="3" >Company Administrator</option>
                                        </select><br>
                                        <input type="hidden" name="action" value="create">
                                        <button type="submit">CREATE</button>
                                    </form>
                            </div>
                        </th>
                        <th>
                            <div class="col3">
                                <h2>Update User</h2>
                                    <form action="user" method="post">
                                        <label for="email">Email: </label>
                                        <input type="text" name="email" id="email" value="${input_email}"><br>
                                        <label for="firstname">First Name: </label>
                                        <input type="text" name="firstname" id="firstname" value="${input_firstname}"><br>
                                        <label for="lastname">Last Name: </label>
                                        <input type="text" name="lastname" id="lastname" value="${input_lastname}"><br>
                                        <label for="password">Password: </label>
                                        <input type="text" name="password" id="password" value="${input_password}"><br>
                                        <!--<label for="active" for="flexCheckDefault">Active: </label>
                                        <input type="checkbox" name="active" value="" id="flexCheckDefault" value="${input_active}"><br>
                                        -->
                                         <label for="role">Role: </label>
                                         <select name="role" id="role">
                                            <option value="" selected hidden disabled>Define a role</option>
                                            <option value="1" >System Administrator</option>
                                            <option value="2" >Regular user</option>
                                            <option value="3" >Company Administrator</option>
                                        </select><br>
                                        <button type="submit" name="action" value="update">UPDATE</button>
                                        <button type="submit" name="action" value="cancel">CANCEL</button>
                                        <!--<button type="submit">CANCEL</button>-->
                                    </form>
                            </div>
                        </th>
                    </tr>
                </table>
            </div>
        </div>
        
        <!--
        <h1>User Management System</h1>
        <div class=""container">
            <div class="row">
                <div class="col">
                    <h2>User List</h2>
                    <table class="table">
                        <thead> 
                            <tr>
                                <th>E-mail</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Active</th>
                                <th>Role</th>
                                <th>Actions</th>
                                <th>Edit</th>
                                <th>Delete</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}" >
                                <tr>
                                    <td>${user.email}</td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <td>${user.active ? "Y" : "N"}</td>
                                    <td>${user.getRole().getName()}</td>
                                    <td>
                                        <form action="user" method="post">
                                            <button type="submit" name="edit" id="edit" value="${user.email}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                                <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
                                                </svg>
                                            </button>
                                        </form>
                                    </td>
                                    <td>
                                        <form action="user" method="post">
                                            <button type="submit" name="delete" id="delete" value="${user.email}">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                                <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/>
                                                </svg>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                    
                </div>
            </div>
        </div>
        
        <form action="user" method="post">
            <h2>Create/Update User</h2>
            <tr>
                <td>
                <label for="email">Email: </label>
                <input type="text" name="email" id="email" value="${input_email}"></td><br><td>
                
                <label for="firstname">First Name: </label>
                <input type="text" name="firstname" id="firstname" value="${input_firstname}"></td><br><td>
                
                <label for="lastname">Last Name: </label>
                <input type="text" name="lastname" id="lastname" value="${input_lastname}"></td><br><td>
                
                <label for="active" for="flexCheckDefault">Active: </label>
                <input type="checkbox" name="active" value="" id="flexCheckDefault" value="${input_active}"></td><br><td>
                
                <label for="password">Password: </label>
                <input type="password" name="password" id="password" value="${input_password}"></td><br><td>
                
                <label for="role">Role: </label>
                    <select name="role" id="role">
                        <option value="" selected hidden disabled>Define a role</option>
                        <option value="1" >System Administrator</option>
                        <option value="2" >Regular user</option>
                        <option value="3" >Company Administrator</option>
                    </select>
                    </td><br>
            </tr>
                
            <button type="submit" name="create" id="create">CREATE</button> 
            <button type="submit" name="update" id="update">UPDATE</button>
            <button type="submit" name="cancel" id="cancel">CANCEL</button>
        </form>
        
        <div>${message}</div>
        -->
    </body>
</html>

<!DOCTYPE html>
<html>
<head>
    <title>ShopHere</title>
</head>
<body>
<h1>ShopHere</h1>
<h4>Authorization</h4>
<form action="/login" method="post">
    Email: <input type="email" name="username"><br><br>
    Password: <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Sign in"/>
</form>
<a href="/registration">Register</a>
</body>
</html>
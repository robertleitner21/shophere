<!DOCTYPE html>
<html>
<head>
    <title>ShopHere</title>
</head>
<body>
<h1>ShopHere</h1>
<hr>
<#if user.email??>
    <h3>Username: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Log out">
    </form>
<#else>
    <a href="/login">Sign in</a>
</#if>
<hr>
<h4>Products from Poland</h4>
<form action="/" method="get">
    Searching by item's title: <input type="text" name="title"><br>
    <input type="submit" value="Search">
</form>
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} usd | <a href="/product/${product.id}">Details...</a></p>
    </div>
    <#else>
    <h3>Lack of items</h3>
</#list>
<#if user.email??>
<hr>
<h3>Create new item</h3>
<form action="/product/create" method="post" enctype="multipart/form-data">
    Title of product: <input type="text" name="title"/><br><br>
    Description of product: <input type="text" name="description"/><br><br>
    Price of product: <input type="number" name="price"/><br><br>
    City: <input type="text" name="city"/><br><br>
    First image: <input type="file" name="file1"/><br><br>
    Second image: <input type="file" name="file2"/><br><br>
    Third image: <input type="file" name="file3"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Add item"/>
</form>

</#if>
</body>
</html>
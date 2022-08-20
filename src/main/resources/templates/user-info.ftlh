<!DOCTYPE html>
<html>
<head>
    <title>ShopHere</title>
</head>
<body>
<h1>ShopHere</h1>
<h3>Details about user ${user.name}</h3>
<b>Phone number: </b> ${user.phoneNumber}<br>
<b>Email: </b> ${user.email}<br>
<h4>Items of user ${user.name}</h4>
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} usd | <a href="/product/${product.id}">Details...</a></p>
    </div>
    <#else>
    <h3>Lack of items</h3>
</#list>
<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
</body>
</html>
<!DOCTYPE html>
<html>
<head>
    <title>ShopHere</title>
</head>
<body>
<h1>ShopHere</h1>
<h4>Item details</h4>
<#list images as img>
    <img src="/images/${img.id}" height="60px"><br><br>
</#list>
<b>Title of item: </b>${product.title}<br>
<b>Description of item: </b>${product.description}<br>
<b>Price of item: </b>${product.price}<br>
<b>City: </b>${product.city}<br>
<b>Author of item: </b>${product.author}<br>
<hr>
<form action="/product/delete/${product.id}" method="post">
    <input type="submit" value="Delete item"/>
</form>
</body>
</html>
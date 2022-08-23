<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Registration</h1>
    <hr>
    <form action="/registration" method="post">
        <div class="form-group">
            <label for="name">User name</label>
            <input type="text" class="form-control" required id="name" name="name">
        </div>
        <div class="form-group">
            <label for="email">E-mail</label>
            <input type="email" class="form-control" id="email" required name="email">
        </div>
        <div class="form-group">
            <label for="phoneNumber">Phone number</label>
            <input type="text" class="form-control" id="phoneNumber" required name="phoneNumber">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" required name="password">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-dark">Sign Up</button>
    </form>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
</@t.template>
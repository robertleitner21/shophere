<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Authorization</h1><hr>
    <form action="/login" method="post">
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="email" name="username">
            <div id="email" class="invalid-feedback">
                Wrong Email!
            </div>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="password" name="password">
            <div id="password" class="invalid-feedback">
                Wrong Password!
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-dark">Sign In</button>
    </form>
    <hr>
    <h2>Have not an account? <a href="/registration">Register</a></h2>
</@t.template>
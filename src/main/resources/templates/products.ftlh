<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Search Item</h1><hr>
    <form method="get" action="/">
        <div class="form-row">
            <div class="form-group col-md-2">
                <label for="searchCity">City</label>
                <select id="searchCity" class="form-control">
                    <option value="">City is not choosen</option>
                    <option value="Warsaw">Warsaw</option>
                    <option value="Krakow">Krakow</option>
                    <option value="Wroclaw">Wroclaw</option>
                    <option value="Gdansk">Gdansk</option>
                    <option value="Gdynia">Gdynia</option>
                    <option value="Poznan">Poznan</option>
                    <option value="Szczecin">Szczecin</option>
                    <option value="Opole">Opole</option>
                    <option value="Katowice">Katowice</option>
                    <option value="Lodz">Lodz</option>
                    <option value="Lublin">Lublin</option>
                    <option value="Przemysl">Przemysl</option>
                    <option value="Bydgoszcz">Bydgoszcz</option>
                    <option value="Bialystok">Bialystok</option>
                    <option value="Radom">Radom</option>
                </select>
            </div>
            <div class="form-group col-md-10">
                <label for="searchWord">Search by advertisement</label>
                <input type="text" name="searchWord" <#if searchWord??>value="${searchWord}"</#if> class="form-control"
                       id="searchWord">
            </div>
            <button style="width: 100%"  type="submit" class="btn btn-dark">Search</button>
        </div>
    </form>
    <hr>
    <div class="card-columns">
        <#list products as product>
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">

                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text">${product.price} $</p>
                    </div>
                    <div class="card-footer">
                        ${product.city}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Not Found!</h1>
        </#list>
    </div>
</@t.template>

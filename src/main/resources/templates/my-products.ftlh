<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">My Items</h1>
    <hr>
    <a class="btn btn-dark mt-3 mb-3" style="text-align: center; width: 100%"
       data-toggle="collapse" href="#collapseExample" role="button"
       aria-expanded="true" aria-controls="collapseExample">
        Add new item
    </a>
    <div class="collapse mb-3" id="collapseExample" style="">
        <form action="/product/create" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="productName">Name of item</label>
                <input type="text" required class="form-control"
                       id="productName" name="title">
            </div>
            <div class="form-group">
                <label for="price">Price of product</label>
                <div class="input-group mb-3">
                    <input type="number" required class="form-control" id="price" name="price">
                    <div class="input-group-append">
                        <span class="input-group-text">$</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label for="searchCity">City</label>
                <select id="searchCity" required name="city" class="form-control">
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
            <div class="form-group">
                <label for="description">Description of the item</label>
                <textarea required class="form-control" id="description" name="description"></textarea>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input required type="file" name="file1" id="file1">
                    <label class="custom-file-label" for="file1">First photo to item</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file2" id="file2">
                    <label class="custom-file-label" for="file2">Second photo to item</label>
                </div>
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" name="file3" id="file3">
                    <label class="custom-file-label" for="file3">Third photo to item</label>
                </div>
            </div>
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>

            <button type="submit" style="width: 100%" class="btn btn-dark">Add</button>
        </form>
    </div>
    <div class="card-columns">
        <#list products as product>
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">
                    <div class="card-top">
                        <form action="/product/delete/${product.id}" method="post">
                            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                            <button type="submit" class="btn btn-danger m-3">
                                Delete
                            </button>
                        </form>
                    </div>
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
            <h1 style="text-align: center">Not found</h1>
        </#list>
    </div>
</@t.template>
<%@ Page Title="" Language="C#" MasterPageFile="~/MarterPage.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SistemaActivos1.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
   <div class="middleDiv" id="middleDiv">

        <h1 style="text-align: right;"> The standard Lorem Ipsum passage, used since the 1500s </h1>
        <h2 style="text-align: right;"> Section 1.10.32 of "de Finibus Bonorum et Malorum" </h2>
        <h3 style="text-align: right;"> Written by Cicero in 45 BC </h3>

        <p class="shadow-sm p-3 mb-5 bg-white rounded"> "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." </p>

        <h2> Ejemplo de una tabla Responsiva </h2>
        <p class="shadow-sm p-3 mb-5 bg-white rounded"> El siguiente es un ejemplo de una tabla responsiva utilizando Bootstrap </p>

        <div class="table-responsive">
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">First</th>
                      <th scope="col">Last</th>
                      <th scope="col">Handle</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">1</th>
                      <td>Mark</td>
                      <td>Otto</td>
                      <td>@mdo</td>
                    </tr>
                    <tr>
                      <th scope="row">2</th>
                      <td>Jacob</td>
                      <td>Thornton</td>
                      <td>@fat</td>
                    </tr>
                    <tr>
                      <th scope="row">3</th>
                      <td>Larry</td>
                      <td>the Bird</td>
                      <td>@twitter</td>
                    </tr>
                  </tbody>
                </thead>
            </table>
        </div>


        <h2> Elementos para un formulario #1 </h2>
        <p class="shadow-sm p-3 mb-5 bg-white rounded"> Lo que se encuentra dentro del siguiente cuadro en blanco, son un ejemplo de los elementos de un formulario usando Bootstrap, como por ejemplo el login de la plataforma. </p>

        <div class="shadow-sm p-3 mb-5 bg-white rounded">
            <form>
                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1">
                </div>
                <div class="form-group form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>

        <h2> Elementos para un formulario #2 </h2>

        <p class="shadow-sm p-3 mb-5 bg-white rounded"> Misma historia, pero esta vez estoy mostrando unos ejemplos, de como se puede personalizar los formularios más a fondo. Se puede ver como se puede agregar unos labels a distintos tipos de cajas de entrada. </p>

        <div class="shadow-sm p-3 mb-5 bg-white rounded">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1">@</span>
              </div>
              <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
            </div>

            <div class="input-group mb-3">
              <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <span class="input-group-text" id="basic-addon2">@example.com</span>
              </div>
            </div>

            <label for="basic-url">Your vanity URL</label>
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon3">https://example.com/users/</span>
              </div>
              <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3">
            </div>

            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text">$</span>
              </div>
              <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)">
              <div class="input-group-append">
                <span class="input-group-text">.00</span>
              </div>
            </div>

            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text">With textarea</span>
              </div>
              <textarea class="form-control" aria-label="With textarea"></textarea>
            </div>
        </div>

    </div>
</asp:Content>

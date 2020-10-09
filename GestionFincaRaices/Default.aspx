<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="GestionFincaRaices._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Cuenta con nosotros como tu aliado Inmobiliario.</h1>
    </div>

    <div class="row">
        <div class="col-md-4">
            <h2>Registrar Persona</h2>
            <p>
                Proceso mediante el cual te registras en el sistema para poder alquilar algun tipo de inmobiliario.
            </p>
            <a href="~/Consultar" runat="server"  class="badge badge-info">Saber mas...</a>
        </div>
        <div class="col-md-4">
            <h2>Registrar Inmueble</h2>
            <p>
                Proceso donde va registrar toda la informacion necesaria para mostrar respecto al Inmueble (Edificio,Local,Oficina) Entre otros.
            </p>
            <a href="~/ConsultarInmueble" runat="server" class="badge badge-info">Saber mas...</a>
        </div>
        <div class="col-md-4">
            <h2>Consultar Estado del Inmueble</h2>
            <p>
                Por medio del nombre se puede consultar que tipo de inmueble esta disponible o no y poder arrebdarlo.
            </p>
            <a href="~/Arrendar" class="badge badge-info" runat="server">Saber mas...</a>
        </div>
    </div>

</asp:Content>

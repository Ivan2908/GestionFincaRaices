<%@ Page Title="Listado de Consultas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="GestionFincaRaices.WebForm2" %>

<asp:Content ID="ListadoConsultas" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="card-header">
            <h2><%: Title %>.</h2>
        </div>
        <asp:Panel runat="server" ID="pnlDatosInquipF" CssClass="card">
            <div class="card-body">
                <h5 class="card-title">El Listado de los inquilinos ordenados por Fechas</h5>
                <div class="card-body">
                    <asp:GridView ID="gvdInquipF" runat="server" AutoGenerateColumns="false" CssClass="table" DataKeyNames="contrato_id" OnSelectedIndexChanged="gvdInquipF_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="contrato_id" HeaderText="Codigo de Contrato" />
                            <asp:BoundField DataField="nombre" HeaderText="Nombre del Inmueble" />
                            <asp:BoundField DataField="nombrepersona" HeaderText="Nombre del Arrendatario" />
                            <asp:BoundField DataField="fecha_creacion" HeaderText="Fecha de Creacion" />
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlTodoInmuebles" CssClass="card">
            <div class="card-body">
                <h5 class="card-title">El listado de todos los inmuebles</h5>
                <div class="card-body">
                    <asp:GridView ID="gvdTodoInmuebles" runat="server" AutoGenerateColumns="false" CssClass="table" DataKeyNames="inmueble_id">
                        <Columns>
                            <asp:BoundField DataField="inmueble_id" HeaderText="Codigo" />
                            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                            <asp:BoundField DataField="codigo_postal" HeaderText="Codigo Postal" />
                            <asp:BoundField DataField="direccion" HeaderText="Direccion" />
                            <asp:BoundField DataField="precio" HeaderText="Precio" />
                            <asp:BoundField DataField="descripcion" HeaderText="Descripcion" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel runat="server" ID="pnlInquiMorosos" CssClass="card">
            <div class="card-body">
                <h5 class="card-title">El listado de Clientes Morosos</h5>
                <div class="card-body">
                    <asp:GridView ID="gvdInquiMorosos" runat="server" AutoGenerateColumns="false" CssClass="table" DataKeyNames="factura_id">
                        <Columns>
                            <asp:BoundField DataField="factura_id" HeaderText="Codigo de Factura" />
                            <asp:BoundField DataField="nombre" HeaderText="Nombre del Moroso" />
                            <asp:BoundField DataField="estado" HeaderText="Estado" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </asp:Panel>

    </div>
</asp:Content>

<%@ Page Title="Arrienda" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Arrendar.aspx.cs" Inherits="GestionFincaRaices.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:Panel runat="server" ID="pnlDatosContratos" CssClass="card">
            <div class="card-header">
                <h2><%: Title %>.</h2>
            </div>
            <div class="card-body">
                <asp:GridView ID="gvdContrato" runat="server" AutoGenerateColumns="false" CssClass="table" DataKeyNames="contrato_id" OnRowDeleting="gvdContrato_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="contrato_id" HeaderText="Codigo de Contrato" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre del Inmueble" />
                        <asp:BoundField DataField="nombrepersona" HeaderText="Nombre del Arrendatario" />
                        <asp:BoundField DataField="cedula" HeaderText="Cedula" />
                        <asp:BoundField DataField="estado" HeaderText="Estado" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Eliminar" Width="20px" Height="20px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="card-body">
                <asp:GridView ID="gvdFactura" runat="server" AutoGenerateColumns="false" CssClass="table" DataKeyNames="factura_id">
                    <Columns>
                        <asp:BoundField DataField="factura_id" HeaderText="Codigo de Factura" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre del Arrendatario" />
                        <asp:BoundField DataField="total" HeaderText="Total de Pago" />
                        <asp:BoundField DataField="estado" HeaderText="Estado" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="card-body">
                <asp:Button ID="btn_arrendar" runat="server" Text="Arrendar Inmueble" CssClass="btn btn-primary" OnClick="Btn_NuevoArriendo" />
                <asp:Button ID="Button_registrarFactura" runat="server" Text="Crear Factura" CssClass="btn btn-info" OnClick="Button_registrarFactura_Click" />
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlNuevaFactura" Visible="false" CssClass="card">
            <div class="card-header">
                <h2>Nuevo Contrato de Arriendo</h2>
            </div>
            <div class="card-body">
                 <div class="form-group row">
                    <asp:Label ID="labelCodigoContrato" runat="server" Text="Codigo de Contrato" CssClass="col-sm-2 col-form-label"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" CssClass="form-control" ID="TxtCodigoContrato" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                            runat="server"
                            ErrorMessage="Todos los campos son obligatorios" ControlToValidate="TxtCodigoContrato"
                            Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="error">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                 <div class="form-group row">
                    <asp:Label ID="labelTotal" runat="server" Text="Total Factura" CssClass="col-sm-2 col-form-label"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" CssClass="form-control" ID="TxtTotalFactura" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                            runat="server"
                            ErrorMessage="" ControlToValidate="TxtTotalFactura"
                            Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="error">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <asp:Label ID="labelEstado" runat="server" Text="Estado" CssClass="col-sm-2 col-form-label"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" CssClass="form-control" ID="TxtEstado" placeholder="Ej: Moroso / Al dia"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server"
                            ErrorMessage="" ControlToValidate="TxtEstado"
                            Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="error">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <div class="form-group">
                    <div class="row">
                        <div class="col-sm-*">
                            <asp:Button ID="ButtonGuardarFactura" runat="server" Text="Registrar Contrato" CssClass="btn btn-primary btn-lg" OnClick="ButtonGuardarFactura_Click" ValidationGroup="error" />
                            <a runat="server" href="~/Arrendar" class="btn btn-danger btn-lg">Atras</a>
                        </div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="error" ForeColor="Red" />
                    </div>
                </div>

                <br />
                <asp:Label ID="Label1" Text="" runat="server" CssClass="alert alert-success" Visible="false" />
                <br />
                <asp:Label ID="Label2" Text="" runat="server" ForeColor="Red" Visible="false" />
        </asp:Panel>


        <asp:Panel runat="server" ID="pnlNuevaContrato" Visible="false" CssClass="card">
            <div class="card-header">
                <h2>Nuevo Contrato de Arriendo</h2>
            </div>
            <div class="cardo-body">
                <div class="form-group row">
                    <asp:Label ID="labelID_Inmueble" runat="server" Text="Codigo de Inmueble" CssClass="col-sm-2 col-form-label"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" CssClass="form-control" ID="TxtCodigoInmueble" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombre"
                            runat="server"
                            ErrorMessage="Todos los campos son obligatorios" ControlToValidate="TxtCodigoInmueble"
                            Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="error">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <asp:Label ID="labelCodigoPersona" runat="server" Text="Codigo de Cliente" CssClass="col-sm-2 col-form-label"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" CssClass="form-control" ID="TxtCodigoCliente" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCL"
                            runat="server"
                            ErrorMessage="" ControlToValidate="TxtCodigoCliente"
                            Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="error">*</asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-*">
                            <asp:Button ID="ButtonContrato" runat="server" Text="Registrar Contrato" CssClass="btn btn-primary btn-lg" OnClick="Button_Click_contrato" ValidationGroup="error" />
                            <a runat="server" href="~/Arrendar" class="btn btn-danger btn-lg">Atras</a>
                        </div>
                        <asp:ValidationSummary ID="ValidationSummaryRegistrar" runat="server" ValidationGroup="error" ForeColor="Red" />
                    </div>
                </div>

                <br />
                <asp:Label ID="lblSuccessMessage" Text="" runat="server" CssClass="alert alert-success" Visible="false" />
                <br />
                <asp:Label ID="lblErrorMessage" Text="" runat="server" ForeColor="Red" Visible="false" />
            </div>
        </asp:Panel>

    </div>
</asp:Content>

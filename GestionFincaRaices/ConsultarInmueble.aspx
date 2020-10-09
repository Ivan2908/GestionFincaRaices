<%@ Page Title="Consultar Inmueble" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsultarInmueble.aspx.cs" Inherits="GestionFincaRaices.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <asp:Panel runat="server" ID="pnlDatosInmuebles" CssClass="card">
            <div class="card-header">
                <h2><%: Title %>.</h2>
            </div>
            <div class="card-body">
                <asp:GridView ID="gvdInmueble" runat="server" AutoGenerateColumns="false" CssClass="table" DataKeyNames="inmueble_id" OnRowDeleting="gvdPersona_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="inmueble_id" HeaderText="Codigo" />
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="codigo_postal" HeaderText="Codigo Postal" />
                        <asp:BoundField DataField="direccion" HeaderText="Direccion" />
                        <asp:BoundField DataField="precio" HeaderText="Precio" />
                        <asp:BoundField DataField="descripcion" HeaderText="Descripcion" />
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
                <asp:Button ID="btn_registrarInmueble" runat="server" Text="Registrar Inmueble" CssClass="btn btn-primary" OnClick="Btn_NuevaInmueble" />
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlNuevaInmueble" Visible="false" CssClass="card">
            <div class="card-header">
                <h2>Registrar Nuevo Inmueble</h2>
            </div>
            <div class="cardo-body">
                <div class="form-group row">
                    <asp:Label ID="labelNombreInmueble" runat="server" Text="Nombre Inmueble" CssClass="col-sm-2 col-form-label"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" CssClass="form-control" ID="TxtNombreInmueble" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombre"
                            runat="server"
                            ErrorMessage="Todos los campos son obligatorios" ControlToValidate="TxtNombreInmueble"
                            Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="error">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row mt-2">
                    <asp:Label ID="labelCodigoPostal" runat="server" Text="Codigo Postal" CssClass="col-sm-2 col-form-label"></asp:Label>

                    <div class="col-sm-10">
                        <asp:TextBox runat="server" CssClass="form-control" ID="TxtCodigoPostal" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCP"
                            runat="server" ControlToValidate="TxtCodigoPostal"
                            Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="error">Ingresar Campo.</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row mt-2">
                    <asp:Label ID="labelDireccionInmueble" runat="server" Text="Direccion" CssClass="col-sm-2 col-form-label"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" CssClass="form-control" ID="TxtDireccionInmueble" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDireccion"
                            runat="server"
                            ErrorMessage="" ControlToValidate="TxtDireccionInmueble"
                            Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="error">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row mt-2">
                    <asp:Label ID="labelPrecio" runat="server" Text="Precio" CssClass="col-sm-2 col-form-label"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" CssClass="form-control" ID="TxTPrecio" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPrecio"
                            runat="server"
                            ErrorMessage="" ControlToValidate="TxTPrecio"
                            Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="error">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <fieldset class="form-group">
                    <div class="row">
                        <asp:Label ID="labelTipo" runat="server" Text="Tipo de Inmueble" CssClass="col-form-label col-sm-2 pt-0"></asp:Label>
                        <div class="col-sm-10">
                            <div class="form-check">
                                <asp:RadioButton ID="RadiotipoE" runat="server" Text="Edificio" CssClass="form-check-input" GroupName="Tipó" />
                            </div>
                            <div class="form-check">
                                <asp:RadioButton ID="RadiotipoP" runat="server" Text="Piso" CssClass="form-check-input" GroupName="Tipo" />
                            </div>
                            <div class="form-check">
                                <asp:RadioButton ID="RadiotipoL" runat="server" Text="Local Comercial" CssClass="form-check-input" GroupName="Tipo" />
                            </div>
                            <div class="form-check">
                                <asp:RadioButton ID="RadiotipoO" runat="server" Text="Oficina" CssClass="form-check-input" GroupName="Tipo" />
                            </div>
                            <div class="form-check">
                                <asp:RadioButton ID="RadiotipoF" runat="server" Text="Finca" CssClass="form-check-input" GroupName="Tipo" />
                            </div>
                        </div>
                    </div>
                </fieldset> 
                
                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-*">
                            <asp:Button ID="Button" runat="server" Text="Registrar Inmueble" CssClass="btn btn-primary btn-lg" OnClick="Button_Click_inmueble" ValidationGroup="error" />                         
                            <a runat="server" href="~/ConsultarInmueble" class="btn btn-danger btn-lg">Atras</a>
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

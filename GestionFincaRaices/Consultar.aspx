<%@ Page Title="Consultar Listado de Clientes registrados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Consultar.aspx.cs" Inherits="GestionFincaRaices.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <asp:Panel runat="server" ID="pnlDatosPersonas" CssClass="card">
            <div class="card-header">
                <h2><%: Title %>.</h2>
            </div>
            <div class="card-body">
                <asp:GridView ID="gvdPersona" runat="server" AutoGenerateColumns="false" CssClass="table" DataKeyNames="Id Persona"
                    OnRowDeleting="gvdPersona_RowDeleting"
                    OnRowUpdating="gvdPersona_RowUpdating"
                    OnRowEditing="gvdPersona_RowEditing"
                    OnRowCancelingEdit="gvdPersona_RowCancelingEdit">

                    <Columns>
                        <asp:BoundField DataField="Id Persona" HeaderText="Id Persona" />
                        <asp:TemplateField HeaderText="Nombre">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Nombre") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtNombreEditar" Text='<%# Eval("Nombre") %>' runat="server" />
                            </EditItemTemplate>                           
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cedula">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Cedula") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCedulaEditar" Text='<%# Eval("Cedula") %>' runat="server" />
                            </EditItemTemplate>                           
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edad">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Edad") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEdadEditar" Text='<%# Eval("Edad") %>' runat="server" />
                            </EditItemTemplate>                           
                        </asp:TemplateField>

                        <asp:BoundField DataField="Sexo" HeaderText="Sexo" />
                        <asp:TemplateField HeaderText="Telefono">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Telefono") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTelefonoEditar" Text='<%# Eval("Telefono") %>' runat="server" />
                            </EditItemTemplate>                           
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Direccion">
                            <ItemTemplate>
                                <asp:Label Text='<%# Eval("Direccion") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDireccionEditar" Text='<%# Eval("Direccion") %>' runat="server" />
                            </EditItemTemplate>                           
                        </asp:TemplateField>
                        <asp:BoundField DataField="Fecha de creacion" HeaderText="Fecha de creacion" />

                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ImageUrl="~/Images/edit.png" runat="server" CommandName="Edit" ToolTip="Editar" Width="20px" Height="20px" />
                                <asp:ImageButton ImageUrl="~/Images/delete.png" runat="server" CommandName="Delete" ToolTip="Eliminar" Width="20px" Height="20px" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ImageUrl="~/Images/save.png" runat="server" CommandName="Update" ToolTip="Actualizar" Width="20px" Height="20px" />
                                <asp:ImageButton ImageUrl="~/Images/cancel.png" runat="server" CommandName="Cancel" ToolTip="Cancelar" Width="20px" Height="20px" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>
            <div class="card-bod">
                <asp:Button ID="btn_registrarPersona" runat="server" Text="Registrar Persona" CssClass="btn btn-primary" OnClick="Btn_NuevaPersona" />
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlNuevaPersona" Visible="false" CssClass="card">
            <div class="card-header">
                <h2>Registrar Nuevo Cliente</h2>
            </div>
            <div class="cardo-body">
                <fieldset class="form-group mt-2">
                    <div class="row">
                        <asp:Label ID="labelTipoPersona" runat="server" Text="Tipo de Persona" CssClass="col-form-label col-sm-2 pt-0"></asp:Label>
                        <div class="col-sm-10">
                            <div class="form-check">
                                <asp:RadioButton ID="RadioButton1" runat="server" Text="Cliente" CssClass="form-check-input" GroupName="TipoPersona" />

                            </div>
                            <div class="form-check">
                                <asp:RadioButton ID="RadioButton2" runat="server" Text="Secretario" CssClass="form-check-input" GroupName="TipoPersona" />

                            </div>
                            <div class="form-check">
                                <asp:RadioButton ID="RadioButton3" runat="server" Text="Administrador" CssClass="form-check-input" GroupName="TipoPersona" />

                            </div>
                        </div>
                    </div>
                </fieldset>
                <div class="form-group row">
                    <asp:Label ID="labelNombre" runat="server" Text="Nombre" CssClass="col-sm-2 col-form-label"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" CssClass="form-control" ID="TxtNombre" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNombre"
                            runat="server"
                            ErrorMessage="Todos los campos son obligatorios" ControlToValidate="TxtNombre"
                            Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="error">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row mt-2">
                    <asp:Label ID="labelCedula" runat="server" Text="Cedula" CssClass="col-sm-2 col-form-label"></asp:Label>

                    <div class="col-sm-10">
                        <asp:TextBox runat="server" CssClass="form-control" ID="TxtCedula" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCedula"
                            runat="server" ControlToValidate="TxtCedula"
                            Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="error">Ingresar Campo.</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group row mt-2">
                    <asp:Label ID="labelEdad" runat="server" Text="Edad" CssClass="col-sm-2 col-form-label"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" CssClass="form-control" ID="TxtEdad" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEdad"
                            runat="server"
                            ErrorMessage="" ControlToValidate="TxtEdad"
                            Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="error">*</asp:RequiredFieldValidator>
                    </div>
                </div>
                <fieldset class="form-group">
                    <div class="row">
                        <asp:Label ID="labelSexo" runat="server" Text="Sexo" CssClass="col-form-label col-sm-2 pt-0"></asp:Label>
                        <div class="col-sm-10">
                            <div class="form-check">
                                <asp:RadioButton ID="RadioSexoM" runat="server" Text="Masculino" CssClass="form-check-input" GroupName="genero" />

                            </div>
                            <div class="form-check">
                                <asp:RadioButton ID="RadioSexoF" runat="server" Text="Femenino" CssClass="form-check-input" GroupName="genero" />

                            </div>
                        </div>
                    </div>
                </fieldset>
                <div class="form-group row mt-2">
                    <asp:Label ID="labelTelefono" runat="server" Text="Telefono" CssClass="col-sm-2 col-form-label"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" CssClass="form-control" ID="TxTtelefono" TextMode="Number" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorTelefono"
                            runat="server"
                            ErrorMessage="" ControlToValidate="TxTtelefono"
                            Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="error">*</asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class="form-group row mt-2">
                    <asp:Label ID="labelDireccion" runat="server" Text="Direccion" CssClass="col-sm-2 col-form-label"></asp:Label>
                    <div class="col-sm-10">
                        <asp:TextBox runat="server" CssClass="form-control" ID="TxtDireccion" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDireccion"
                            runat="server"
                            ErrorMessage="" ControlToValidate="TxtDireccion"
                            Display="Dynamic" SetFocusOnError="True" ForeColor="Red" ValidationGroup="error">*</asp:RequiredFieldValidator>
                    </div>
                </div>



                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-*">
                            <asp:Button ID="Button" runat="server" Text="Registrarse" CssClass="btn btn-primary btn-lg" OnClick="Button_Click" ValidationGroup="error" />
                            <a runat="server" href="~/Consultar" class="btn btn-danger btn-lg">Atras</a>
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

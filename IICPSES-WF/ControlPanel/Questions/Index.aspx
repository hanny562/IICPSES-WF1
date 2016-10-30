<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="IICPSES_WF.ControlPanel.Questions.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBreadcrumb" runat="server">
    <li class="breadcrumb-item">Home</li>
    <li class="breadcrumb-item active">Question</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMainContent" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <asp:Panel runat="server" ID="pnlStatus"></asp:Panel>
        </div>
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header">Survey Question</div>
                <div class="card-block">
                    <h3>View Survey Questions</h3>
                    <p class="text-muted">View list of questions to be used in surveys.</p>
                    
                    <a href="Create.aspx" class="btn btn-primary">Create Question</a>
                    
                    <asp:GridView runat="server" ID="gvQuestions" CssClass="table table-bordered" AutoGenerateColumns="False" EmptyDataText="There are currently no survey questions." ShowHeaderWhenEmpty="True" DataKeyNames="Id"
                        OnRowDataBound="gvQuestions_OnRowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="No.">
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Title" HeaderText="Question Title"/>
                            <asp:BoundField DataField="Description" HeaderText="Question Description"/>
                            <asp:TemplateField HeaderText="Question Type">
                                <ItemTemplate>
                                    <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="lnkEdit" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-primary" OnClick="lnkEdit_OnClick">Edit</asp:LinkButton>
                                    <asp:LinkButton runat="server" ID="lnkDelete" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-danger" OnClick="lnkDelete_OnClick">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

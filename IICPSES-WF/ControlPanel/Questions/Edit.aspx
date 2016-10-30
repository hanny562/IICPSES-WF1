<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="IICPSES_WF.ControlPanel.Questions.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBreadcrumb" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMainContent" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <asp:Panel runat="server" ID="pnlStatus"></asp:Panel>
        </div>
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header">Edit Survey Question</div>
                <div class="card-block">
                    <a href="Index.aspx" class="btn btn-outline-secondary">&laquo; Return to Question</a>

                    <div class="form-group">
                        <label>Question Title</label>
                        <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control" placeholder="Question title" />
                    </div>
                    
                    <div class="form-group">
                        <label>Question Description</label>
                        <asp:TextBox runat="server" ID="txtDescription" CssClass="form-control" placeholder="Question description" TextMode="MultiLine" />
                    </div>
                    
                    <div class="form-group">
                        <label>Question Type</label>
                        <asp:DropDownList runat="server" ID="ddlType" CssClass="form-control">
                            <asp:ListItem Text="Number" Value="1" />
                            <asp:ListItem Text="Plain Text" Value="2" />
                        </asp:DropDownList>
                    </div>
                    
                    <div class="form-group">
                        <asp:Button Text="Update" runat="server" CssClass="btn btn-primary" ID="btnEdit" OnClick="btnEdit_OnClick"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

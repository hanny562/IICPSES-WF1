<%@ Page Title="" Language="C#" MasterPageFile="~/Common.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="IICPSES_WF.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="server">
    <div class="row">
        <div class="offset-sm-3 col-sm-6 offset-sm-3">
            <asp:Panel runat="server" ID="pnlStatus"></asp:Panel>
        </div>
        <div class="offset-sm-3 col-sm-6 offset-sm-3">
            <div class="form-group">
                <h3>Enter secret code</h3>
                <p class="text-muted">Enter the secret code to start doing the survey. It is usually provided by the program officer.</p>
                <p class="text-muted"><strong>Note: </strong>Every survey has an expiration date. Please complete the survey before the expiration date.</p>
                <asp:TextBox runat="server" ID="txtSecretCode" CssClass="form-control" placeholder="Enter secret code" />
            </div>

            <div class="form-group">
                <asp:Button Text="&raquo; Begin" runat="server" ID="btnSubmit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
</asp:Content>

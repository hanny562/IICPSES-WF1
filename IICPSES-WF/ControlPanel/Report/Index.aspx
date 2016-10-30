<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="IICPSES_WF.ControlPanel.Report.Index" %>
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
                <div class="card-header">View Report</div>
                <div class="card-block">
                    <div class="form-group">
                        <label>Secret Code</label>
                        <asp:TextBox runat="server" ID="txtCode" placeholder="Survey secret code" required="required" />
                    </div>
                    
                    <div class="form-group">
                        <asp:Button Text="Submit" runat="server" ID="btnView" OnClick="btnView_OnClick" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

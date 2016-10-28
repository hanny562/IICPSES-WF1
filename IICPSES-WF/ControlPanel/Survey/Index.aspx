<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="IICPSES_WF.ControlPanel.Survey.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBreadcrumb" runat="server">
    <li class="breadcrumb-item">Home</li>
    <li class="breadcrumb-item active">Survey</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMainContent" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <asp:Panel runat="server" ID="pnlStatus"></asp:Panel>
        </div>

        <div class="col-sm-12">
            <div class="card">
                <div class="card-header">Survey</div>
                <div class="card-block">
                    <h3>View Survey</h3>
                    <p class="text-muted">View list of surveys, and view survey information individually.</p>
                    <asp:GridView runat="server" ID="gvSurveys" CssClass="table table-bordered" EmptyDataText="There are no survey profile at the moment."></asp:GridView>

                    <h3>Create Survey</h3>
                    <p class="text-muted">Create a survey.</p>
                    <div class="form-group">
                        <label>School Code</label>
                        <asp:TextBox runat="server" ID="txtSchoolCode" CssClass="form-control" placeholder="School code" />
                    </div>

                    <div class="form-group">
                        <label>School Name</label>
                        <asp:TextBox runat="server" ID="txtSchoolName" CssClass="form-control" placeholder="School name" />
                    </div>

                    <div class="form-group">
                        <label>Program Code</label>
                        <asp:TextBox runat="server" ID="txtProgramCode" CssClass="form-control" placeholder="Program code" />
                    </div>

                    <div class="form-group">
                        <label>Program Name</label>
                        <asp:TextBox runat="server" ID="txtProgramName" CssClass="form-control" placeholder="Program name" />
                    </div>

                    <div class="form-group">
                        <label>Subject Code</label>
                        <asp:TextBox runat="server" ID="txtSubjectCode" CssClass="form-control" placeholder="Subject code" />
                    </div>

                    <div class="form-group">
                        <label>Subject Name</label>
                        <asp:TextBox runat="server" ID="txtSubjectName" CssClass="form-control" placeholder="Subject name" />
                    </div>

                    <div class="form-group">
                        <label>Lecturer Name</label>
                        <asp:TextBox runat="server" ID="txtLecturerName" CssClass="form-control" placeholder="Lecturer name" />
                    </div>

                    <div class="form-group">
                        <asp:Button Text="Submit" runat="server" ID="btnSubmit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    
</asp:Content>

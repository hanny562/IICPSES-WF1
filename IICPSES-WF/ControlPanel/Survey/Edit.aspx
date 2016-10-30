<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="IICPSES_WF.ControlPanel.Survey.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBreadcrumb" runat="server">
    <li class="breadcrumb-item">Home</li>
    <li class="breadcrumb-item">Survey</li>
    <li class="breadcrumb-item active">Edit Profile</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMainContent" runat="server">
    <div class="row">
        <div class="col sm-12">
            <asp:Panel runat="server" ID="pnlStatus"></asp:Panel>
        </div>
        <div class="col sm-12">
            <div class="card">
                <div class="card-header">Edit Survey Profile<strong>
                    <asp:Label runat="server" ID="lblSurveySecret" /></strong></div>
                <div class="card-block">
                    <div class="form-group">
                        <label>Secret Code</label>
                        <p>
                            <asp:Label ID="lblSecretCodeText" runat="server" Font-Bold="true" /></p>
                    </div>
                    <div class="form-group">
                        <label>Semester Profile</label>
                        <p>
                            <asp:Label ID="lblSemesterName" runat="server" Font-Bold="true" /></p>
                    </div>
                    <div class="form-group">
                        <label>Created Timestamp</label>
                        <p>
                            <asp:Label ID="lblCreatedDateTime" runat="server" Font-Bold="true" /></p>
                    </div>
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
                        <asp:Button Text="Update" runat="server" ID="btnUpdate" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                        <asp:Button Text="Cancel" runat="server" ID="btnCancel" CssClass="btn btn-secondary" PostBackUrl="~/ControlPanel/Survey/Index.aspx" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

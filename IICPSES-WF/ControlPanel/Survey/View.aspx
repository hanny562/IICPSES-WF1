<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="IICPSES_WF.ControlPanel.Survey.View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBreadcrumb" runat="server">
    <li class="breadcrumb-item">Home</li>
    <li class="breadcrumb-item">Survey</li>
    <li class="breadcrumb-item active">View Profile</li>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMainContent" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <asp:Panel runat="server" ID="pnlStatus"></asp:Panel>
        </div>
        <div class="col-sm-12">
            <div class="card">
                <div class="card-header">View Survey Profile - <strong>
                    <asp:Label runat="server" ID="lblSurveySecret" /></strong></div>
                <div class="card-block">
                    <a href="Index.aspx" class="btn btn-secondary">&laquo; Return to Survey</a>
                    <p class="text-muted">Showing information for this profile. You may choose to either edit or delete this profile.</p>
                    <table class="table">
                        <tr>
                            <td>Survey Status</td>
                            <td>
                                <div class="col-sm-1">
                                    <asp:Label runat="server" ID="lblStatus" Font-Bold="true" /></div>
                                <div class="col-sm-3">
                                    <asp:DropDownList runat="server" ID="ddlStatus" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                                        <asp:ListItem Value="" Text="--- Please choose one ---"></asp:ListItem>
                                        <asp:ListItem Value="1" Text="Active"></asp:ListItem>
                                        <asp:ListItem Value="0" Text="Expired"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>ID</td>
                            <td>
                                <asp:Label ID="lblID" runat="server" Font-Bold="true" /></td>
                        </tr>
                        <tr>
                            <td>Semester Name</td>
                            <td>
                                <asp:Label ID="lblSemesterName" runat="server" Font-Bold="true" /></td>
                        </tr>
                        <tr>
                            <td>School Code</td>
                            <td>
                                <asp:Label ID="lblSchoolCode" runat="server" Font-Bold="true" /></td>
                        </tr>
                        <tr>
                            <td>School Name</td>
                            <td>
                                <asp:Label ID="lblSchoolName" runat="server" Font-Bold="true" /></td>
                        </tr>
                        <tr>
                            <td>Program Code</td>
                            <td>
                                <asp:Label ID="lblProgramCode" runat="server" Font-Bold="true" /></td>
                        </tr>
                        <tr>
                            <td>Program Name</td>
                            <td>
                                <asp:Label ID="lblProgramName" runat="server" Font-Bold="true" /></td>
                        </tr>
                        <tr>
                            <td>Subject Code</td>
                            <td>
                                <asp:Label ID="lblSubjectCode" runat="server" Font-Bold="true" /></td>
                        </tr>
                        <tr>
                            <td>Subject Name</td>
                            <td>
                                <asp:Label ID="lblSubjectName" runat="server" Font-Bold="true" /></td>
                        </tr>
                        <tr>
                            <td>Lecturer Name</td>
                            <td>
                                <asp:Label ID="lblLecturerName" runat="server" Font-Bold="true" /></td>
                        </tr>
                        <tr>
                            <td>Secret Code Text</td>
                            <td>
                                <asp:Label ID="lblSecretCodeText" runat="server" Font-Bold="true" /></td>
                        </tr>
                        <tr>
                            <td>Created Timestamp</td>
                            <td>
                                <asp:Label ID="lblCreatedDate" runat="server" Font-Bold="true" /></td>
                        </tr>

                    </table>

                    <a href="Edit.aspx?code=<%= lblSecretCodeText.Text %>" class="btn btn-success">Edit Profile</a>
                    <asp:Button Text="Delete Profile" runat="server" ID="btnDelete" CssClass="btn btn-danger" OnClientClick="return confirm('Confirm deleting this profile? This action is irreversible!')" OnClick="btnDelete_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

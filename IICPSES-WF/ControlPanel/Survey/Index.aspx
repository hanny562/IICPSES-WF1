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
                    <p class="text-muted">Click on each <strong>secret code</strong> to view its information in detail.</p>

                    <asp:GridView runat="server" ID="gvSurveys" CssClass="table table-bordered" EmptyDataText="There are no survey profile at the moment." AutoGenerateColumns="false"
                        OnRowDataBound="gvSurveys_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="No." >
                                <ItemTemplate>
                                    <%# Container.DataItemIndex + 1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="SemesterName" HeaderText="Semester Name"></asp:BoundField>
                            <asp:TemplateField HeaderText="Secret Code">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkViewProfile" runat="server" Text='<%# Bind("SecretCodeText") %>' CommandArgument='<%# Bind("SecretCodeText") %>' OnClick="lnkViewProfile_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="SchoolCode" HeaderText="School Code" />
                            <asp:BoundField DataField="ProgramCode" HeaderText="Program Code" />
                            <asp:BoundField DataField="SubjectCode" HeaderText="Subject Code" />
                            <asp:BoundField DataField="LecturerName" HeaderText="Lecturer Name" />
                            <asp:TemplateField HeaderText="Survey Created Timestamp">
                                <ItemTemplate>
                                    <asp:Label ID="lblTimestamp" runat="server" Text='<%# Bind("CreatedDateTime") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Survey Active Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("IsExpired") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <a href="Create.aspx" class="btn btn-primary">Create Profile Survey</a>
                    
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document)
            .ready(function() {
                $("#<%= gvSurveys.ClientID %>").DataTable();
            });
    </script>
</asp:Content>

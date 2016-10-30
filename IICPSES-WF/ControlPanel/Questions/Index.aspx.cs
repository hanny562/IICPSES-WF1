using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IICPSES_WF.ControlPanel.Questions
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    BindGridView_Questions();
                }
                catch (Exception ex)
                {
                    PrintMessage("Exception occurred while attempting to populate questions!", ex.Message, "alert alert-danger alert-dismissable fade in");
                }
            }
        }

        private void BindGridView_Questions()
        {
            string sql = "select * from [dbo].[Question]";
            using (var conn = new SqlConnection(Shared.GetConnectionString()))
            {
                conn.Open();

                using (var cmd = new SqlCommand(sql, conn))
                {
                    gvQuestions.DataSource = cmd.ExecuteReader();
                    gvQuestions.DataBind();
                }
            }
        }

        protected void gvQuestions_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                var type = e.Row.FindControl("lblType") as Label;

                switch (type.Text)
                {
                    case "1":
                        type.Text = "Number";
                        break;

                    case "2":
                        type.Text = "Plain Text";
                        break;
                }
            }

        }

        private void PrintMessage(string title, string msg, string css)
        {
            pnlStatus.Controls.Add(new LiteralControl(
                "<div class='" + css + "' role='alert'> " +
                "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>" +
                "<strong>" + title + "</strong><p>" + msg + "</p>" +
                "</div>"));
        }

        protected void lnkEdit_OnClick(object sender, EventArgs e)
        {
            var lnk = sender as LinkButton;
            Response.Redirect("Edit.aspx?qid=" + lnk.CommandArgument);
        }

        protected void lnkDelete_OnClick(object sender, EventArgs e)
        {
            var lnk = sender as LinkButton;
            Response.Redirect("Delete.aspx?qid=" + lnk.CommandArgument);
        }
    }
}
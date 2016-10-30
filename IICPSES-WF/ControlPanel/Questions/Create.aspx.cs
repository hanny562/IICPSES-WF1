using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IICPSES_WF.ControlPanel.Questions
{
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTitle.Text) || string.IsNullOrWhiteSpace(txtDescription.Text) ||
                string.IsNullOrWhiteSpace(ddlType.SelectedValue))
            {


                PrintMessage("Please fill in all the details.",
                    "All details must be filled to complete creating the question.",
                    "alert alert-warning alert-dismissable fade in");
                return;
            }

            try
            {
                CreateQuestion(txtTitle.Text, txtDescription.Text, Convert.ToInt32(ddlType.SelectedValue));
                Response.Redirect("Index.aspx");
            }
            catch (Exception ex)
            {
                PrintMessage("Exception occurred while attempting to create a question!", ex.Message, "alert alert-danger alert-dismissable fade in");
            }

        }

        private void CreateQuestion(string title, string description, int questionType)
        {
            string sql = "insert into [dbo].[Question] values (@t, @d, @qt)";
            using (var conn = new SqlConnection(Shared.GetConnectionString()))
            {
                conn.Open();

                using (var cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@t", title);
                    cmd.Parameters.AddWithValue("@d", description);
                    cmd.Parameters.AddWithValue("@qt", questionType);

                    cmd.ExecuteNonQuery();

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
    }
}
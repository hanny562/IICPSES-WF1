using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IICPSES_WF.ControlPanel.Questions
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["qid"] != null)
                {
                    try
                    {
                        BindData(Convert.ToInt32(Request.QueryString["qid"]));
                    }
                    catch (Exception ex)
                    {
                        PrintMessage("Exception occurred while attempting to load the question!", ex.Message,
                            "alert alert-danger alert-dismissable fade in");
                    }
                }
                else
                {
                    PrintMessage("Question not found.", "Question ID was not supplied. Please ensure that this page is loaded correctly, and try again.", "alert alert-warning alert-dismissable fade in");
                }
            }
        }

        private void BindData(int id)
        {
            string sql = "select * from [dbo].[Question] where Id=@id";
            using (var conn = new SqlConnection(Shared.GetConnectionString()))
            {
                conn.Open();

                using (var cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);

                    using (var rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            txtTitle.Text = rdr["Title"].ToString();
                            txtDescription.Text = rdr["Description"].ToString();
                        }
                        else
                        {
                            PrintMessage("Question not found.",
                                "No question found for the supplied ID. Please ensure the page is loaded correctly, and try again.",
                                "alert alert-warning alert-dismissable fade in");
                        }
                    }
                }
            }
        }

        protected void btnEdit_OnClick(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTitle.Text) || string.IsNullOrWhiteSpace(txtDescription.Text))
            {
                PrintMessage("Please fill in all the details.",
                    "All details must be filled in order to update the question.",
                    "alert alert-warning alert-dismissable fade in");
                return;
            }

            try
            {
                UpdateQuestion(txtTitle.Text, txtDescription.Text, Convert.ToInt32(Request.QueryString["qid"]));
                Response.Redirect("Index.aspx");
            }
            catch (Exception ex)
            {
                PrintMessage("Exception occurred while attempting to update the question!", ex.Message, "alert alert-danger alert-dismissable fade in");
            }
        }

        private void UpdateQuestion(string title, string description, int id)
        {
            string sql = "update [dbo].[Question] set Title=@t, Description=@d where Id=@id";

            using (var conn = new SqlConnection(Shared.GetConnectionString()))
            {
                conn.Open();

                using (var cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@t", title);
                    cmd.Parameters.AddWithValue("@d", description);
                    cmd.Parameters.AddWithValue("@id", id);

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
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IICPSES_WF
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(string.IsNullOrWhiteSpace(txtSecretCode.Text))
            {
                PrintMessage("Please fill in all details.", "You must enter the survey secret code in order to proceed.", "alert alert-warning alert-dismissable fade in");
                return;
            }

            try
            {
                ReadCode(txtSecretCode.Text);
            }
            catch(Exception ex)
            {
                PrintMessage("Exception occurred while attempting to load the survey!", ex.Message, "alert alert-danger alert-dismissable fade in");
            }
        }

        private void ReadCode(string code)
        {
            string sql = "select * from [dbo].[SurveyProfile] where SecretCodeText=@code";
            bool isExpired = false;

            using (var conn = new SqlConnection(Shared.GetConnectionString()))
            {
                conn.Open();

                using (var cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@code", code);

                    using (var rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                             isExpired = Convert.ToBoolean(rdr["IsExpired"]);
                        }
                        else
                        {
                            PrintMessage("Incorrect survey secret code.", "The secret code entered was invalid. Please check whether the given code is correct, and try again.", "alert alert-warning alert-dismissable fade in");
                            return;
                        }
                    }
                }
            }

            if(isExpired)
            {
                PrintMessage("Survey is expired.", "The survey with this secret code was already expired.", "alert alert-warning alert-dismissable fade in");
                return;
            }
            else
            {
                Session["ssCode"] = code;
                Response.Redirect("~/Survey/Index.aspx");
            }
        }

        private bool IsExpired(string code)
        {
            string sql = "select IsExpired from [dbo].[SurveyProfile] where SecretCodeText=@code";
            using (var conn = new SqlConnection(Shared.GetConnectionString()))
            {
                conn.Open();

                using (var cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@code", code);

                    using (var rdr = cmd.ExecuteReader())
                    {
                        if(rdr.Read())
                        {
                            return Convert.ToBoolean(rdr[0]);
                        }
                    }
                }
            }
            return false;
        }

        private void PrintMessage(string strongMsg, string msg, string css)
        {
            pnlStatus.Controls.Add(new LiteralControl(
                "<div class='" + css + "' role='alert'> " +
                "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>" +
                "<strong>" + strongMsg + "</strong><p>" + msg + "</p>" +
                "</div>"));
        }
    }
}
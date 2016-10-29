using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IICPSES_WF.ControlPanel.Survey
{
    public partial class View : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Request.QueryString["code"] != null)
                {
                    try
                    {
                        BindTable(Request.QueryString["code"]);
                    }
                    catch(Exception ex)
                    {
                        PrintMessage("Exception occurred while attempting to load information!", ex.Message, "alert alert-danger alert-dismissable fade in");
                    }
                }
                else
                {
                    PrintMessage("Unable to load information.", "Please ensure that you entered this page correctly, and try again.", "alert alert-warning alert-dismissable fade in");
                }
            }
        }

        private void BindTable(string code)
        {
            string sql = "select * from [dbo].[SurveyProfile] where SecretCodeText = @code";
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
                            lblSurveySecret.Text = rdr["SecretCodeText"].ToString();
                            lblSecretCodeText.Text = rdr["SecretCodeText"].ToString();
                            lblCreatedDate.Text = rdr["CreatedDateTime"].ToString();
                            lblID.Text = rdr["Id"].ToString();
                            lblLecturerName.Text = rdr["LecturerName"].ToString();
                            lblProgramCode.Text = rdr["ProgramCode"].ToString();
                            lblProgramName.Text = rdr["ProgramName"].ToString();
                            lblSchoolCode.Text = rdr["SchoolCode"].ToString();
                            lblSchoolName.Text = rdr["SchoolName"].ToString();
                            lblSubjectCode.Text = rdr["SubjectCode"].ToString();
                            lblSubjectName.Text = rdr["SubjectName"].ToString();
                        }
                    }
                }
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                DeleteSurveyProfile(lblSecretCodeText.Text);
                Response.Redirect("Index.aspx");

            }
            catch(Exception ex)
            {
                PrintMessage("Exception occurred while attempting to delete this survey profile!", ex.Message, "alert alert-danger alert-dismissable fade in");
            }
        }

        private void DeleteSurveyProfile(string code)
        {
            string sql = "delete from [dbo].[SurveyProfile] where SecretCodeText=@code";
            using (var conn = new SqlConnection(Shared.GetConnectionString()))
            {
                conn.Open();

                using (var cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@code", code);

                    cmd.ExecuteNonQuery();
                }
            }
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
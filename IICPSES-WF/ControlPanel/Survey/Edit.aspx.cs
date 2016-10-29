using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IICPSES_WF.ControlPanel.Survey
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Request.QueryString["code"] != null)
                {
                    try
                    {
                        BindInput(Request.QueryString["code"]);
                    }
                    catch(Exception ex)
                    {
                        PrintMessage("Exception occurred while loading the information!", ex.Message, "alert alert-danger alert-dismissable fade in");
                    }
                }
                else
                {
                    PrintMessage("Unable to load information.", "Please ensure the page is loaded correctly, and try again.", "alert alert-warning alert-dismissable fade in");
                }
            }
        }

        private void BindInput(string code)
        {
            string sql = "select * from [dbo].[SurveyProfile] where SecretCodeText=@code";
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
                            txtLecturerName.Text = rdr["LecturerName"].ToString();
                            txtProgramCode.Text = rdr["ProgramCode"].ToString();
                            txtProgramName.Text = rdr["ProgramName"].ToString();
                            txtSchoolCode.Text = rdr["SchoolCode"].ToString();
                            txtSchoolName.Text = rdr["SchoolName"].ToString();
                            txtSubjectCode.Text = rdr["SubjectCode"].ToString();
                            txtSubjectName.Text = rdr["SubjectName"].ToString();
                            lblSecretCodeText.Text = rdr["SecretCodeText"].ToString();
                            lblCreatedDateTime.Text = rdr["CreatedDateTime"].ToString();
                        }
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                Update(txtSchoolCode.Text, txtSchoolName.Text, txtProgramCode.Text, txtProgramName.Text, txtSubjectCode.Text, txtSubjectName.Text, txtLecturerName.Text);
                Response.Redirect("Index.aspx");
            }
            catch(Exception ex)
            {
                PrintMessage("Exception occurred while attempting to update information!", ex.Message, "alert alert-danger alert-dismissable fade in");
            }
        }

        private void Update(string schoolCode, string schoolName, string programCode, string programName, string subjectCode, string subjectName, string lecturerName)
        {
            string sql = "update [dbo].[SurveyProfile] set SchoolCode = @sccode, SchoolName = @scname, ProgramCode = @pccode, ProgramName = @pcname, SubjectCode = @sbcode, SubjectName = @sbname, LecturerName = @lcname";
            using (var conn = new SqlConnection(Shared.GetConnectionString()))
            {
                conn.Open();

                using (var cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@sccode", schoolCode);
                    cmd.Parameters.AddWithValue("@scname", schoolName);
                    cmd.Parameters.AddWithValue("@pccode", programCode);
                    cmd.Parameters.AddWithValue("@pcname", programName);
                    cmd.Parameters.AddWithValue("@sbcode", subjectCode);
                    cmd.Parameters.AddWithValue("@sbname", subjectName);
                    cmd.Parameters.AddWithValue("@lcname", lecturerName);

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
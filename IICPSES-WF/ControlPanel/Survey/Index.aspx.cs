using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IICPSES_WF.ControlPanel.Survey
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindGridView_Surveys();
            }
        }

        private void BindGridView_Surveys()
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtLecturerName.Text) || string.IsNullOrWhiteSpace(txtProgramCode.Text) || string.IsNullOrWhiteSpace(txtProgramName.Text) || string.IsNullOrWhiteSpace(txtSchoolCode.Text) || string.IsNullOrWhiteSpace(txtSchoolName.Text) || string.IsNullOrWhiteSpace(txtSubjectCode.Text) || string.IsNullOrWhiteSpace(txtSubjectName.Text))
                {
                    PrintMessage("All fields must be filled.", "Please fill in all the details.", "alert alert-warning alert-dismissable fade in");
                    return;
                }

                string secretCode = GenerateSecretCode();
                SubmitSurvey(txtSchoolCode.Text, txtSchoolName.Text, txtProgramCode.Text, txtProgramName.Text, txtSubjectCode.Text, txtSubjectName.Text, txtLecturerName.Text, secretCode);
            }
            catch(Exception ex)
            {
                PrintMessage("Exception occurred!", ex.Message, "alert alert-danger alert-dismissable fade in");
            }
        }

        // Submit survey
        private void SubmitSurvey(string schoolCode, string schoolName, string programCode, string programName, string subjectCode, string subjectName, string lecturerName, string secretCodeText)
        {
            string sql = "insert into [dbo].[SurveyProfile] values (@sccode, @scname, @prcode, @prname, @sbcode, @sbname, @lcname, @secret)";
            
            using (var conn = new SqlConnection(Shared.GetConnectionString()))
            {
                conn.Open();

                using (var cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@sccode", schoolCode);
                    cmd.Parameters.AddWithValue("@scname", schoolName);
                    cmd.Parameters.AddWithValue("@prcode", programCode);
                    cmd.Parameters.AddWithValue("@prname", programName);
                    cmd.Parameters.AddWithValue("@sbcode", subjectCode);
                    cmd.Parameters.AddWithValue("@sbname", subjectName);
                    cmd.Parameters.AddWithValue("@lcname", lecturerName);
                    cmd.Parameters.AddWithValue("@secret", secretCodeText);

                    cmd.ExecuteNonQuery();
                }
            }

            PrintMessage("Survey successfully created.", "Survey was successfully created with secret code: <strong>" + secretCodeText + "</strong>.", "alert alert-success alert-dismissible fade in");
        }

        // Helper function
        private string GenerateSecretCode()
        {
            // source: http://stackoverflow.com/questions/1344221/how-can-i-generate-random-alphanumeric-strings-in-c
            var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var stringChars = new char[8];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            return new String(stringChars);
        }

        private void PrintMessage(string strongMsg, string msg, string css)
        {
            pnlStatus.Controls.Add(new LiteralControl(
                "<div class='"+css+"' role='alert'> " +
                "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>" +
                "<strong>"+strongMsg+"</strong><p>"+msg+"</p>" +
                "</div>"));
        }
    }
}
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
            try
            {
                string sql = "select * from [dbo].[SurveyProfile]";
                using (var conn = new SqlConnection(Shared.GetConnectionString()))
                {
                    conn.Open();

                    using (var cmd = new SqlCommand(sql, conn))
                    {
                        gvSurveys.DataSource = cmd.ExecuteReader();
                        gvSurveys.DataBind();

                        gvSurveys.HeaderRow.TableSection = TableRowSection.TableHeader;
                    }
                }

            }
            catch(Exception ex)
            {
                PrintMessage("Exception occurred while displaying the survey profile information!", ex.Message, "alert alert-danger alert-dismissable fade in");
            }
        }

        private void PrintMessage(string strongMsg, string msg, string css)
        {
            pnlStatus.Controls.Add(new LiteralControl(
                "<div class='"+css+"' role='alert'> " +
                "<button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'>&times;</span></button>" +
                "<strong>"+strongMsg+"</strong><p>"+msg+"</p>" +
                "</div>"));
        }

        protected void lnkViewProfile_Click(object sender, EventArgs e)
        {
            var lnk = sender as LinkButton;
            var secret = lnk.CommandArgument;

            Response.Redirect("View.aspx?code=" + secret);
        }

        protected void gvSurveys_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
                var lbl = e.Row.FindControl("lblStatus") as Label;

                switch(lbl.Text)
                {
                    case "False":
                        lbl.Text = "Active";
                        lbl.CssClass = "text-success";
                        break;

                    case "True":
                        lbl.Text = "Expired";
                        lbl.CssClass = "text-danger";
                        break;
                }
            }
        }
    }
}
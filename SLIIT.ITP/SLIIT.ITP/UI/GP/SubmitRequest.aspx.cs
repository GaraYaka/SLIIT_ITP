using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net;
using System.Net.Mail;

namespace SLIIT.ITP.UI.GP
{
    public partial class SubmitRequest : SLLITPage
    {







        private void getmanager(string pcid)
        {
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection("Data Source=DESKTOP-RL5S95E;Initial Catalog=SLIIT.ITP;Integrated Security=True");
            connection.Open();
            SqlCommand sqlCmd = new SqlCommand("SELECT manager_email FROM  TB_MANAGER  WHERE manager_name = '" + Label7.Text.Trim() + "'", connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);

            sqlCmd.Parameters.AddWithValue("@manager_id", pcid);
            sqlDa.Fill(dt);
            if (dt.Rows.Count > 0)
            {


                // Label7.Text = dt.Rows[0]["pcid"].ToString();
                txt_to.Text = dt.Rows[0]["manager_email"].ToString();
            }
            connection.Close();
        }
















        private void getData(string pcid)
        {
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection("Data Source=DESKTOP-RL5S95E;Initial Catalog=SLIIT.ITP;Integrated Security=True");
            connection.Open();
            SqlCommand sqlCmd = new SqlCommand("SELECT * FROM  TB_GATEPASS WHERE GP_ID = (SELECT MAX(GP_ID)  FROM TB_GATEPASS)", connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);

            sqlCmd.Parameters.AddWithValue("@GP_ID", pcid);
            sqlDa.Fill(dt);
            if (dt.Rows.Count > 0)
            {


                Label1.Text = dt.Rows[0]["GP_ID"].ToString();
                Label2.Text = dt.Rows[0]["GP_COMNAME"].ToString();
                Label3.Text = dt.Rows[0]["GP_ADDRESS"].ToString();
                Label4.Text = dt.Rows[0]["GP_TP"].ToString();
                Label5.Text = dt.Rows[0]["GP_MAIL"].ToString();
                Label6.Text = dt.Rows[0]["GP_REASON"].ToString();
                Label7.Text = dt.Rows[0]["GP_APPROVE"].ToString();
                Label8.Text = dt.Rows[0]["GP_AREAS"].ToString();
                Label9.Text = dt.Rows[0]["GP_DATE"].ToString();
                Label10.Text = dt.Rows[0]["GP_TIMEFRM"].ToString();
                Label11.Text = dt.Rows[0]["GP_TIMETO"].ToString();
                Label12.Text = dt.Rows[0]["GP_NAME"].ToString();
                Label13.Text = dt.Rows[0]["GP_NIC"].ToString();
                Label14.Text = dt.Rows[0]["GP_STATUS"].ToString();
              


            }
            connection.Close();
        }







        protected void Page_Load(object sender, EventArgs e)
        {
            SetPageTitle = "Gate Pass Request";
            SetPageSubTitle = string.Empty;

            txt_mymail.Text = "sachithramadawa92@gmail.com";
            txt_pawrd.Text = "gs210520";
            txt_sub.Text = "New Gate Pass Request";
            txt_msg.Text = "new";

            if (!Page.IsPostBack)
            {
                getData(this.User.Identity.Name);
            }


            if (!Page.IsPostBack)
            {
                getmanager(this.User.Identity.Name);
            } 


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string body = "From :" + txt_mymail + "\n";
            body += "Subject : " + txt_sub + "\n";
            body += "Message : Pleas use following link to approve below gate pass  http://localhost:42571/UI/GP/edit " + txt_msg + "\n";
            var smtp = new System.Net.Mail.SmtpClient();

            {

                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(txt_mymail.Text, txt_pawrd.Text);
                smtp.Timeout = 20000;


            }


            smtp.Send(txt_mymail.Text, txt_to.Text, txt_sub.Text, body);

        }

        protected void txt_sub_TextChanged(object sender, EventArgs e)
        {

        }

       
        }
    }

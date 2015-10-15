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



namespace SLIIT.ITP.UI.PC
{
    public partial class printReciept : SLLITPage
    {



        private void getData(string pcid)
        {
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection("Data Source=DESKTOP-RL5S95E;Initial Catalog=SLIIT.ITP;Integrated Security=True");
            connection.Open();
            SqlCommand sqlCmd = new SqlCommand("SELECT * FROM  TB_PC1 WHERE pcid = (SELECT MAX(pcid)  FROM TB_PC1)", connection);
            SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);

            sqlCmd.Parameters.AddWithValue("@pcid", pcid);
            sqlDa.Fill(dt);
            if (dt.Rows.Count > 0)
            {


               // Label7.Text = dt.Rows[0]["pcid"].ToString();
                Label1.Text = dt.Rows[0]["date"].ToString();
                Label2.Text = dt.Rows[0]["supplier"].ToString();
                Label3.Text = dt.Rows[0]["des"].ToString();
                Label4.Text = dt.Rows[0]["cc"].ToString();
                Label5.Text = dt.Rows[0]["amount"].ToString() + ".00 LKR";
                Label6.Text = dt.Rows[0]["approve"].ToString();
                Label7.Text = dt.Rows[0]["req"].ToString();
                txt_msg.Text = dt.Rows[0]["date"].ToString() + "  PC-ID : " + dt.Rows[0]["pcid"].ToString() + "  Supplier : " + dt.Rows[0]["supplier"].ToString() + "  Description : " + dt.Rows[0]["des"].ToString() + "  Cost Centre : " + dt.Rows[0]["cc"].ToString() + "  Amount : " + dt.Rows[0]["amount"].ToString() + "  Please Refer following link to see this entry http://localhost:42571/UI/PC/printReciept : ";

                //txt_email.Text = "sachithramadawa92@gmail.com";
                txt_pass.Text = "gs210520";
                txt_sub.Text = "Petty cash Entry  ----   " + dt.Rows[0]["pcid"].ToString();
                txt_email.Text = "sachithramadawa92@gmail.com";


            }
            connection.Close();
        }



        private void getData2(string pcid)
        {
            DataTable dt = new DataTable();
            SqlConnection connection = new SqlConnection("Data Source=DESKTOP-RL5S95E;Initial Catalog=SLIIT.ITP;Integrated Security=True");
            connection.Open();
            SqlCommand sqlCmd = new SqlCommand("SELECT manager_email FROM  TB_MANAGER  WHERE manager_name = '" + Label6.Text.Trim() + "'", connection);
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







        protected void Page_Load(object sender, EventArgs e)
        {

            SetPageTitle = "Printing Reciepts";
            SetPageSubTitle = string.Empty;





            if (!Page.IsPostBack)
            {
                getData(this.User.Identity.Name);
            }


            if (!Page.IsPostBack)
            {
                getData2(this.User.Identity.Name);
            } 







        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            
            string body = "From :" + txt_email.Text + "\n";
            body += "Subject :" + txt_sub.Text + "\n";
            body += "Message :" + txt_msg.Text + "\n";
            var smtp = new System.Net.Mail.SmtpClient();
            {

                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                smtp.Credentials = new NetworkCredential(txt_email.Text, txt_pass.Text);
                smtp.Timeout = 20000;

            }


            smtp.Send(txt_email.Text, txt_to.Text, txt_sub.Text, body);

        }
    }
}
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
    public partial class edit : System.Web.UI.Page
    {





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
            if (!Page.IsPostBack)
            {
                getData(this.User.Identity.Name);
            } 

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection vid = new SqlConnection("Data Source=DESKTOP-RL5S95E;Initial Catalog=SLIIT.ITP;Integrated Security=True");
            SqlCommand xp = new SqlCommand("UPDATE TB_GATEPASS SET GP_STATUS = @status where GP_ID = '"+Label1.Text.Trim()+"'" , vid);
        
            xp.Parameters.AddWithValue("@status", DropDownList1.SelectedItem.Text);




            vid.Open();
            xp.ExecuteNonQuery();
            vid.Close();

        }
    }
}
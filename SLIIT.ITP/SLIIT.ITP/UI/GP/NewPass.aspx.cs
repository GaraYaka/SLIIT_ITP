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
    public partial class NewPass : SLLITPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SetPageTitle = "Gate Pass Request";
            SetPageSubTitle = string.Empty;




            if (!IsPostBack)
            {

                SqlConnection con = new SqlConnection("Data Source=DESKTOP-RL5S95E;Initial Catalog=SLIIT.ITP;Integrated Security=True");

                SqlCommand cmd = new SqlCommand("select manager_id, manager_name from TB_MANAGER", con);
                con.Open();
                DropDownList1.DataSource = cmd.ExecuteReader();
                DropDownList1.DataTextField = "manager_name";
                DropDownList1.DataValueField = "manager_id";
                DropDownList1.DataBind();


            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection vid = new SqlConnection("Data Source=DESKTOP-RL5S95E;Initial Catalog=SLIIT.ITP;Integrated Security=True");
            SqlCommand xp = new SqlCommand("Insert into TB_GATEPASS(GP_COMNAME, GP_ADDRESS, GP_TP, GP_MAIL, GP_REASON, GP_APPROVE, GP_AREAS, GP_DATE, GP_TIMEFRM, GP_TIMETO, GP_NAME, GP_NIC, GP_STATUS) values(@comname, @address, @tp, @email, @reason, @approve, @areas, @date, @timefrom, @timeto, @name, @nic, @status)", vid);
            xp.Parameters.AddWithValue("@comname", txt_com.Text);
            xp.Parameters.AddWithValue("@address", txt_addr.Text);
            xp.Parameters.AddWithValue("@tp", txt_tp.Text);
            xp.Parameters.AddWithValue("@email", txtmail.Text);
            xp.Parameters.AddWithValue("@reason", txt_reason.Text);
            xp.Parameters.AddWithValue("@approve", DropDownList1.SelectedItem.Text);
            xp.Parameters.AddWithValue("@areas", DropDownList2.SelectedItem.Text);
            xp.Parameters.AddWithValue("@date", txt_date.Text);
            //xp.Parameters.AddWithValue("@reason", txt_reason.Text);
            xp.Parameters.AddWithValue("@timefrom", txt_from.Text);
            xp.Parameters.AddWithValue("@timeto", txt_timeto.Text);
            xp.Parameters.AddWithValue("@name", txt_name.Text);
            xp.Parameters.AddWithValue("@nic", txt_nic.Text);
            xp.Parameters.AddWithValue("@status", DropDown_status.SelectedItem.Text);
            
            



            vid.Open();
            xp.ExecuteNonQuery();
            vid.Close();


          
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            SqlConnection vid = new SqlConnection("Data Source=DESKTOP-RL5S95E;Initial Catalog=SLIIT.ITP;Integrated Security=True");
            SqlCommand xp = new SqlCommand("Insert into TB_GATEPASS(GP_COMNAME, GP_ADDRESS, GP_TP, GP_MAIL, GP_REASON, GP_APPROVE, GP_AREAS, GP_DATE, GP_TIMEFRM, GP_TIMETO, GP_NAME, GP_NIC, GP_STATUS) values(@comname, @address, @tp, @email, @reason, @approve, @areas, @date, @timefrom, @timeto, @name, @nic, @status)", vid);
            xp.Parameters.AddWithValue("@comname", txt_com.Text);
            xp.Parameters.AddWithValue("@address", txt_addr.Text);
            xp.Parameters.AddWithValue("@tp", txt_tp.Text);
            xp.Parameters.AddWithValue("@email", txtmail.Text);
            xp.Parameters.AddWithValue("@reason", txt_reason.Text);
            xp.Parameters.AddWithValue("@approve", DropDownList1.SelectedItem.Text);
            xp.Parameters.AddWithValue("@areas", DropDownList2.SelectedItem.Text);
            xp.Parameters.AddWithValue("@date", txt_date.Text);
            //xp.Parameters.AddWithValue("@reason", txt_reason.Text);
            xp.Parameters.AddWithValue("@timefrom", txt_from.Text);
            xp.Parameters.AddWithValue("@timeto", txt_timeto.Text);
            xp.Parameters.AddWithValue("@name", txt_name.Text);
            xp.Parameters.AddWithValue("@nic", txt_nic.Text);
            xp.Parameters.AddWithValue("@status", DropDown_status.SelectedItem.Text);





            vid.Open();
            xp.ExecuteNonQuery();
            vid.Close();

            Response.Redirect("http://localhost:42571/UI/GP/SubmitRequest");


        }
    }
}
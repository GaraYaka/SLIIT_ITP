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
    public partial class Search : SLLITPage
    {
        SqlConnection vid2 = new SqlConnection("Data Source=DESKTOP-RL5S95E;Initial Catalog=SLIIT.ITP;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            SetPageTitle = "Search Entries";
            SetPageSubTitle = string.Empty;


            if (!IsPostBack)
            {

                SqlConnection con = new SqlConnection("Data Source=DESKTOP-RL5S95E;Initial Catalog=SLIIT.ITP;Integrated Security=True");

                SqlCommand cmd = new SqlCommand("select Sup_ID, Sup_name from TB_Supplier", con);
                con.Open();
                DropDownList1.DataSource = cmd.ExecuteReader();
                DropDownList1.DataTextField = "Sup_name";
                DropDownList1.DataValueField = "Sup_ID";
                DropDownList1.DataBind();



                //SqlConnection con2 = new SqlConnection("Data Source=SACHITHRA;Initial Catalog=SLIIT.ITP;Integrated Security=True");

                //SqlCommand cmd2 = new SqlCommand("select RnAttendUserID, LastName from TB_HR_AttendUser", con2);
                //con2.Open();
                //DropDownList2.DataSource = cmd.ExecuteReader();
                //DropDownList2.DataTextField = "LastName";
                //DropDownList2.DataValueField = "RnAttendUserID";
                //DropDownList2.DataBind();

            }





        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String str = "select * from TB_PC1 where (supplier like '%' + @search + '%')";   
            SqlCommand xp = new SqlCommand(str, vid2);
            xp.Parameters.Add("@search", SqlDbType.NChar).Value = TextBox1.Text;


            vid2.Open();
            xp.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = xp;
            DataSet ds = new DataSet();
            da.Fill(ds, "supplier");
            GridView1.DataSource = ds;
            GridView1.DataBind();
            vid2.Close();
        
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

           TextBox2.Text = DropDownList1.SelectedItem.Text;
            String str = "select * from TB_PC1 where (supplier like '%' + @search + '%')";
            SqlCommand xp = new SqlCommand(str, vid2);
            xp.Parameters.Add("@search", SqlDbType.NChar).Value = TextBox2.Text;


            vid2.Open();
            xp.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = xp;
            DataSet ds = new DataSet();
            da.Fill(ds, "supplier");
            GridView2.DataSource = ds;
            GridView2.DataBind();
            vid2.Close();
        }

       
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace SLIIT.ITP.UI.PC
{
    public partial class AddNew : SLLITPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SetPageTitle = "Add New Petty Cash Entry";
            SetPageSubTitle = string.Empty;


            this.txt_date.Text = DateTime.Today.ToString("dd/MM/yyyy");


            if (!IsPostBack)
            {

                SqlConnection con = new SqlConnection("Data Source=DESKTOP-RL5S95E;Initial Catalog=SLIIT.ITP;Integrated Security=True");

                SqlCommand cmd = new SqlCommand("select cc_id, cc_name from TB_CostCentre", con);
                con.Open();
                drop_costcentre.DataSource = cmd.ExecuteReader();
                drop_costcentre.DataTextField = "cc_name";
                drop_costcentre.DataValueField = "cc_id";
                drop_costcentre.DataBind();

                SqlConnection con2 = new SqlConnection("Data Source=DESKTOP-RL5S95E;Initial Catalog=SLIIT.ITP;Integrated Security=True");

                SqlCommand cmd2 = new SqlCommand("select manager_id, manager_name from TB_MANAGER", con2);
                con2.Open();
                drop_approve.DataSource = cmd2.ExecuteReader();
                drop_approve.DataTextField = "manager_name";
                drop_approve.DataValueField = "manager_id";
                drop_approve.DataBind();


                SqlConnection con3 = new SqlConnection("Data Source=DESKTOP-RL5S95E;Initial Catalog=SLIIT.ITP;Integrated Security=True");

                SqlCommand cmd3 = new SqlCommand("select Sup_ID, Sup_name from TB_Supplier", con3);
                con3.Open();
                drop_supplier.DataSource = cmd3.ExecuteReader();
                drop_supplier.DataTextField = "Sup_name";
                drop_supplier.DataValueField = "Sup_ID";
                drop_supplier.DataBind();


                SqlConnection con4 = new SqlConnection("Data Source=DESKTOP-RL5S95E;Initial Catalog=SLIIT.ITP;Integrated Security=True");

                SqlCommand cmd4 = new SqlCommand("select RnAttendUserID, LastName from TB_HR_AttendUser", con4);
                con4.Open();
                DropDownList1.DataSource = cmd4.ExecuteReader();
                DropDownList1.DataTextField = "LastName";
                DropDownList1.DataValueField = "RnAttendUserID";
                DropDownList1.DataBind();


            }
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{


        //    //SqlConnection vid = new SqlConnection("Data Source=SACHITHRA;Initial Catalog=SLIIT.ITP;Integrated Security=True");
        //    //SqlCommand xp = new SqlCommand("Insert into TB_PC(date, supplier, des, cc, amount, approve) values(@date, @supplier, @des, @cc, @amount, @approve)", vid);
        //    //xp.Parameters.AddWithValue("@date", txt_date.Text);
        //    //xp.Parameters.AddWithValue("@supplier", drop_supplier.SelectedItem.Text);
        //    //xp.Parameters.AddWithValue("@des", TextBox1.Text);
        //    //xp.Parameters.AddWithValue("@cc", drop_costcentre.SelectedItem.Text);
        //    //xp.Parameters.AddWithValue("@amount", txt_amount.Text);
        //    //xp.Parameters.AddWithValue("@approve", drop_approve.SelectedItem.Text);



        //    //vid.Open();
        //    //xp.ExecuteNonQuery();
        //    //vid.Close();


     


        //}

        protected void Button1_Click1(object sender, EventArgs e)
        {
            SqlConnection vid = new SqlConnection("Data Source=DESKTOP-RL5S95E;Initial Catalog=SLIIT.ITP;Integrated Security=True");
            SqlCommand xp = new SqlCommand("Insert into TB_PC1(date, supplier, des, cc, amount, approve, req) values(@date, @supplier, @des, @cc, @amount, @approve, @req)", vid);
            xp.Parameters.AddWithValue("@date", txt_date.Text);
            xp.Parameters.AddWithValue("@supplier", drop_supplier.SelectedItem.Text);
            xp.Parameters.AddWithValue("@des", TextBox1.Text);
            xp.Parameters.AddWithValue("@cc", drop_costcentre.SelectedItem.Text);
            xp.Parameters.AddWithValue("@amount", txt_amount.Text);
            xp.Parameters.AddWithValue("@approve", drop_approve.SelectedItem.Text);
            xp.Parameters.AddWithValue("@req", DropDownList1.SelectedItem.Text);


            vid.Open();
            xp.ExecuteNonQuery();
            vid.Close();

            this.TextBox1.Text = string.Empty;
            this.txt_amount.Text = string.Empty;




        }
    }
}
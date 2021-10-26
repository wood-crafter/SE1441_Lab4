using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using AuctionWindow.DAL;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace SE1441_Chap23_02
{
    public partial class PlaceItem : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["AuctionConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtEndDateTime.Text = DateTime.Now.AddDays(14)
                    .ToString("dd/MM/yyyy, HH:mm");
                ddlItemType.DataSource =
                    DAO.GetDataTable("SELECT * FROM ItemTypes");
                ddlItemType.DataTextField = "ItemTypeName";
                ddlItemType.DataValueField = "ItemTypeID";
                ddlItemType.DataBind();

                ddlSeller.DataSource =
                    DAO.GetDataTable("SELECT * FROM members");
                ddlSeller.DataTextField = "Name";
                ddlSeller.DataValueField = "memberID";
                ddlSeller.DataBind();
                con.Open();
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime date;
            try
            {
                date = DateTime.ParseExact(txtEndDateTime.Text,
                    "dd/MM/yyyy, HH:mm", CultureInfo.InvariantCulture);
                args.IsValid = true;
            }
            catch
            {
                args.IsValid = false;
            }
        }

        protected void btnCancer_Click(object sender, EventArgs e)
        {

        }

        protected void btnPlace_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Items VALUES('" + ddlItemType.SelectedValue +"',  '"+ txtItemName.Text +"', '"+ txtItemDes.Text + "', '" + ddlSeller.SelectedValue + "', '" + txtMinimum.Text +"', '"+ txtEndDateTime.Text +"', '"+ txtCurrent.Text +"')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
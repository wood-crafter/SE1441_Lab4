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
            Response.Redirect(Request.RawUrl);
        }

        protected void btnPlace_Click(object sender, EventArgs e)
        {
            int itemtype = Convert.ToInt32(ddlItemType.SelectedValue.ToString());
            string itemname = txtItemName.Text.Trim();
            string itemdes = txtItemDes.Text.Trim();
            string sellerid = ddlSeller.SelectedValue.ToString();
            string minimumbid = txtMinimum.Text.Trim();
            DateTime date = DateTime.ParseExact(txtEndDateTime.Text,
                    "dd/MM/yyyy, HH:mm", CultureInfo.InvariantCulture);
            string currentprice = txtCurrent.Text.Trim();

            int seller = Convert.ToInt32(sellerid);
            float minimum = (float)Convert.ToDouble(minimumbid);
            float current = (float)Convert.ToDouble(currentprice);

            string Query = string.Format("INSERT INTO Items VALUES('{0}','{1}','{2}','{3}','{4}','{5}','{6}')"
                ,itemtype,itemname,itemdes,seller,minimum,date,current);
            SqlCommand cmd = new SqlCommand(Query,con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ClientScript.RegisterClientScriptBlock(this.GetType(), "K", "alert('A bid item is added!')", true);
            ddlSeller.ClearSelection();
            ddlItemType.ClearSelection();
            txtItemName.Text = "";
            txtItemDes.Text = "";
            txtCurrent.Text = "";
            txtMinimum.Text = "";
            
        }
    }
}
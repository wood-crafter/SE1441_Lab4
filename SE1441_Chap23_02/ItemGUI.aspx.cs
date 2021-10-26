using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using AuctionWindow.DAL;
using System.Windows;

namespace SE1441_Chap23_02
{
    public partial class ItemGUI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlBidder.DataSource = DAO.GetDataTable(
                    "SELECT MemberId,NAME FROM MEMBERS");
                ddlBidder.DataTextField = "NAME";
                ddlBidder.DataValueField = "MemberId";
                ddlBidder.DataBind();

                ddlItemName.DataSource = DAO.GetDataTable(
                    "SELECT ItemID,ItemName FROM Items WHERE Items.EndDateTime > GETDATE()");
                ddlItemName.DataTextField = "ItemName";
                ddlItemName.DataValueField = "ItemID";
                ddlItemName.DataBind();

                txtItemDescription.Enabled = false;
                txtCurrentPrice.Enabled = false;
                txtEdt.Enabled = false;
                txtSeller.Enabled = false;
                txtMbi.Enabled = false;
                ddlItemName.SelectedIndex = 0;

                OnItemNameChange();
            }
        }

        private void OnItemNameChange()
        {
            try
            {
                string item = ddlItemName.SelectedValue.ToString();
                string sql = "Select * from Items join Members on Items.SellerID=Members.MemberId"
                                                          + " Where ItemID = " + item;
                DataTable dt = DAO.GetDataTable(sql);
                txtItemDescription.Text = dt.Rows[0][3].ToString();
                txtCurrentPrice.Text = dt.Rows[0][7].ToString();
                txtEdt.Text = dt.Rows[0][6].ToString();
                txtSeller.Text = dt.Rows[0][9].ToString();
                txtMbi.Text = dt.Rows[0][5].ToString();

                labelTime.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
                String stringDate = txtEdt.Text;
                DateTime dateTime = DateTime.Parse(stringDate);
                System.TimeSpan diff2 = dateTime - DateTime.Now;
                labelTimeRe.Text = diff2.Days.ToString() + ". " + diff2.Hours.ToString() + ":" + diff2.Minutes.ToString();
            }
            catch { }
        }

        protected void ddlItemName_SelectedIndexChanged(object sender, EventArgs e)
        {
            OnItemNameChange();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToDouble(txtBidPirce.Text) >= Convert.ToDouble(txtCurrentPrice.Text) + Convert.ToDouble(txtMbi.Text))
                {
                    
                    string sql = "INSERT INTO [dbo].[Bids]"
                + " ([ItemID] ,[BidderID]  ,[BidDateTime] ,[BidPrice])"
                + "   VALUES "
                + "(" + ddlItemName.SelectedValue.ToString() + ","
                + ddlBidder.SelectedValue.ToString() + ","
                + "'" + DateTime.Now + "',"
                + Convert.ToDouble(txtBidPirce.Text) + ")";

                    SqlCommand cmd = new SqlCommand(sql);
                    string updateCurrentPriceSql = "UPDATE Items SET CurrentPrice = " + Convert.ToDouble(txtBidPirce.Text) + "WHERE ItemID = " + ddlItemName.SelectedValue.ToString();
                    SqlCommand cmd1 = new SqlCommand(updateCurrentPriceSql);
                    try
                    {
                        DAO.UpdateTable(cmd);
                        DAO.UpdateTable(cmd1);
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Bid item is added!" + "');", true);
                        //MessageBox.Show(sql);

                        string item = ddlItemName.SelectedValue.ToString();
                        string getNew = "Select * from Items join Members on Items.SellerID=Members.MemberId"
                                                                  + " Where ItemID = '" + item + "'";
                        DataTable dt = DAO.GetDataTable(getNew);
                        txtItemDescription.Text = dt.Rows[0][3].ToString();
                        txtCurrentPrice.Text = dt.Rows[0][7].ToString();
                        txtEdt.Text = dt.Rows[0][6].ToString();
                        txtSeller.Text = dt.Rows[0][9].ToString();
                        txtMbi.Text = dt.Rows[0][5].ToString();
                    }
                    catch (SqlException ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ex.Message + "');", true);
                    }

                }
                else
                {
                    double minBidPrice = Convert.ToDouble(txtCurrentPrice.Text) + Convert.ToDouble(txtMbi.Text);
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Bid price must be >=" + Convert.ToDouble(minBidPrice) + "');", true);
                }
            }
            catch (FormatException ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Price must be a double" + "');", true);
                Console.WriteLine(ex);
            }
        }
    }
}
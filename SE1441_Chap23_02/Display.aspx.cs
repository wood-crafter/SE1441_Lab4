using AuctionWindow.DAL;
using SE1441_Chap23_02.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1441_Chap23_02
{
    public partial class Display : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownListSeller.DataSource = DAO.GetDataTable("SELECT * FROM members");
                DropDownListSeller.DataTextField = "Name";
                DropDownListSeller.DataValueField = "MemberID";
                DropDownListSeller.DataBind();
            }
                lblCheck.Text = "";
        }
        public List<BidSearch> getData(string id)
        {
            List<BidSearch> list = new List<BidSearch>();
            SqlDataReader rd = DAO.executeQuery1("select A.BidDateTime, A.BidPrice, A.Bidder,I.EndDateTime from " +
                "(SElECT BidDateTime, BidPrice,Name as Bidder,B.ItemID from Bids B join Members M on B.BidderID = M.MemberId)" +
                " as A join Items I on A.ItemID = I.ItemID where A.ItemID = " + id + " order by A.BidPrice desc");
            while (rd.Read())
            {
                string bidDate = rd.GetValue(0).ToString().Trim();
                string endDate = rd.GetValue(3).ToString().Trim();
                double bidPrice = double.Parse(rd.GetValue(1).ToString().Trim());
                string bidderName = rd.GetValue(2).ToString().Trim();
                DateTime bdate = DateTime.Parse(bidDate);
                DateTime edate = DateTime.Parse(endDate);
                TimeSpan df = (edate - bdate);
                string timeremain = df.Days + ", " + df.Hours + ":" + df.Minutes;
                list.Add(new BidSearch(bidDate, endDate, bidPrice, bidderName, timeremain));
            }
            return list;
        }
        protected void DropDownListSeller_SelectedIndexChanged(object sender, EventArgs e)
        {
            
                DropDownListItem.DataSource = DAO.GetDataTable("SELECT * FROM Items where SellerID = " + DropDownListSeller.SelectedValue + "");
                DropDownListItem.DataTextField = "ItemName";
                DropDownListItem.DataValueField = "ItemID";
                DropDownListItem.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {   
            string id = DropDownListItem.SelectedValue;
            if (id.Equals(""))
            {
                lblCheck.Text = "items is empty";
            }
            else
            {
                List<BidSearch> list = getData(id);
                if (list.Count == 0)
                {
                    lblResult.Text = "";
                }
                DataTable dt = new DataTable();
                dt.Columns.Add("BidDateTime", typeof(String));
                dt.Columns.Add("BidPrice", typeof(String));
                dt.Columns.Add("Bidder", typeof(String));
                dt.Columns.Add("TimeRemaining\n(dd, HH:mm)", typeof(String));
                foreach (BidSearch b in list)
                {
                    DateTime date = DateTime.Parse(b.Bdate);

                    string dateFormat = date.ToString("dd/M/yyyy hh:mm:ss tt");

                    dt.Rows.Add(dateFormat, b.Bidprice, b.Bidname, b.Timeremaining);
                }
                try
                {
                    int max = Convert.ToInt32(dt.Compute("max([BidPrice])", string.Empty));
                    int min = Convert.ToInt32(dt.Compute("min([BidPrice])", string.Empty));
                    lblResult.Text = "" + dt.Rows.Count + " Max bid price = " + max + " Min bid price = " + min;
                }
                catch
                {

                }
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
           
        }
    }
}
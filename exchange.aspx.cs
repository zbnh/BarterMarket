using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class exchange : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "yes")
        {
            Response.Redirect("Login.aspx?url=exchange.aspx?Item_ID=" + Request.QueryString["Item_ID"].ToString());
        }
        else
        {
            if(IsMine())
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('不得与自己得物品交换');window.location.href='ItemDetailDemo.aspx?Item_ID="+Request.QueryString["Item_ID"].ToString()+"'", true);
                
            }
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string strConn = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        DataSet ds = new DataSet();
        con.Open();
        SqlDataAdapter sqld = new SqlDataAdapter("SELECT Item_User FROM t_item WHERE Item_ID=@Item_ID", con);
        sqld.SelectCommand.Parameters.AddWithValue("@Item_ID", Request.QueryString["Item_ID"].ToString());
        sqld.Fill(ds, "user");
        DataTable dTable = ds.Tables["user"];
        DataRowCollection rows = dTable.Rows;
        SqlCommand cmd = new SqlCommand("insert into t_exchange" +
        "(ItemWanna_ID,ItemIown_ID,Exchange_Message,Exchange_User,ToUser_ID)" +
        " values(@ItemWanna_ID,@ItemIown_ID,@Exchange_Message,@Exchange_User,@ToUser_ID)", con);
        cmd.Parameters.AddWithValue("@ItemWanna_ID", Request.QueryString["Item_ID"].ToString());
        cmd.Parameters.AddWithValue("@ItemIown_ID", DropDownList1.SelectedValue);
        cmd.Parameters.AddWithValue("@Exchange_Message", TextBox1.Text);
        cmd.Parameters.AddWithValue("@Exchange_User", Session["UserID"]);
        cmd.Parameters.AddWithValue("@ToUser_ID", rows[0][0]);
        int count = cmd.ExecuteNonQuery();
        if (count == 1)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('申请成功');", true);

            Response.Redirect("Default.aspx");
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('申请失败');", true);
        }
        cmd = null;
        con.Close();
        con = null;
    }

    public bool IsMine()
    {
        bool result = false;
        string strConn = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        //open database
        con.Open();
        //sql cmd
        SqlCommand cmd = new SqlCommand("select Item_User from t_item where Item_ID = @Item_ID", con);
        cmd.Parameters.AddWithValue("@Item_ID", Request.QueryString["Item_ID"]);
        SqlDataReader dr = cmd.ExecuteReader();
        if(dr.Read())
        {
            if(dr[0].ToString().Equals(Session["UserID"].ToString()))
            {
                result = true;
            }
        }
        return result;
    }
}
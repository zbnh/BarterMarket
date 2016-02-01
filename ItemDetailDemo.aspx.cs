using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class ItemDetailDemo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "yes")
        {
            Button1.Visible = false;
        }
        else
        {
            Button1.Visible = true;
        }

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

            Response.Redirect("exchange.aspx?Item_ID="+Request.QueryString["Item_ID"].ToString());
  

    }
    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if(Session["login"] != "yes")
        {
            Response.Redirect("Login.aspx?url=ItemDetailDemo.aspx?Item_ID="+Request.QueryString["Item_ID"].ToString());
        }
        string strConn = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        //open database
        con.Open();
        //sql cmd
        SqlCommand cmd = new SqlCommand("select * from t_collection where UserID = @UserID and Item_ID = @Item_ID", con);
        cmd.Parameters.AddWithValue("@UserID",Session["UserID"]);
        cmd.Parameters.AddWithValue("@Item_ID",Request.QueryString["Item_ID"]);
        //execute cmd
        SqlDataReader dr = cmd.ExecuteReader();
        //read result
       if(!dr.Read())
       {
           cmd = null;
           con.Close();
           con.Open();
           cmd = new SqlCommand("Insert into t_collection values(@UserID,@Item_ID)",con);
           cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);
           cmd.Parameters.AddWithValue("@Item_ID", Request.QueryString["Item_ID"]);
           int count = cmd.ExecuteNonQuery();
           if(count == 1)
           {
               Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('收藏成功！！');", true);
           }
           else
           {
               Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('收藏失败！！');", true);
           }
           con.Close();
       }
       else
       {
           Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('已收藏！！');", true);
       }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["login"] != "yes")
        {
            Response.Redirect("Login.aspx?url=ItemDetailDemo.aspx?Item_ID=" + Request.QueryString["Item_ID"].ToString());
        }
        string strConn = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        con.Open();
        SqlCommand cmd = new SqlCommand("select Item_User from t_item where Item_ID = @Item_ID",con);
        cmd.Parameters.AddWithValue("@Item_ID", Request.QueryString["Item_ID"]);
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();

        int ToUserID = Convert.ToInt32(dr[0].ToString());

        con.Close();
        con.Open();

        cmd = new SqlCommand("insert into t_message" +
        "(User_ID,Message_Content,ToUser_ID,Item_ID)" +
        " values(@user_id,@Message_Content,@ToUser_ID,@Item_ID)", con);
        cmd.Parameters.AddWithValue("@user_id", Session["UserID"]);
        cmd.Parameters.AddWithValue("@Message_Content", sms.Text);
        cmd.Parameters.AddWithValue("@ToUser_ID", ToUserID);
        cmd.Parameters.AddWithValue("@Item_ID", Request.QueryString["Item_ID"]);
        int count = cmd.ExecuteNonQuery();
        if (count == 1)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('发送成功');window.location=location", true);
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('发送失败');window.location.reload();", true);
        }
        cmd = null;
        con.Close();
        con = null;
    }

}
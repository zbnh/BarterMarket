using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "yes")
        {
            Master.FindControl("menu1").Visible = false;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Reg.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if( Session["code"].ToString() == null || TextBox3.Text.ToLower() != Session["code"].ToString().ToLower())
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('验证码错误!');", true);
        }
        else
        {
            Session.Remove("code");
            string strConn = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
            SqlConnection con = new SqlConnection(strConn);
            DataSet ds = new DataSet();
            //open the database
            con.Open();

            //SQL
            SqlDataAdapter sqld = new SqlDataAdapter("SELECT UserID,UserName,user_pic FROM t_user WHERE LoginName=@LoginName AND PassWord=@PassWord", con);

            // value assignment
            sqld.SelectCommand.Parameters.AddWithValue("@LoginName", TextBox1.Text);
            sqld.SelectCommand.Parameters.AddWithValue("@PassWord", TextBox2.Text);
            sqld.Fill(ds, "user");
            DataTable dTable = ds.Tables["user"];
            DataRowCollection rows = dTable.Rows;
            if (rows.Count > 0)
            {
                Session["UserID"] = rows[0][0];
                Session["UserName"] = rows[0][1];
                Session["UserPic"] = rows[0][2];
                Session["login"] = "yes";
                if (TextBox1.Text == "administrator")
                {
                    Response.Redirect("admin.aspx");
                }
                if (Request.QueryString["url"] != null)
                {
                    String Url;
                    Url = Request.QueryString["url"].ToString();//+ ".aspx"
                    Response.Redirect(Url);
                }
                else
                {
                    Response.Redirect("default.aspx");
                }
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('登陆失败');", true);
            }
            con.Close();
            con = null;
        }
       
    }


    //protected void LinkButton1_Click(object sender, EventArgs e)
    //{
    //    Image1.ImageUrl = Request.MapPath("~/ValidateCode.ashx");
    //}
}

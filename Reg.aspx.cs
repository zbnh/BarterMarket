using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
public partial class Reg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "yes")
        {
            Master.FindControl("menu1").Visible = false;
        }
    }
    
    private bool doCheck(string condValue)
    {
        bool ret = true;
        string strConn = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        con.Open();
        SqlCommand cmd = new SqlCommand("select * from t_user where LoginName = @cond_value", con);
        cmd.Parameters.AddWithValue("@cond_value", condValue);
        SqlDataReader reader = cmd.ExecuteReader();
        while(reader.Read())
        {
            ret = false;
        }
        return ret;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if(!doCheck(TextBox1.Text))
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('该登录名已存在');", true);
            return;
        }
        string strConn = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into t_user"+
        "(LoginName,PassWord,Address,EMail,Tel,UserName,RegTime,gender,user_pic)"+
        " values(@loginname,@password,@address,@email,@tel,@username,@regtime,@gender,@user_pic)",con);
        cmd.Parameters.AddWithValue("@loginname", TextBox1.Text);
        cmd.Parameters.AddWithValue("@password", TextBox2.Text);
        cmd.Parameters.AddWithValue("@address", TextBox4.Text);
        cmd.Parameters.AddWithValue("@email", TextBox5.Text);
        cmd.Parameters.AddWithValue("@tel", TextBox6.Text);
        cmd.Parameters.AddWithValue("@username", TextBox7.Text);
        cmd.Parameters.AddWithValue("@regtime", DateTime.Now.ToString("yyyy-MM-dd"));
        cmd.Parameters.AddWithValue("@gender", DropDownList1.SelectedValue);
        
        if(DropDownList1.SelectedValue == "男")
        {
            cmd.Parameters.AddWithValue("@user_pic", "boy.jpg");
        }
        else
        {
            cmd.Parameters.AddWithValue("@user_pic", "girl.jpg");
        }
        
        int count = cmd.ExecuteNonQuery();
        if(count == 1)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('注册成功');", true);
            Response.Redirect("Login.aspx");
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('注册失败');", true);
        }
        cmd = null;
        con.Close();
        con = null;

    }
}
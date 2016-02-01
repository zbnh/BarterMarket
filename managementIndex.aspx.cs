using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Web.Configuration;

public partial class managementIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "yes")
        {
            Response.Redirect("Login.aspx?url=managementIndex.aspx");
        }
        Image1.ImageUrl = "~/usernamepic/"+Session["UserPic"];

    }
    protected void UpLoadButton1_Click(object sender, EventArgs e)
    {
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string strConn = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        con.Open();
        SqlCommand cmd = new SqlCommand("update t_user set user_pic=@picname where userid='" + Session["UserID"] + "'", con);
        cmd.Parameters.AddWithValue("@picname",btnFileUpload1.FileName);

        int count = cmd.ExecuteNonQuery();
        if (count == 1)
        {
            if (btnFileUpload1.HasFile)
            {
                string path = Request.MapPath("usernamepic/" + btnFileUpload1.FileName);
                btnFileUpload1.SaveAs(path);
            }
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('上传头像成功');", true);
            Button2.Visible = true;
            btnFileUpload1.Visible = false;
            Button1.Visible = false;
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('上传头像失败');", true);
        }
        cmd = null;
        con.Close();
        con = null;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        btnFileUpload1.Visible = true;
        Button1.Visible = true;
        Button2.Visible = false;
    }
}
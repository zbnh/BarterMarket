using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
public partial class publish : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "yes")
        {
            Response.Redirect("Login.aspx?url=publish.aspx");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string strConn = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into t_item" +
        "(Item_User,Item_Name,Item_Type,Item_Condition,Hope_ItemName,Hope_Dest,Item_Pic,Item_Describe,Item_State,AddTime)" +
        " values(@Item_User,@Item_Name,@Item_Type,@Item_Condition,@Hope_ItemName,@Hope_Dest,@Item_Pic,@Item_Describe,0,@AddTime)", con);
        cmd.Parameters.AddWithValue("@Item_User", Session["UserID"]);
        cmd.Parameters.AddWithValue("@Item_Name", TextBox1.Text);
        cmd.Parameters.AddWithValue("@Item_Type", DropDownList1.SelectedValue);
        cmd.Parameters.AddWithValue("@Item_Condition", DropDownList2.SelectedValue);
        cmd.Parameters.AddWithValue("@Hope_ItemName", TextBox2.Text);
        cmd.Parameters.AddWithValue("@Hope_Dest", TextBox5.Text);
        cmd.Parameters.AddWithValue("@Item_Pic", FileUpload1.FileName);
        cmd.Parameters.AddWithValue("@Item_Describe",TextBox4.Text );
        cmd.Parameters.AddWithValue("@AddTime", DateTime.Now);
        int count = cmd.ExecuteNonQuery();
        if (count == 1)
        {
            if(FileUpload1.HasFile)
            {
                string path = Request.MapPath("userpic/"+FileUpload1.FileName);
                FileUpload1.SaveAs(path);
            }
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('发布成功');", true);
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('发布失败');", true);
        }
        cmd = null;
        con.Close();
        con = null;

    }
}
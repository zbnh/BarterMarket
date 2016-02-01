using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.UrlReferrer==null)
        {
            Response.Write("<script type='text/javascript'>alert('权限错误，请重新登陆!');</script>");
            Response.Redirect("default.aspx");
        }
        Master.FindControl("menu1").Visible = false;
        if (!IsPostBack)
        {
            GridView1.Visible = true;
            GridView2.Visible = false;
            GridView3.Visible = false;
            Label2.Text = "用户资料管理";
        }
    }
    
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(DropDownList1.SelectedIndex==0)
        {
            GridView1.Visible = true;
            GridView2.Visible = false;
            GridView3.Visible = false;
            Label2.Text = "用户资料管理";
        }
        if (DropDownList1.SelectedIndex == 1)
        {
            GridView1.Visible = false;
            GridView2.Visible = true;
            GridView3.Visible = false;
            Label2.Text = "物品信息管理";
        }
        if (DropDownList1.SelectedIndex == 2)
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
            GridView3.Visible = true;
            Label2.Text = "物品类型管理";
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName=="Insert")
        {
            GridView1.DataSourceID = null;
            GridView1.DataBind();
        }
    }
    protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        GridView1.DataSourceID = "SqlDataSource11";
        GridView1.DataBind();
    }
    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName=="Insert1")
        {
            GridView3.DataSourceID = null;
            GridView3.DataBind();
        }
    }
    protected void DetailsView2_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        GridView3.DataSourceID = "SqlDataSource33";
        GridView3.DataBind();
    }
}
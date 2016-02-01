using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] == "yes")
        {
            //todo:hide   
            Label1.Text = "欢迎回来，" + Session["username"];
            Label1.Visible = true;
            Button1.Visible = true;
            ireg.Visible = false;
            ilogin.Visible = false;
        }
        else
        {
           //todo: show
            Label1.Visible = false;
            Button1.Visible = false;
            ireg.Visible = true;
            ilogin.Visible = true;
            Menu1.Visible = false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["login"] = null;
        Session.Abandon();
        Session.Clear();
        Label1.Visible = false;
        Button1.Visible = false;
        ireg.Visible = true;
        ilogin.Visible = true;
        Response.Redirect("Login.aspx",true);
    }
    protected void isubmit_search_Click(object sender, EventArgs e)
    {
        Response.Redirect("#");
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class hasPublished : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "yes")
        {
            Response.Redirect("Login.aspx?url=hasPublished.aspx");
        }
    }
}
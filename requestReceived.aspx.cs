using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class requestReceived : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["login"] != "yes")
        {
            Response.Redirect("Login.aspx?url=requestReceived.aspx");
        }
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        String Exchange_ID = e.CommandArgument.ToString();
        Int64 key = Int64.Parse(e.CommandArgument.ToString());
        string strConn = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        SqlConnection con = new SqlConnection(strConn);
        con.Open();
        if(e.CommandName == "agree")
        {       //to refuse ones,except you, who woo me. 
            SqlCommand cmd = new SqlCommand("update t_exchange set Exchange_State ='2',Exchange_EndDate='" 
                + System.DateTime.Now 
                + "' where ItemWanna_ID =  (select ItemWanna_ID from t_exchange where exchange_ID =" + key + ")  and exchange_ID != "+key+"", con);
                 int count = cmd.ExecuteNonQuery();
                //to say sorry to ones I ever wooed.
                 cmd = new SqlCommand("update t_exchange set Exchange_State ='2',Exchange_Enddate='"
                     +System.DateTime.Now
                     +"' where ItemWanna_ID = (select ItemIown_ID from t_exchange where exchange_ID ="+key+") and exchange_ID ! = "+key+"",con);
                 count = cmd.ExecuteNonQuery();
                //to drive away ones who woo you.
                 cmd = new SqlCommand("update t_exchange set Exchange_State ='2',Exchange_Enddate='"
                         + System.DateTime.Now
                         + "' where ItemIown_ID = (select ItemIown_ID from t_exchange where exchange_ID =" + key + ") and exchange_ID ! = " + key + "",con);
                 count = cmd.ExecuteNonQuery();
                //to drive away ones you woo but me.
                 cmd = new SqlCommand("update t_exchange set Exchange_State ='2',Exchange_Enddate='"
                              + System.DateTime.Now
                              + "' where ItemIown_ID = (select ItemWanna_ID from t_exchange where exchange_ID =" + key + ") and exchange_ID ! = " + key + "",con);
                 count = cmd.ExecuteNonQuery();
                 cmd = new SqlCommand("update t_exchange set Exchange_State ='1',Exchange_EndDate='"
                     +System.DateTime.Now+"' where Exchange_ID = "+key+"", con);
                 count = cmd.ExecuteNonQuery();
            if(count == 1)
            {
                cmd = new SqlCommand("update t_item set Item_State ='1' where item_ID = (select ItemWanna_ID from t_exchange where exchange_ID ="+key+")", con);
                count = cmd.ExecuteNonQuery();
                if(count == 1)
                {
                    cmd = new SqlCommand("update t_item set Item_State ='1' where item_ID = (select ItemIown_ID from t_exchange where exchange_ID =" + key + ")", con);
                    count = cmd.ExecuteNonQuery();
                    if(count == 1)
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('交换成功');", true);
                    }
                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('交换失败');", true);
                    }
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('交换失败');", true);
                }
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('交换失败');", true);
            }
                GridView1.DataBind();
        }


        if (e.CommandName == "disagree")
        {
            SqlCommand cmd = new SqlCommand("update t_exchange set Exchange_State ='2',Exchange_EndDate='" + System.DateTime.Now + "' where Exchange_ID = " + key + "", con);
            int count = cmd.ExecuteNonQuery();
            if (count == 1)
            {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('拒绝成功');", true);
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "success", "alert('交换失败');", true);
            }
            GridView1.DataBind();
        }
        
        con.Close();
        con = null;

    }
    
}
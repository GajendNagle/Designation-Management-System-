using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Designation_Master_Register_Designation : System.Web.UI.Page
{
    CrudOp crudOp = new CrudOp();
    ClgBind ClgBind = new ClgBind();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindColleges();
            BindStreams();
        }

    }

    protected void BindColleges()
    {
        //try
        //{
        //    ds = crudOp.ByProcedure("Proc_RecordDesig",
        //    new string[] { "Action" },
        //    new string[] { "College" });
        //    if (ds != null)
        //    {
        //        if (ds.Tables.Count > 0)
        //        {
        //            if (ds.Tables[0].Rows.Count > 0)
        //            {
        //                ddlCollege.DataSource = ds.Tables[0];
        //                ddlCollege.DataTextField = "CollegeName";
        //                ddlCollege.DataValueField = "CollegeID";
        //                ddlCollege.DataBind();
        //                ddlCollege.Items.Insert(0, new ListItem("-- Select College --", "0"));
        //            }
        //        }
        //    }
        //}
        //catch (Exception)
        //{
        //    ddlCollege.Items.Clear();
        //    ddlCollege.Items.Insert(0, new ListItem("-- Select College --", "0"));
        //}
        ClgBind.BindColleges(ddlCollege);
    }
    protected void BindStreams()
    {



        try
        {
            ds = crudOp.ByProcedure("Proc_RecordDesig",
            new string[] { "Action" },
            new string[] { "Streams" });
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        ddlStream.DataSource = ds.Tables[0];
                        ddlStream.DataTextField = "StreamName";
                        ddlStream.DataValueField = "StreamID";
                        ddlStream.DataBind();
                        ddlStream.Items.Insert(0, new ListItem("-- Select Stream --", "0"));
                    }
                }
            }
        }
        catch (Exception)
        {
            ddlStream.Items.Clear();
            ddlCollege.Items.Insert(0, new ListItem("-- Select College --", "0"));

        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(txtDesignationName.Text.Trim()))
            {
                Response.Write("<script>alert('Please Enter Designation Name');</script>");
                return;
            }
            if (string.IsNullOrEmpty(txtDesignationCode.Text.Trim()))
            {
                Response.Write("<script>alert('Please Enter Designation Code');</script>");
                return;
            }
            if (string.IsNullOrEmpty(ddlCollege.SelectedValue))
            {
                Response.Write("<script>alert('Please Enter College');</script>");
                return;
            }
            if (string.IsNullOrEmpty(txtDesignationAcronym.Text.Trim()))
            {
                Response.Write("<script>alert('Please Enter DesignationAcronym');</script>");
                return;
            }
            if (string.IsNullOrEmpty(ddlStream.SelectedValue))
            {
                Response.Write("<script>alert('Please Enter Stream');</script>");
                return;
            }

            ds = crudOp.ByProcedure("Proc_DesignationInsert",
            new string[] { "DesignationName", "CollegeID", "DesignationCode", "DesignationAcronym", "StreamID", "RoleResponsibility" },
            new string[] { txtDesignationName.Text.Trim(), ddlCollege.SelectedValue.Trim(),txtDesignationCode.Text.Trim(),
                txtDesignationAcronym.Text.Trim(),ddlStream.SelectedValue.Trim(), txtRoleResponsibilities.Text.Trim()});
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        if (Convert.ToBoolean(ds.Tables[0].Rows[0]["Success"]) == true)
                        {
                            Response.Write("<script>alert('Designation Registered Successfully');</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('"+ds.Tables[0].Rows[0]["Msg"] +"');</script>");

                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Connection Error: " + ex.Message + "');</script>");
            return;
        }

    }
}
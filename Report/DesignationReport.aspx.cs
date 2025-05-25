using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Report_DesignationReport : System.Web.UI.Page
{
    ClgBind ClgBind = new ClgBind();
    CrudOp crudOp = new CrudOp();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindClg();
            Record();
        }
    }
    protected void BindClg()
    {
        ClgBind.BindColleges(ddlCollege);
    }
    protected void Record()
    {
        ds = crudOp.ByProcedure("Proc_RecordDesig",
            new string[] { "Action", "ClgName", "DesignName" },
            new string[] { "", "", "" });
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            grdDesignationRcrd.DataSource = ds.Tables[0];
            grdDesignationRcrd.DataBind();
        }
        else
        {
            grdDesignationRcrd.DataSource = null;
            grdDesignationRcrd.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('No records found for the selected college.');", true);
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        ds = crudOp.ByProcedure("Proc_RecordDesig",
            new string[] { "Action", "ClgName", "DesignName" },
            new string[] { "FilterdRecord", ddlCollege.SelectedItem.Text == "-- Select College --" ? "" :ddlCollege.SelectedItem.Text.Trim(), txtDesignationName.Text.Trim() });
        if (ds!=null)
        {
            grdDesignationRcrd.DataSource = ds;
            grdDesignationRcrd.DataBind();
        }
    }

}

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for ClgBind
/// </summary>
public class ClgBind
{
    SqlConnStr sqlConnStr = new SqlConnStr();
    CrudOp crudOp = new CrudOp();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    public DataTable BindColleges(DropDownList ClgId)
    {
        try
        {
            ds = crudOp.ByProcedure("Proc_RecordDesig",
            new string[] { "Action" },
            new string[] { "College" });
            if (ds != null)
            {
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        ClgId.DataSource = ds.Tables[0];
                        ClgId.DataTextField = "CollegeName";
                        ClgId.DataValueField = "CollegeID";
                        ClgId.DataBind();
                        ClgId.Items.Insert(0, new ListItem("-- Select College --", "0"));
                        dt = ds.Tables[0];
                    }
                }
            }
            return dt;
        }
        catch (Exception)
        {
            ClgId.Items.Clear();
            ClgId.Items.Insert(0, new ListItem("-- Select College --", "0"));
            return dt = null;
        }
    }
}
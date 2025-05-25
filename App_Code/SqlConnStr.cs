using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SqlConnStr
/// </summary>
public class SqlConnStr
{
    public String GetConnectionString()
    {
        string str =ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        return str;
    }
}
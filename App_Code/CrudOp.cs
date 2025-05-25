using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CrudOp
/// </summary>
public class CrudOp
{
    SqlConnStr conn = new SqlConnStr();
    public DataSet ByProcedure(string procedureName, string[] Parameter, string[] Value)
    {
        string Connstr = conn.GetConnectionString();
        using (SqlConnection Conn=new SqlConnection(Connstr))
        {
            using (SqlCommand cmd = new SqlCommand(procedureName, Conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                for (int i = 0; i < Parameter.Length; i++)
                {
                    cmd.Parameters.AddWithValue("@" + Parameter[i], Value[i]);
                }
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                return ds;
            }
        }
    }


}
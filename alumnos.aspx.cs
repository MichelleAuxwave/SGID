using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class alumnos : System.Web.UI.Page
{
    public static string IDoMATRICULA;

    protected void Page_PreLoad(object sender, EventArgs e)
    {
        Detectar_validar_Galleta();
    }

    static string GetMd5Hash(MD5 md5Hash, string input)
    {
        byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
        StringBuilder sBuilder = new StringBuilder();
        for (int i = 0; i < data.Length; i++)
        {
            sBuilder.Append(data[i].ToString("x2"));
        }
        return sBuilder.ToString();
    }

    static bool VerifyMd5Hash(MD5 md5Hash, string input, string hash)
    {
        string hashOfInput = GetMd5Hash(md5Hash, input);
        StringComparer comparer = StringComparer.OrdinalIgnoreCase;
        if (0 == comparer.Compare(hashOfInput, hash))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public static bool Detectar_validar_Galleta()
    {
        SqlCommand cmd;
        SqlDataReader dr;
        FuncionesGenerales fgclass = new FuncionesGenerales();
        HttpCookie rdC = HttpContext.Current.Request.Cookies["SGID_usergate"];
        if (rdC != null)
        {
            if (rdC["User"] != null && rdC["Hash"] != null)
            {
                string user = Convert.ToString(rdC["User"]);
                string hash = Convert.ToString(rdC["Hash"]);
                string pass;
                int type;
                using (SqlConnection cn = new SqlConnection(FuncionesGenerales.connectionString))
                {
                    string query;
                    query = @"select [ID o MATRICULA], _tipo, _pass from usuarios where _active = 1 and _user = '{0}' and _tempMD5hash_pass = '{1}'";
                    query = string.Format(query, user, hash);
                    try
                    {
                        cmd = new SqlCommand(query, cn);
                        cn.Open();
                        dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            pass = dr["_pass"].ToString();
                            type = Convert.ToInt32(dr["_tipo"].ToString());
                            if (type == 3) // EL NUMERO VA A CAMBIAR SEGUN EL ASIGNADO AL TIPO DE USUARIO, 3 EQUIVALE A ESTA PAGINA
                            {
                                using (MD5 md5Hash = MD5.Create())
                                {
                                    if (VerifyMd5Hash(md5Hash, pass, hash))
                                    {
                                        IDoMATRICULA = dr.GetString(0);
                                        dr.Close();
                                        cn.Close();

                                        return true;
                                    }
                                    else
                                    {
                                        IDoMATRICULA = null;
                                        HttpContext.Current.Response.Redirect("Default.aspx");
                                        return false;
                                    }
                                }
                            }
                            else
                            {
                                HttpContext.Current.Response.Redirect("Default.aspx");
                                return false;
                            }
                        }
                        else
                        {
                            HttpContext.Current.Response.Redirect("Default.aspx");
                            return false;
                        }
                    }
                    catch (Exception eE)
                    {
                        //Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", "alert('" + eE.Message +"');", true);
                        HttpContext.Current.Response.Redirect("Default.aspx");
                        return false;
                    }
                }
            }
            else
            {
                HttpContext.Current.Response.Redirect("Default.aspx");
                return false;
            }
        }
        else
        {
            HttpContext.Current.Response.Redirect("Default.aspx");
            return false;
        }
    }

    [WebMethod]
    public static string getIDoMatricula()
    {
        if (Detectar_validar_Galleta())
        {
            if (IDoMATRICULA != null)
            {
                SqlCommand cmd;
                SqlDataReader dr;
                using (SqlConnection cn = new SqlConnection(FuncionesGenerales.connectionString))
                {
                    string query;
                    query = @"
                                update usuarios set ultimaActividad = GETDATE() where [ID o MATRICULA] = '{0}' and _active = 1
                            ";
                    query = string.Format(query, IDoMATRICULA);

                    try
                    {
                        cmd = new SqlCommand(query, cn);
                        cn.Open();
                        dr = cmd.ExecuteReader();
                        dr.Read();

                        return IDoMATRICULA;
                    }
                    catch (Exception eE)
                    {
                        return IDoMATRICULA;
                    }
                }
            }
            else
            {
                HttpContext.Current.Response.Redirect("Default.aspx");
                return null;
            }
        }
        else
        {
            HttpContext.Current.Response.Redirect("Default.aspx");
            return null;
        }
    }

    [WebMethod]
    public static bool logout()
    {
        FuncionesGenerales fgclass = new FuncionesGenerales();
        DateTime thisDay = DateTime.Now;
        string fecha = thisDay.ToString("G");
        HttpCookie configGalleta = new HttpCookie("SGID_usergate");
        configGalleta["User"] = "";
        configGalleta["Hash"] = "";
        configGalleta.Expires = DateTime.Now.AddDays(-1);
        HttpContext.Current.Response.Cookies.Add(configGalleta);

        if (fgclass.logout(IDoMATRICULA))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    
}
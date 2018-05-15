using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
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

    protected void Detectar_validar_Galleta()
    {
        SqlCommand cmd;
        SqlDataReader dr;
        FuncionesGenerales fgclass = new FuncionesGenerales();
        if (Request.Cookies["SGID_usergate"] != null)
        {
            if (Request.Cookies["SGID_usergate"]["User"] != null && Request.Cookies["SGID_usergate"]["Hash"] != null)
            {
                string  user = Convert.ToString(Request.Cookies["SGID_usergate"]["User"]);
                string  hash = Convert.ToString(Request.Cookies["SGID_usergate"]["Hash"]);
                string  pass;
                int     type;
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
                            using (MD5 md5Hash = MD5.Create())
                            {
                                if (VerifyMd5Hash(md5Hash, pass, hash))
                                {
                                    switch (type){
                                        case 1:
                                            Response.Redirect("jefatura.aspx");
                                            break;
                                        case 2:
                                            Response.Redirect("docentes.aspx");
                                            break;
                                        case 3:
                                            Response.Redirect("alumnos.aspx");
                                            break;
                                        default:
                                            Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", "alert('Por favor, vuelve a iniciar sesion.');", true);
                                            break;
                                    }
                                    dr.Close();
                                    cn.Close();
                                }
                            }
                        }
                    }
                    catch (Exception eE)
                    {
                        Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", "alert('"+eE.Message+"');", true);
                    }
                }
            }
        }
    }

    [WebMethod]
    public static string peticionLogin(string user, string pass)
    {
        FuncionesGenerales fgclass = new FuncionesGenerales();
        HttpCookie configGalleta = new HttpCookie("SGID_usergate");
        if (fgclass.Autenticar(user, pass).Length > 0)
        {
            configGalleta["User"] = user;
            configGalleta["Hash"] = fgclass.Autenticar(user, pass)[0].TempMD5hashPASS;
            configGalleta.Expires = DateTime.Now.AddDays(1);
            HttpContext.Current.Response.Cookies.Add(configGalleta);
            return fgclass.Autenticar(user, pass)[0].Tipo_De_Usuario.ToString();
        }
        else
        {
            return ":/ Datos Incorrectos, vuelve a intentar";
        }
    }



}
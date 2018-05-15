using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

public class FuncionesGenerales
{

         public static string connectionString = @"uid=sa; pwd=1234; persist Security Info=False; Initial Catalog = pruebas_michelle_SGE_MASTER; Data Source = AUXWAVE-PC\AUXWAVEDB";

/*
    public static string connectionString = @"uid=mrootuser; pwd=.Cio71server.1; persist Security Info=False; Initial Catalog = pruebas_michelle_SGE_MASTER; Data Source = 10.21.1.4";
*/
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

    public class Autenticacion
    {
        public string ID_o_Matricula { get; set; }
        public int Tipo_De_Usuario { get; set; }
        public int EstatusSesion { get; set; }
        public string UltimoInicioSesion { get; set; }
        public string UltimoCierreSesion { get; set; }
        public string UltimaActividad { get; set; }
        public string TempMD5hashPASS { get; set; }
    }

    public Autenticacion[] Autenticar(string user, string pass)
    {
        List<Autenticacion> Detail = new List<Autenticacion>();
        SqlCommand cmd;
        using (SqlConnection cn = new SqlConnection(FuncionesGenerales.connectionString))
        {
            string query;
            query = @"select [ID o MATRICULA], _tipo, _estatusSesion, ultimoInicioSesion, ultimoCierreSesion, ultimaActividad, _tempMD5hash_pass from usuarios where _active = 1 and _user = '{0}' and _pass = '{1}'";
            query = string.Format(query, user, pass);
            cmd = new SqlCommand(query, cn);
            
            cn.Open();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dtGetData = new DataTable();
            da.Fill(dtGetData);
            foreach (DataRow dtRow in dtGetData.Rows)
            {
                Autenticacion DataObj = new Autenticacion();
                DataObj.ID_o_Matricula = dtRow[0].ToString();
                DataObj.Tipo_De_Usuario = Convert.ToInt32(dtRow[1].ToString());
                DataObj.EstatusSesion = Convert.ToInt32(dtRow[2].ToString());
                DataObj.UltimoInicioSesion = dtRow[3].ToString();
                DataObj.UltimoCierreSesion = dtRow[4].ToString();
                DataObj.UltimaActividad = dtRow[5].ToString();
                DataObj.TempMD5hashPASS = dtRow[6].ToString();
                Detail.Add(DataObj);
            }

            if (Detail.ToArray().Length > 0)
            {
                using (MD5 md5Hash = MD5.Create())
                {
                    SqlDataReader dr;
                    string query2;
                    query2 = @"update usuarios set _tempMD5hash_pass = '{0}', ultimoInicioSesion = GETDATE() where [ID o MATRICULA] = '{1}' and _pass = '{2}' and _active = 1";
                    query2 = string.Format(query2, GetMd5Hash(md5Hash, pass), Detail.ToArray()[0].ID_o_Matricula.ToString(), pass);
                    cmd = new SqlCommand(query2, cn);
                    dr = cmd.ExecuteReader();
                }
            }
        }
            return Detail.ToArray();
    }

    public bool logout(string user)
    {
        FuncionesGenerales fgclass = new FuncionesGenerales();

        string stringQueryLogout_Insertar = @"update usuarios set ultimoCierreSesion = GETDATE() where [ID o MATRICULA] = '{0}' and _active = 1";
        SqlConnection conexionSQL;
        SqlCommand comandoSQL;
        SqlDataReader lectorSQL;
        conexionSQL = new SqlConnection(connectionString);
        try
        {
            stringQueryLogout_Insertar = string.Format(stringQueryLogout_Insertar, user.ToString().Trim());
            comandoSQL = new SqlCommand(stringQueryLogout_Insertar, conexionSQL);
            conexionSQL.Open();
            lectorSQL = comandoSQL.ExecuteReader();
            conexionSQL.Close();
            lectorSQL.Close();
            return true;
        }
        catch
        {
            return false;
        }
    }

}
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FormUsingAjax
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class StudentDetails
        {
            public string firstname;
            public string lastname;
            public string email;
            public string phone;
            public string gender;
        }
            [WebMethod]
            public  void SaveData(string firstname, string lastname,string email,string phone,string gender)
            {
            string connection = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(connection))
                {
                    SqlCommand command = new SqlCommand("StudentInsert", con);
                    command.CommandType = System.Data.CommandType.StoredProcedure;
                    con.Open();
                    command.Parameters.AddWithValue("@FirstName", firstname);
                    command.Parameters.AddWithValue("@LastName", lastname);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Phone", phone);
                    command.Parameters.AddWithValue("@Gender", gender);
                    command.ExecuteNonQuery();
                    con.Close();
                    //return "Submit";
                }
            }

        
    }
}
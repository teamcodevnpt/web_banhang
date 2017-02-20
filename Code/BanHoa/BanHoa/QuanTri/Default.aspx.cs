using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BanHoa.App_Code;
namespace BanHoa.QuanTri
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DB DB = new DB();
            DB.getDataFromSQL("select * from luottruycap");
        }
    }
}
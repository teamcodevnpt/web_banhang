<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Data" %>
<script runat="server">
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startu
        RegisterRoutes(RouteTable.Routes);
    }
    protected void Session_Start(object sender, EventArgs e)
    {
        Application.Lock();
        Application["online"] = (Convert.ToInt32(Application["online"])) + 1;
        Application.UnLock();
        try
        {
            clsLuotTruyCap myLuotTruyCap = new clsLuotTruyCap();
            DataTable dts = myLuotTruyCap.select_luottruycap();
            if (dts.Rows.Count > 0)
            {
                Application["homnay"] = dts.Rows[0]["HomNay"].ToString();
                Application["homqua"] = dts.Rows[0]["homqua"].ToString();
                Application["thangnay"] = dts.Rows[0]["thangnay"].ToString();
                Application["tatca"] = dts.Rows[0]["TatCa"].ToString();
            }
        }
        catch
        {

        }
    }
    protected void Session_End(object sender, EventArgs e)
    {
        Application.Lock();
        Application["online"] = (Convert.ToInt32(Application["online"])) - 1;
        Application.UnLock();
    }
    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs
        
    }
    protected void RegisterRoutes(RouteCollection routes)
    {
        routes.MapPageRoute("Trangchu", "Trang-chu", "~/Default.aspx");
        routes.MapPageRoute("Lienhe", "Lien-he", "~/Pages/Lienhe.aspx");
        routes.MapPageRoute("DanhSachSanPham", "Danh-sach-san-pham/{Ten-nhom-san-pham}/{ID_NHOM_SAN_PHAM}", "~/Pages/DanhSachSanPham.aspx");
        routes.MapPageRoute("ChiTietSanPham", "Chi-tiet-san-pham/{Ten-san-pham}/{ID_SAN_PHAM}", "~/Pages/ChiTietSanPham.aspx");
    }
</script>

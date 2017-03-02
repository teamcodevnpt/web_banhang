<%@ Page Title="" Language="C#" MasterPageFile="~/TrangChu.master" AutoEventWireup="true" CodeFile="Lienhe.aspx.cs" Inherits="Pages_Lienhe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="Server">
    <div class="row" style="padding-top:5px;">
        <div class="panel panel-primary">
            <div class="panel-heading">
                Liên hệ với chúng tôi
            </div>
            <div class="panel-body" style="padding: 5px;">
                <h4>Liên hệ:</h4>
                <ul>
                    <asp:Literal ID="ltrLienHe" runat="server"></asp:Literal>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>


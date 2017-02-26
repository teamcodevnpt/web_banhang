<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MNhomHinh.ascx.cs" Inherits="Module_View_MNhomHinh" %>
<script>
    $(document).ready(function () {

        $("#owl-demo").owlCarousel({

            autoPlay: 3000, //Set AutoPlay to 3 seconds
            autoHeight: false,
            items: 4,
            itemsDesktop: [1199, 3],
            itemsDesktopSmall: [979, 3]

        });

    });
</script>
<style>
    #owl-demo .item {
        margin: 3px;
    }

        #owl-demo .item img {
            display: block;
            width: 100%;
            height: 200px;
        }
</style>
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-info">
            <div class="panel-heading"><a style="color:white" href="<%=ResolveUrl("~/Hinh-anh-hoat-dong")%>">HÌNH ẢNH HOẠT ĐỘNG CỦA CÔNG TY</a></div>
            <div class="panel-body">
                <div id="owl-demo" style="text-align:center">
                    <asp:Literal ID="ltr_noidung" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
    </div>
</div>
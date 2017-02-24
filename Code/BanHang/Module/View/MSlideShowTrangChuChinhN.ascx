<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MSlideShowTrangChuChinhN.ascx.cs" Inherits="Module_View_MSlideShowTrangChuChinhN" %>
<script type="text/javascript">
    $(document).ready(function () {

        $("#owl-demo").owlCarousel({
            //navigation: true, // Show next and prev buttons
            slideSpeed: 300,
            paginationSpeed: 400,
            singleItem: true,
            autoPlay: 3000
        });

    });
</script>
<style type="text/css">
    #owl-demo .item img {
        display: block;
        width: 100%;
    }
</style>
<div class="panel panel-primary" style="padding:0px; margin:0px;">
    <div class="panel-body" style="padding:0px; margin:0px;">
        <div id="owl-demo" class="owl-carousel">
            <asp:Literal ID="ltrSilder" runat="server"></asp:Literal>
        </div>
    </div>
</div>


<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SlideShowTrangChuChinh.ascx.cs" Inherits="Module_View_SlideShowTrangChuChinh" %>
<script>
    $(function () {
        // Slideshow 4
        $("#slider4").responsiveSlides({
            auto: true,
            pager: false,
            nav:true,
            speed: 500,
            namespace: "callbacks",
            before: function () {
                $('.events').append("<li>before event fired.</li>");
            },
            after: function () {
                $('.events').append("<li>after event fired.</li>");
            }
        });

    });
</script>
<div class="panel" style ="margin-bottom:0px; padding-bottom:0px;">
    <div class="panel-body" style ="padding:0px; margin-bottom:0px;">
        <div class="callbacks_container" style ="padding:0px; margin-bottom:0px;">
            <ul class="rslides" id="slider4" >
                <asp:Literal ID="ltr_noidung" runat="server"></asp:Literal>
            </ul>
        </div>
    </div>
</div>
<%@ Page Title="" Language="C#" MasterPageFile="~/QuanTri/QuanTri.master" AutoEventWireup="true" CodeFile="test2.aspx.cs" Inherits="QuanTri_test2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTrangChu" Runat="Server">
     <section id="content">
         <div class="container">
        <div id="demo1"></div>
    </div>
    </section>
    <script>
    data1 = [
        ['Google', 1998, 807.80],
        ['Apple', 1976, 116.52],
        ['Yahoo', 1994, 38.66],
    ];

    $('#demo1').jexcel({ data:data1, colWidths: [ 300, 80, 100 ] });
    </script>
</asp:Content>


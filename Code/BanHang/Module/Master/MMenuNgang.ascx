<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MMenuNgang.ascx.cs" Inherits="Module_Master_MMenuNgang" %>
<nav class="navbar navbar-inverse" style="margin-top: 0px; margin-bottom: 10px; background-color:#183544;margin:auto;">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-3">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-3">
            <ul class="nav navbar-nav">
                <asp:Literal ID="ltrMenu" runat="server"></asp:Literal>
            </ul>
        </div>
    </div>
</nav>

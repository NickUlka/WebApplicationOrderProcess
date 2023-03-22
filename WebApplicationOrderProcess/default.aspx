<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="WebApplicationOrderProcess._default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\testDiploma.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" ProviderName="System.Data.SqlClient" SelectCommand="SELECT DISTINCT [Mark_name] FROM [Reciepts]"></asp:SqlDataSource>
    <p>Выберите марку для проверки<p>
    <asp:ListBox ID="ListBox2" runat="server" DataSourceID="SqlDataSource1" DataTextField="Mark_name" DataValueField="Mark_name" Height="186px" Width="133px"></asp:ListBox>
    <p>Количество</p>
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button3" runat="server" Text="Проверить" OnClick="Button3_Click" BackColor="DarkGreen"  ForeColor="White"/>
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Font-Bold="true" ForeColor="DarkGreen" Height="10px" Font-Underline="true"></asp:Label>
    <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>

</asp:Content>

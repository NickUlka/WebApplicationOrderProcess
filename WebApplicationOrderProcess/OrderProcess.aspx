<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderProcess.aspx.cs" Inherits="WebApplicationOrderProcess.OrderProcess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Форма оформления заказа</title>
  <link rel="stylesheet" href="StyleSheet1.css"/>
    </head>
<body>
      <ul>
  <li><a href="default.aspx">Проверка сырья</a></li>
  <li><a href="OrderProcess.aspx">Оформление заказа</a></li>
  <li><a href="ShowOrders.aspx">Просмотр заказов</a></li>
</ul>  
      <form id="form1" runat="server">

          
        <div id="div1">
                 <a>Заказчик</a>
                        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebApplicationOrderProcess.OrderProcessContext" EntityTypeName="" Select="new (Company_name)" TableName="Clients">
                        </asp:LinqDataSource>
              <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="LinqDataSource1"  DataTextField="Company_name" DataValueField="Company_name"></asp:DropDownList>
                         <a>Менеджер</a>
                        <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="WebApplicationOrderProcess.OrderProcessContext" EntityTypeName="" Select="new (Surname)" TableName="Employees">
                        </asp:LinqDataSource>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="LinqDataSource2" DataTextField="Surname" DataValueField="Surname"></asp:DropDownList>
            </div>
         
           <asp:Button ID="Button1" runat="server" Text="Принять заказ" OnClick="Button1_Click" /> 
            <a href="OrderProcess.aspx">Очистить</a>
             <asp:Label ID="LabelInfo" ForeColor="DarkGreen" runat="server" Text=""></asp:Label>
    <asp:Label ID="Label1" ForeColor="Red" runat="server" Text=""></asp:Label>
         
                       
             <div id="div2">
                         <a>Марка</a><asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="WebApplicationOrderProcess.OrderProcessContext" EntityTypeName="" GroupBy="Mark_name" Select="new (key as Mark_name, it as Reciepts)" TableName="Reciepts">
                        </asp:LinqDataSource>
                 <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="LinqDataSource3" DataTextField="Mark_name" DataValueField="Mark_name"></asp:DropDownList>
             <a>Количество</a><asp:TextBox ID="TextBox1" runat="server" Width="109px"></asp:TextBox>
             <a>Статус заказа</a><asp:DropDownList ID="DropDownList7" runat="server">
                            <asp:ListItem>в работе</asp:ListItem>
                            <asp:ListItem>нет сырья</asp:ListItem>
                        </asp:DropDownList>
                  <asp:Button ID="ButtonAdd1" runat="server" Text="+" OnClick="ButtonAdd1_Click" />
                          </div>

          <div id="div3" runat="server" visible="false">
                        <a>Марка</a><asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="LinqDataSource3" DataTextField="Mark_name" DataValueField="Mark_name"></asp:DropDownList>
<a> Количество</a><asp:TextBox ID="TextBox2" runat="server" Width="109px"></asp:TextBox>
             <a>Статус заказа</a><asp:DropDownList ID="DropDownList8" runat="server">
                            <asp:ListItem>в работе</asp:ListItem>
                            <asp:ListItem>нет сырья</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="ButtonAdd2" runat="server" Text="+" OnClick="ButtonAdd2_Click" />
                          </div>

          <div id="div4" runat="server" visible="false">
                             <a>Марка</a><asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="LinqDataSource3" DataTextField="Mark_name" DataValueField="Mark_name"></asp:DropDownList>
<a> Количество</a><asp:TextBox ID="TextBox3" runat="server" Width="109px"></asp:TextBox>
             <a>Статус заказа</a><asp:DropDownList ID="DropDownList3" runat="server">
                            <asp:ListItem>в работе</asp:ListItem>
                            <asp:ListItem>нет сырья</asp:ListItem>
                        </asp:DropDownList>
                             <asp:Button ID="ButtonAdd3" runat="server" Text="+" OnClick="ButtonAdd3_Click" />
                      </div>

             <div id="div5" runat="server" visible="false">
                             <a>Марка</a><asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="LinqDataSource3" DataTextField="Mark_name" DataValueField="Mark_name"></asp:DropDownList>
<a> Количество</a><asp:TextBox ID="TextBox4" runat="server" Width="109px"></asp:TextBox>
             <a>Статус заказа</a><asp:DropDownList ID="DropDownList10" runat="server">
                            <asp:ListItem>в работе</asp:ListItem>
                            <asp:ListItem>нет сырья</asp:ListItem>
                        </asp:DropDownList>
                      </div>
                  
 
</form>
  
</body>
</html>

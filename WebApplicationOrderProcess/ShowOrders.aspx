<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowOrders.aspx.cs" Inherits="WebApplicationOrderProcess.ShowOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Реестр заказов</title>
    <link rel="stylesheet" type="text/css" href="StyleSheet1.css" />
        <style>
       
        .myGrid {
            border: 1px solid #ddd;
            margin: 15px;
            -webkit-border-radius: 3px 3px 0 0;
            -moz-border-radius: 3px 3px 0 0;
            border-radius: 3px 3px 0 0;
        }
        .myGrid td {
            vertical-align:top;
        }
        .header {
            overflow: hidden;
            position: relative;
            border-bottom: 1px solid #ddd;
            height: 30px;
        }
 
            .header th {
                color: #222;
                font-weight: normal;
                line-height: 40px;
                text-align: left;
                text-shadow: 0 1px #FFFFFF;
                white-space: nowrap;
                border-right: 1px solid #ddd;
                border-bottom: 2px solid #ddd;
                padding: 0px 15px 0px 15px;
                -webkit-border-radius: 1px;
                -moz-border-radius: 1px;
            }
 
        .trow1 {
            background: #f9f9f9;
        }
 
        .trow2 {
            background: #fff;
        }
 
            .trow1 td, .trow2 td {
                color: #555;
                line-height: 18px;
                padding: 9px 5px;
                text-align: left;
                border-right: 1px solid #ddd;
                border-bottom: 1px solid #ddd;
                text-align: left;
                
            }
 
        input[type='text'],select {
            border: 1px solid #b8b8b8;
            border-radius: 3px;
            color: #999999;
            float: left;
            height: 22px;
            padding: 0 5px;
            position: relative;
            width: 185px;  
            
        }

        form #div6{
                border-style: solid;
    width: 900px;
    height: 700px;
    display: block;
    background-color: white;
    border-radius: 7px;
    box-shadow: 0px 0px 5px 2px #303732fc;
    padding-top: 10px;
    margin-left: 200px;
    margin-top: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
              <ul>
  <li><a href="default.aspx">Проверка сырья</a></li>
  <li><a href="OrderProcess.aspx">Оформление заказа</a></li>
  <li><a href="ShowOrders.aspx">Просмотр заказов</a></li>
</ul> 
        <div  id="div6">
            <asp:Panel ID="Panel1" runat="server" Height="660px" Width="900px"  Scrollbars ="Auto">
                <asp:GridView ID="GridView1" CssClass="myGrid" RowStyle-CssClass="trow1" AlternatingRowStyle-CssClass="trow2" runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" Height="241px" Width="855px" DataKeyNames="">
                    <Columns>
                        <asp:BoundField DataField="Date" HeaderText="Дата" SortExpression="Date" ReadOnly="True" DataFormatString="{0:d}" HtmlEncode="False" HtmlEncodeFormatString="False" />
                        <asp:BoundField DataField="Mark_name" HeaderText="Марка" SortExpression="Mark_name" ReadOnly="True" />
                        <asp:BoundField DataField="Quantity" HeaderText="Количество" SortExpression="Quantity" ReadOnly="True" />
                        <asp:BoundField DataField="Company_name" HeaderText="Заказчик" SortExpression="Company_name" ReadOnly="True" />
                        <asp:BoundField DataField="Surname" HeaderText="Оформил" SortExpression="Surname" ReadOnly="True" />
                        <asp:TemplateField HeaderText="Статус заказа" SortExpression="Status">
                            <EditItemTemplate>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\testDiploma.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Status] FROM [OrderStatuses]"></asp:SqlDataSource>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Status" DataValueField="Status">
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" UpdateText="Обновить" CancelText="Отмена" EditText="Изменить статус" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\testDiploma.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT ClientsOrders.Date, Employees.Surname, OrderStatuses.Status, ProductionOrders.Quantity, Reciepts.Mark_name, Clients.Company_name FROM Clients INNER JOIN ClientsOrders ON Clients.Clients_Id = ClientsOrders.Client_Id INNER JOIN Employees ON ClientsOrders.Manager_Id = Employees.Manager_Id INNER JOIN ProductionOrders ON ClientsOrders.Order_Id = ProductionOrders.Client_Order_Id INNER JOIN OrderStatuses ON ProductionOrders.Status_Order_Id = OrderStatuses.Status_Id INNER JOIN Reciepts ON ProductionOrders.Product_Id = Reciepts.Reciept_Id"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\testDiploma.mdf;Integrated Security=True;Connect Timeout=30" ProviderName="System.Data.SqlClient" SelectCommand="SELECT ProductionOrders.Quantity, ProductionOrders.Client_Order_Id, ProductionOrders.Status_Order_Id, OrderStatuses.Status, Reciepts.Mark_name, ClientsOrders.Date, Employees.Surname, Clients.Company_name FROM ProductionOrders INNER JOIN OrderStatuses ON ProductionOrders.Status_Order_Id = OrderStatuses.Status_Id INNER JOIN Reciepts ON ProductionOrders.Product_Id = Reciepts.Reciept_Id INNER JOIN ClientsOrders ON ProductionOrders.Client_Order_Id = ClientsOrders.Order_Id INNER JOIN Employees ON ClientsOrders.Manager_Id = Employees.Manager_Id INNER JOIN Clients ON ClientsOrders.Client_Id = Clients.Clients_Id" UpdateCommand="UPDATE ProductionOrders SET Status_Order_Id = @Status_Order_Id FROM ProductionOrders INNER JOIN OrderStatuses ON ProductionOrders.Status_Order_Id = OrderStatuses.Status_Id INNER JOIN Reciepts ON ProductionOrders.Product_Id = Reciepts.Reciept_Id INNER JOIN ClientsOrders ON ProductionOrders.Client_Order_Id = ClientsOrders.Order_Id INNER JOIN Employees ON ClientsOrders.Manager_Id = Employees.Manager_Id INNER JOIN Clients ON ClientsOrders.Client_Id = Clients.Clients_Id">
                    <UpdateParameters>
                        <asp:Parameter Name="Status_Order_Id" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <%--<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="Client_Order_Id" HeaderText="Client_Order_Id" SortExpression="Client_Order_Id" />
                        <asp:BoundField DataField="Status_Order_Id" HeaderText="Status_Order_Id" SortExpression="Status_Order_Id" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:BoundField DataField="Mark_name" HeaderText="Mark_name" SortExpression="Mark_name" />
                        <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                        <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                        <asp:BoundField DataField="Company_name" HeaderText="Company_name" SortExpression="Company_name" />
                    </Columns>
                </asp:GridView>--%>
            </asp:Panel>
        </div>
    </form>
</body>
</html>

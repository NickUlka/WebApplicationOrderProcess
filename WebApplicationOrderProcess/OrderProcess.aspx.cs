using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationOrderProcess
{
    public partial class OrderProcess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private int AddClientOrder()
        {
            using (OrderProcessContext context = new OrderProcessContext())
            {
                ClientsOrders clientOrder = new ClientsOrders();
                string selectedManagerName = DropDownList2.SelectedItem.ToString();
                string selectedCompName = DropDownList1.SelectedItem.ToString();

                Clients client = (from c in context.Clients
                                  where c.Company_name == selectedCompName
                                  select c).Single<Clients>();

                Employees employee = (from emp in context.Employees
                                      where emp.Surname == selectedManagerName
                                      select emp).Single<Employees>();

                clientOrder.Date = DateTime.Now;
                clientOrder.Client_Id = client.Clients_Id;
                clientOrder.Manager_Id = employee.Manager_Id;

                context.ClientsOrders.Add(clientOrder);
                context.SaveChanges();
                LabelInfo.Text = "Заказ оформлен";

                return clientOrder.Order_Id;


            }
        }

    
        private void AddProductionOrder(int clientOrderId, string selectedMark, string selectedStatus, int parsed)
        {
            using (OrderProcessContext context = new OrderProcessContext())
            {
                ProductionOrders productionOrder1 = new ProductionOrders();



                int markId = (from r in context.Reciepts
                              where r.Mark_name == selectedMark
                              select r.Reciept_Id).First();


                int statusId = (from s in context.OrderStatuses
                                where s.Status == selectedStatus
                                select s.Status_Id).First();

                productionOrder1.Client_Order_Id = clientOrderId;
                productionOrder1.Product_Id = markId;
                productionOrder1.Quantity = parsed;
                productionOrder1.Status_Order_Id = statusId;


                    context.ProductionOrders.Add(productionOrder1);
                    context.SaveChanges();

                
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Label1.Text = "";
                LabelInfo.Text = "";
                int parsed;
                int clientOrderId = 0;

                if (!CheckQuantity(TextBox1.Text, out parsed))
                {
                    Label1.Text = "Скорректируйте количество";
                }
                else
                {

                    clientOrderId = AddClientOrder();
                    string selectedMark = DropDownList4.SelectedItem.ToString();
                    string selectedStatus = DropDownList7.SelectedItem.ToString();
                    AddProductionOrder(clientOrderId, selectedMark, selectedStatus, parsed);
                }

                if (div3.Visible)
                {

                    if (!CheckQuantity(TextBox2.Text, out parsed))
                    {
                        Label1.Text = "Скорректируйте количество";
                    }
                    else
                    {
                        string selectedMark = DropDownList5.SelectedItem.ToString();
                        string selectedStatus = DropDownList8.SelectedItem.ToString();

                        AddProductionOrder(clientOrderId, selectedMark, selectedStatus, parsed);
                    }
                }
                if (div4.Visible)
                {

                    if (!CheckQuantity(TextBox3.Text, out parsed))
                    {
                        Label1.Text = "Скорректируйте количество";
                    }
                    else
                    {
                        string selectedMark = DropDownList6.SelectedItem.ToString();
                        string selectedStatus = DropDownList3.SelectedItem.ToString();

                        AddProductionOrder(clientOrderId, selectedMark, selectedStatus, parsed);
                    }
                }
                if (div4.Visible)
                {

                    if (!CheckQuantity(TextBox4.Text, out parsed))
                    {
                        Label1.Text = "Скорректируйте количество";
                    }
                    else
                    {
                        string selectedMark = DropDownList9.SelectedItem.ToString();
                        string selectedStatus = DropDownList10.SelectedItem.ToString();

                        AddProductionOrder(clientOrderId, selectedMark, selectedStatus, parsed);
                    }
                }
            }
           
        }


        private bool CheckQuantity(string textQuantity, out int parse)
        {
            int parsed;
            bool res = int.TryParse(textQuantity, out parsed);
            parse = parsed;
            if (!res || parsed < 0)
            {
                return false;
            }
            else return true;
        }

        protected void ButtonAdd1_Click(object sender, EventArgs e)
        {
            int parsed;
            if (!CheckQuantity(TextBox1.Text, out parsed))
            {
                Label1.Text = "Скорректируйте количество";
            }
            else
            {
                Label1.Text = "";
                div3.Visible = true;
                ButtonAdd1.Visible = false;
            }
        }

        protected void ButtonAdd2_Click(object sender, EventArgs e)
        {
            int parsed;
            if (!CheckQuantity(TextBox2.Text, out parsed))
            {
                Label1.Text = "Скорректируйте количество";
            }
            else
            {
                Label1.Text = "";
                div4.Visible = true;
                ButtonAdd2.Visible = false;
            }
        }

        protected void ButtonAdd3_Click(object sender, EventArgs e)
        {
            int parsed;
            if (!CheckQuantity(TextBox3.Text, out parsed))
            {
                Label1.Text = "Скорректируйте количество";
            }
            else
            {
                Label1.Text = "";
                div5.Visible = true;
                ButtonAdd3.Visible = false;
            }
        }
    }
}
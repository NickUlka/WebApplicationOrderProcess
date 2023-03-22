using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicationOrderProcess
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            using (OrderProcessContext context = new OrderProcessContext())
            {
               
                Label1.Text = "";
                Label2.Text = "";
                string selectedMarkName = ListBox2.SelectedItem.ToString();
                //рассчет сырья для заказа определенной номенклатуры продукции

                //полчение списка количества сырья в рецептуре выбранной марки, отсортированного по номеру сырья
                var quantity1 = from r in context.Reciepts
                                from m in context.Materials
                                where m.Material_Id == r.Material && r.Mark_name == selectedMarkName
                                orderby m.Material_Id
                                select r.Quantity;
                List<decimal> quantity = new List<decimal>();
                quantity = quantity1.ToList();

                //получение списка количества свободного количества сырья на складе, которое входит в выбранную марку,
                // отсортированного по номеру сырья
                var free_stock_quantity1 = from m in context.Materials
                                           from r in context.Reciepts
                                           where m.Material_Id == r.Material && r.Mark_name == selectedMarkName
                                           orderby m.Material_Id
                                           select m.Free_stock_quantity;
                List<decimal> free_stock_quantity = new List<decimal>();
                free_stock_quantity = free_stock_quantity1.ToList();

                //получаем список количества сырья, необходимого для выполнения заказа выбранной марки и количества,
                // и сравниваем со списком свободного сырья на складе
                List<decimal> quantity2 = new List<decimal>();
                int parsed;
                bool res = int.TryParse(TextBox1.Text, out parsed);
                if (!res || parsed < 0)
                {
                    Label2.Text = "Неправильный формат ввода";
                }

                else
                {
                    bool hasQuantity = true;
                    Label2.Text = "";
                    for (var i = 0; i < quantity.Count; i++)
                    {
                        quantity2.Add(quantity[i] * parsed);
                        if (quantity2[i] > free_stock_quantity[i])
                        {
                            hasQuantity = false;
                            break;
                        }
                    }

                    if (hasQuantity == false)
                    {
                        Label1.Text = "Не хватает сырья для данного заказа!";
                    }
                    else
                    {
                        Label1.Text = "Есть сырье для выполнения заказа!";
                    }
                }
            }
        }
    }
}
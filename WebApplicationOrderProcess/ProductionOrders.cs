//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplicationOrderProcess
{
    using System;
    using System.Collections.Generic;

    public partial class ProductionOrders
    {
        public int Production_Order_Id { get; set; }
        public int Client_Order_Id { get; set; }
        public int Product_Id { get; set; }
        public int Quantity { get; set; }
        public int Status_Order_Id { get; set; }

        public virtual ClientsOrders ClientsOrders { get; set; }
        public virtual OrderStatuses OrderStatuses { get; set; }
        public virtual Reciepts Reciepts { get; set; }
    }
}

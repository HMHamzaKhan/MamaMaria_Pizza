//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Pizza
{
    using System;
    using System.Collections.Generic;
    
    public partial class StockHistory
    {
        public int stockHistoryID { get; set; }
        public Nullable<int> stockID { get; set; }
        public Nullable<int> quantityConsumed { get; set; }
        public string comments { get; set; }
        public Nullable<System.DateTime> createdOn { get; set; }
    
        public virtual Stock Stock { get; set; }
    }
}

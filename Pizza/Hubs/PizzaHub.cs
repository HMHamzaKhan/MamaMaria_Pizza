using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pizza.Hubs
{
    public class PizzaHub : Hub
    {
        IHubContext context = GlobalHost.ConnectionManager.GetHubContext<PizzaHub>();
        
       
    }
}
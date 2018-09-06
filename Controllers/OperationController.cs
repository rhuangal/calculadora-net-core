using calculadora_net_core.Models;
using Microsoft.AspNetCore.Mvc;

namespace calculadora_net_core.Controllers
{
    public class OperationController: Controller
    {
        [HttpGet]    
        public ActionResult Index() {    
                return View();    
        }  
          
        [HttpPost]    
        public ActionResult Index(VariableViewModel model, string command) {    
            if (command == "add") {    
                model.Result = model.A + model.B;    
            }    
            if (command == "sub") {    
                model.Result = model.A - model.B;    
            }    
            if (command == "mul") {    
                model.Result = model.A * model.B;    
            }    
            if (command == "div") {    
                model.Result = model.A / model.B;    
            }    
            return View(model);    
        }  
    }
}
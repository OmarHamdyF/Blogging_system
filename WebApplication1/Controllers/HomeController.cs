using BL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace WebApplication1.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Home()
        {
            Logic mylogic = new Logic();
            var mylist= mylogic.AllCategories();
            return View(mylist);
        }
        [HttpPost]
        public ActionResult AddArticle (int mycat, string article,string heading)
        {
            if (Session["admin"] == null)
            {
                return View("AdminLogin");
            }
            else
            {
                Logic mylogic = new Logic();
                //we will expect there is one admin because we did't make register or login session holding id
                mylogic.AddArticle(1, article, mycat, heading);
                return RedirectToAction("Home");
            }
           
        }
        public ActionResult AdminLogin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AfterLogin(string name,int password)
        {
            Logic mylogic = new Logic();
            bool exist=mylogic.LoginCheck(name, password);
            if (exist==true)
            {
                Session["admin"] = name;
                return RedirectToAction("Home");
            }
            else
            {
                return RedirectToAction("Home");
            }
        }

        public ActionResult showcategories()
        {
            Logic mylogic = new Logic();
            ViewBag.allcategories=mylogic.AllCategories();
            return View();
        }
        public ActionResult SelectedCategory(int id)
        {
            Logic mylogic = new Logic();
            ViewBag.articles= mylogic.selectedCategory(id);
            ViewBag.cat_id = id;
            ViewBag.comments = mylogic.articleComments();
            return View();
        }
        [HttpPost]
        public ActionResult Comment(int id,string comment,int cat_id)
        {
            Logic mylogic = new Logic();
            //we will suppose we have one visitor because we did't make register or login session
            mylogic.comment(id, comment, 1);
            return RedirectToAction("SelectedCategory", new RouteValueDictionary(
            new { controller = "Home", action = "SelectedCategory", id = cat_id }));
        }
        [HttpGet]
        public PartialViewResult addToList(int id)
        {
            if (Session["articles"] == null)
            {
                List<int> articles = new List<int>();
                articles.Add(id);
                Session["articles"] = articles;
            }
            else
            {
                List<int> articles = (List<int>)Session["articles"];
                bool alreadyExist = articles.Contains(id);
                if (alreadyExist == false)
                {
                    articles.Add(id);
                    Session["articles"] = articles;
                }
            }

            return PartialView("addToList");
        }
        public ActionResult Listed()
        {
            List<int> articles = (List<int>)Session["articles"];
            Logic mylogic = new Logic();
            ViewBag.articles=mylogic.listedArticles(articles);
            return View();
        }
    }
}
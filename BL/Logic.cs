using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Logic
    {
        BloggingEntities context = new BloggingEntities();
        // a method to add article
        public bool AddArticle(int admin_id,string body,int cat_id,string heading)
        {
            article_table myarticle = new article_table();
            myarticle.admin_id = admin_id;
            myarticle.article_body = body;
            myarticle.cat_id = cat_id;
            myarticle.article_heading = heading;
            context.article_table.Add(myarticle);
            context.SaveChanges();
            return true;
        }

        // method to get all the categories
        public List<CategoryModel> AllCategories()
        {
            return context.category_table.Select(s => new CategoryModel {cat_id=s.cat_id,cat_name=s.cat_name }).ToList();
        }
        // method to get the articles of the selected category
       public List<articleModel> selectedCategory(int cat_id)
        {
            return context.article_table.Where(s => s.cat_id == cat_id).Select(s => new articleModel {article_id=s.article_id,article_body=s.article_body,article_heading=s.article_heading } ).ToList();
        }
        // method to leave a comment on an article
        public bool comment(int article_id,string comment,int visitor)
        {
            comment_table cmt = new comment_table();
            cmt.article_id = article_id;
            cmt.comment_body = comment;
            cmt.visitor_id = visitor;
            context.comment_table.Add(cmt);
            context.SaveChanges();
            return true;
        }
        // method to get all article comments
        public List<commentModel> articleComments()
        {
            return context.comment_table.Select(s => new commentModel { article_id = s.article_id, comment_body = s.comment_body }).ToList();
        }
        // method to get the articles added to list by visitor
        public List<articleModel> listedArticles(List<int> articles)
        {
            List<articleModel> mylist = new List<articleModel>();
            if (articles != null)
            {
                foreach (var item in articles)
                {
                    mylist.Add(context.article_table.Where(s => s.article_id == item).Select(s => new articleModel { article_id = s.article_id, article_heading = s.article_heading, article_body = s.article_body }).FirstOrDefault());
                }

            }
            return mylist; 
        }
        // method to check if admin is existed or not
        public bool LoginCheck(string name,int password)
        {
           var query= context.admin_table.Where(s => s.admin_name == name && s.password == password).Select(s => s).ToList();
            if (query.Count() == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}

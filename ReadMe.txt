Blogging Task By Omar Hamdy

1-install sql server 2014
2-install visual studio 2017
3-Restore Database file Blogging_system.bak by sql server 2014
4-Open Bloggin_system.sln by visual studio 2017
5-we have three layers in solution
 -DAL=>This layer contains database model
 -BL=>This layer contains all business logic methods
 -Blogging_System=>contains one controller(Home)
6-The default view(Home) has navbar with three items
 -Home=>Where admin can add article,assign category to it ,write heading
        and submit article , in case if not logged in he will be redirected
        to admin login page(add "omar"as userName,"1234"as password) because
        we have only one admin and we don't have registeration form ,in case
        of logged in user he is allowed to add article
 -Categories=>It's a dropdown list that has categories name , when we select 
              any of them , we will redirect to a page showing the articles 
              of the selected category where we can leave comment or add 
              any of them to the list
 -Listed articles=>redirect us to a page of the articles added to the list
7-we have image of the ERD of the database (blog.PNG)
# Planning our application
    
Answer Questions
What are we building?
Who are we building it for?
What features do we need to have?
User Stories
Model our Data
Think thought the pages we need in our app
## Questions
What are we building? We are building a personal blog/portfolio website. A place where I can showcase my studies and my works what I made or what I will made. I planning to make e-learning blog post about CSS, HTML, RAILS and much more.
Who are we building it for? We are building it for recruiters and ppl who interested in the web development
What features do we need to have?
Post
Create / Edit / Destroy
Markdown format
Syntax highlight
Comments (Disqus)
Tags
Categories
Create / Edit /Destroy
Portfolio
Create / Edit /Destroy
Add image (Imagemagick)
Contact
Contact form
Sendgrid
User
Devise
Cancancan
Admin panel
Active admin

## User Stories

As a user, I want to be able to create post so that I can share what I learning on my blog.
As a user, I want to edit and destroy my post so I can manage my blog.
As a user, I want to manage my post on an admin panel.
As a user, I want to write my post in markdown format so that it's easy for me.
As a user, I want to be able to highlight the various syntax of code blocks that I share on my blog.
As a user, I want to be able to create portfolios so I can showcase my work to others.
As a user, I want to edit and destroy these so I can manage my portfolio.
As a user, I want to add pictures to the portfolios so It can be nice.
As a user, I want to be able to visitors to contact me through a form on my site.
As a user, I want visitors to be able to leave comments on my posts.
As a user, I want categories to categorize my post so it will be simple to find them.
As a user, I want to use tags to simplify my users case to find similar articles.

## Model our data

         **Posts**
                   title:string
                   content:text
                   categories_id:references
                   has_many :tags
                   has_many :comments
                   belongs_to :categories
                   
         **Categories**
                   title:string
                   has_many :post

          **Tags**
                   name:string
                   belongs_to_many :posts

          **Comment**
                   
                   
         **Projects**
                  title:string
                  description:text
                  link:string

          **User**

## Think through the pages we need in our app

Home
Post#index
Post#show
Projects#index
Projects#show
Categories#index
Categories#show
Contact

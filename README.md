# Rails Crawler

This is an application that crawls two public sources of news from the Brazilian
Government, [The Secretary of Culture](http://cultura.gov.br/categoria/noticias/)
and the [The Secretary of Social Development](https://www.gov.br/cidadania/pt-br/noticias-e-conteudos/desenvolvimento-social/noticias-desenvolvimento-social) using
Ruby on Rails. In this project i've used multi thread programming to improve the
speed of the crawling process.

### Live Demo
[Live Rails Crawler Demo](https://rails-crawler-demo.herokuapp.com/)

### How to run the app locally

* Install Rails on your machine
  [Tutorial link](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04-pt)
* Create a database and run the migrations
  
  `rails db:create && rails db:migrate`
* Install the gems
  
  `bundle install`
* Run the application
  
  `rails s`
* Acess the application at `localhost:3000`


### Usage
* Acces the application and click the **Scrape new posts** button
* Return to the homepage and you'll see the crawler in action as it's currently fetching
and parsing the latest news from the tracked websites.


Made by [Izaias Neto](https://www.github.com/izaiasneto4)
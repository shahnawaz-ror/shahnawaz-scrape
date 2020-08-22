# README

The ruby on rails Application to scrape the link and find the occurance of link in particular page
In the application user need to pass a csv and list of users email to whom the parsed CSV will be sent
In the csv there will be three 2 column
* refferal_link 
* home_link
and there values like below

https://fathomless-castle-93342.herokuapp.com/students,https://en.wikipedia.org/wiki/Shah_Rukh_Khan

So in the first link scrapper will vist and find the occurance of second URL 
You can find the sample csv in root folder
Things you may want to cover:


```
$ rvm  rvm 2.6.4
$ cd /path/to/repos
$ git clone https://github.com/shahnawaz-ror/shahnawaz-scrape
$ cd shahnawaz-scrape
$ bundle install
$ rake db:create #if first time installing
$ rake db:migrate #If there are changes in DB
$ rails s #start the rails application
$ redis-server #in another window

```

* ...

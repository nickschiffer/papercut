# papercut, a free and easy textbook exchange service. :blue_book:

## Table of Contents

- [About](#about)
- [Getting Started](#getting-started)

## About
 The prices of textbook used in Universities had skyrocketed in the 10-15 years.  Most of the textbooks cost over $150 when it is new, even over $200 in some cases.  It would be nice to have a way that help the student to buy or exchange textbook used in our universities without the cost of the middleman (e.g. Amazon).
 
 ## Getting Started
 1. Make sure Ruby, Rails is installed. (Linux or Mac Preferred) (click [here](http://installrails.com/steps/choose_os) for general installation instructions.)

2. Clone the repo
```sh
git clone https://github.com/nickschiffer/papercut.git
cd papercut
```
3. Obtain a Google Maps API Key from [here.](https://developers.google.com/maps/documentation/javascript/get-api-key)

4. Create a config/application.yml file and paste in the following text (substituting your API Key).
```sh
development:
    MAPS_API_KEY: "[YOUR_KEY_HERE]"
```
5. Setup the project and test that the server starts succesfully
```sh
# Install gem dependencies
bundle install --without production

# If you're on linux you may need to do the following to increase your number of watchers
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

# Migrate and reset the databse
rails db:migrate
rails db:reset
rails s
```
6. Navigate to http://localhost:3000/

git push heroku master
yes purecove |  heroku pg:reset DATABASE
heroku run rails db:migrate
heroku run rails db:seed
python -mwebbrowser https://purecove.herokuapp.com/

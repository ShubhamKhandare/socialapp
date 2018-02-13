git push heroku master
heroku pg:reset DATABASE --confirm purecove
heroku run rails db:migrate
heroku run rails db:seed
python -mwebbrowser https://purecove.herokuapp.com/

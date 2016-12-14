**Environment:**
  OS: _Linux 14.04 LTS_
  Ruby: _version: 2.3.0_
  Rails: _version: 5.0.0_
  PostgreSql: _9.5.5_
**Step 1:** clone repo: `git clone git@github.com:hai-lt/managing_devices.git`
**Step 2:**
- Go to **managing_devices** by typing `cd managing_devices` in **terminal**
- create a new file with name: **.evn** then add all of the contruction bellow:

    `DB_PASSWORD_DEV = 'your_password'`

    `DB_DATABASE_NAME_DEV = 'managing_devices_dev'`

    `DB_USERNAME_DEV = 'your_user_name'`

    `DB_DATABASE_NAME_PROD = 'managing_devices'`

**Step 3:** run  `bundle install` to load all gem which is used in this projects
**Step 4:** download and install PostgreSql by following this post ([https://gorails.com/setup/ubuntu/14.04]())
**Step 5:** after installing success, run the command line below to create database automatically
  `rails db:drop db:create db:migrate`
**More**
- `rails server` or `rails s` (shorthand) to start local server to test, Port`3000` is the default on, link: [http://localhost:3000/]()

**Deploy Heroku**
- First of all, you need to setup the Heroku Toolbelt as following the post [https://devcenter.heroku.com/articles/heroku-cli]()
- Then, create an account on [https://heroku.com](), it will allow you to create 5 apps without fee.
- Using terminal to login from your local, with the instruction
```heroku login
```
- continue with the command ```heroku create
``` it will create automatically where you are in your **terminal**
- To deploy the application, the last step is to use Git to push the master branch up to Heroku:
```
git push heroku master
```
Now, you have already owned your website without fee for host, donmain.
_GOOD LUCK!!!_

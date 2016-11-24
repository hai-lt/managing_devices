**Step 1:** clone repo: `git clone git@github.com:hai-lt/managing_devices.git`
**Step 2:**
- Vao thu muc **managing_devices** bang lenh `cd managing_devices`
- Tao file moi voi ten la: **.evn** va them cac dong sau vao trong file

    `DB_PASSWORD_DEV = 'your_password'`
    `DB_DATABASE_NAME_DEV = 'managing_devices_dev'`
    `DB_USERNAME_DEV = 'your_user_name'`
    `DB_DATABASE_NAME_PROD = 'managing_devices'`

**Step 3:** chay cau lenh: `bundle install` de tai cac gem
**Step 4:** tao Database
  `rails db:drop db:create db:migrate`
**More**
- `rails server` hoac `rails s` de khoi dong server, cong mac dinh la `3000`, link: [http://localhost:3000/]()
- `rails console` hoac `rails c` de vao console tuong tac voi Database

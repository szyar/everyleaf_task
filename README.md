# Everyleaf task

<p> This is the task from diver's curriculum. </p>

## Table Schema

- model name
  - Task

| column name | data type |
| ----------- | --------- |
| name        | string    |
| detail      | text      |

### Task

| id  | name | detail | created_at | updated_at |
| --- | ---- | ------ | ---------- | ---------- |
|     |      |        |            |            |
|     |      |        |            |            |
|     |      |        |            |            |

## The Deployment Procedure to Heroku

1. First, precompile the assets by the following command
  <pre>rails assets:precompile RAILS_ENV=production</pre>

2. Second, commit the code changes to github
  <pre>git add -A</pre>
  <pre>git commit -m "finish"</pre>

3. Third, create the heroku app
  <pre>heroku create</pre>

4. Fourth, add the buildpack
  <pre>heroku buildpacks:set heroku/ruby</pre>
  <pre>heroku buildpacks:add --index 1 heroku/nodejs</pre>

5. Fifth, delploy to heroku
  <pre>git push heroku master</pre>

6. Sixth, run database migration
  <pre>heroku run rails db:migrate</pre>

7. And then, check the app name and asset to application
  <pre>heroku config</pre>

## Version Informations

* ruby '2.6.5'
* gem '3.0.3'
* rails, '~> 5.2.4', '>= 5.2.4.3'
* heroku/7.43.0 linux-x64 node-v12.16.2


## Notes for testing with authentication
1. First I created the user in test database using rails console
2. Then, I give the username and password at system spec before   section

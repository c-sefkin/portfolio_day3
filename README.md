## Portfolio

<a href="https://desolate-forest-1909.herokuapp.com/" target="#">Live Portfolio on Heroku</a>

By Chris Sefkin (<a href="https://github.com/c-sefkin" target="#">GitHub</a>)

@ Epicodus Programming School, Portland, OR

GNU General Public License, version 3 (see below). Copyright (c) 2015 Chris Sefkin.

### Description

**Portfolio**

A web app for displaying a personal portfolio.

### Author(s)

Chris Sefkin

### Setup

This app was written in `Rails '4.2.3'`.

Clone this repo with
```console
> git clone https://github.com/c-sefkin/portfolio_day3.git
```

Install gems:

```console
> cd portfolio_rails
> bundle install
```

Create database
```console
> rake db:create
> rake db:migrate
```

Run tests
```console
> rake db:test:prepare
> rspec
```

Start App:
```console
> rails s
> navigate to localhost:3000 in your browser
```

#### Temp Admin/User Accounts

> email:  test@test.com
> password: badpassword

> email: user@user.com
> password: epicodus

#### List of tables
        Name        | Type  
--------------------|-------
skills              | table
projects            | table
users               | table
posts               | table
comments            | table
projects            | table

#### Skills
id  | name     | description | experience | created_at | updated_at
----|----------|-------------|------------|------------|-----------
int | string   | string      | string     | datetime   | datetime

####  Projects

id  | name    | description | github_link | created_at  | updated_at
----|---------|-------------|-------------|-------------|-----------
int | string  | string      | text        | datetime    | datetime

####  Users

Not showing for security reasons.

#### Posts

id  | title  | author | body   | created_at | updated_at
----|--------|--------|--------|------------|-----------
int | string | string | string | datetime   | datetime

#### Comments

id  | author | body   | created_at | updated_at | post_id
----|--------|--------|------------|------------|--------
int | string | string | datetime   | datetime   | int



### License ###
Copyright  (C)  2015  Chris Sefkin

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

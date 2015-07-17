# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Skill.create(name: "Ruby",description: "Object Oriented Language",experience: "Five weeks of intensive instruction at Epicodus", id: 997)
Skill.create(name: "JavaScript/EmberJS",description: "Amazingly Vague and Troubling",experience: "Five weeks of intensive instruction at Epicodus", id: 998)
Skill.create(name: "Rails",description: "Sinatra alternative, usually using Ruby",experience: "Five weeks of intensive instruction at Epicodus", id: 999)


Project.create(name: "Poker, the Greatest", description: "Ruby Week 5 Project", github_link: "www.github.com/jrjamespdx/poker", skill_id: 997)
Project.create(name: "Question and Answer", description: "Code Review for Ember-CLI", github_link: "www.github.com/jrjamespdx/question_and_answer_embercli", skill_id: 998)
Project.create(name: "Portfolio", description: "Code Review for Rails, week 1", github_link: "www.github.com/jrjamespdx/portfolio_rails", skill_id: 999)

User.create(email: "admin@admin.com", password: "epicodus", admin: true)
User.create(email: "user@user.com", password: "epicodus", admin: false)

Post.create(title: "Beginning Post", author: "admin@admin.com", body: "This is a post the Admin user created.", id: 998)
Post.create(title: "Another Post", author: "user@user.com", body: "This is a post the User created.", id: 999)

Comment.create(author: "admin@admin.com", body: "This is a comment the Admin user created.", id: 996, post_id: 998)
Comment.create(author: "user@user.com", body: "This is a comment the User created.", id: 997, post_id: 998)
Comment.create(author: "admin@admin.com", body: "This is a comment the Admin user created.", id: 998, post_id: 999)
Comment.create(author: "user@user.com", body: "This is a comment the User created.", id: 999, post_id: 999)

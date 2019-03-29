# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([
                        {name: 'UserNo1', email: 'UserNo1@mail.ru'},
                        {name: 'UserNo2', email: 'UserNo2@mail.ru'},
                        {name: 'UserNo3', email: 'UserNo3@mail.ru'}
                    ])

categories = Category.create([
                                 {body: 'Web development'},
                                 {body: 'Game development'},
                                 {body: 'Software development'}
                             ])

tests = Test.create([
                        {name: 'Ruby on Rails', level: 3, category_id: categories[0].id},
                        {name: 'C++', level: 2, category_id: categories[1].id},
                        {name: 'Python', level: 1, category_id: categories[2].id}
                    ])

questions = Question.create([
                                {body: 'Question_1_?', test_id: tests[0].id},
                                {body: 'Question_2_?', test_id: tests[1].id},
                                {body: 'Question_3_?', test_id: tests[2].id}])

answers = Answer.create([
                            {answer: 'yes', correct: true, question_id: questions[0].id},
                            {answer: 'no', question_id: questions[0].id},
                            {answer: 'maybe', question_id: questions[0].id}
                        ])

user_tests = UserTest.create([{user_id: users[0].id, test_id: tests[0].id}, {user_id: users[0].id, test_id: tests[1].id}, {user_id: users[0].id, test_id: tests[2].id}])
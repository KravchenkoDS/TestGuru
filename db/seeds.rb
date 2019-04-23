# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create!([
                        {name: 'UserNo1', email: 'UserNo1@mail.ru'},
                        {name: 'UserNo2', email: 'UserNo2@mail.ru'},
                        {name: 'UserNo3', email: 'UserNo3@mail.ru'}
                     ])

categories = Category.create!([
                                 {title: 'Web development'},
                                 {title: 'Game development'},
                                 {title: 'Software development'}
                             ])

tests = Test.create!([
                        {name: 'Ruby on Rails', level: 3, category: categories[0]},
                        {name: 'C++', level: 2, category: categories[1]},
                        {name: 'Python', level: 1, category: categories[2]}
                    ])

questions = Question.create!([
                                {body: 'To be, or not to be, that is the question_1_?', test: tests[0]},
                                {body: 'To be, or not to be, that is the question_2_?', test: tests[1]},
                                {body: 'To be, or not to be, that is the question_3_?', test: tests[2]}])

answers = Answer.create!([
                            {body: 'yes', correct: true, question: questions[0]},
                            {body: 'no', question: questions[0]},
                            {body: 'maybe', question: questions[0]}
                        ])



passed_test = PassedTest.create!([
                                    {user: users[0], test: tests[0], status: 'Finished' },
                                    {user: users[0], test: tests[1], status: 'Not started' },
                                    {user: users[0], test: tests[2], status: 'Not started' }
                                ])

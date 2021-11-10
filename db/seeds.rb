categories = Category.create!(
  [
    { title: "Programming" },
    { title: "HR" },
    { title: "PR" },
    { title: "Marketing" },
  ]
)
users = User.create!(
  [
    { email: "test1@example.com" },
    { email: "test2@example.com" },
    { email: "test3@example.com" },
  ]
)
tests = Test.create!(
  [
    { title: "Ruby", level: 1, author_id: user.first.id, category_id: categories[0].id },
    { title: "HTML", level: 2, author_id: users.first.id, category_id: categories[0].id  },
    { title: "Hunting", level: 3, author_id: users.last.id, category_id: categories[1].id  },
    { title: "Landings", level: 3, author_id: users.first.id, category_id: categories[3].id },
    { title: "Git", level: 1, author_id: users.last.id, category_id: categories[0].id  }
  ]
)

questions = Question.create!(
  [
    { body: "question 1", answer: "answer 1", test_id: tests.first.id },
    { body: "question 2", answer: "answer 2", test_id: tests.first.id },
    { body: "question 3", answer: "answer 3", test_id: tests.last.id },
    { body: "question 4", answer: "answer 4", test_id: tests.first.id },
    { body: "question 5", answer: "answer 5", test_id: tests.last.id },
  ]
)

answers = Answer.create!(
  [
    { body: "answer 1", question_id: questions.first.id },
    { body: "wrong answer", question_id: questions.first.id },
    { body: "wrong answer", question_id: questions.last.id },
    { body: "answer 4", question_id: questions.first.id },
    { body: "answer 5", question_id: questions.last.id },
  ]
)

results = Result.create!(
  [
    { user_id: users.last.id, test_id: tests.first.id },
    { user_id: users.first.id, test_id: tests.last.id },
    { user_id: users.last.id, test_id: tests.last.id },
    { user_id: users.first.id, test_id: tests.first.id },
    { user_id: users.first.id, test_id: tests.last.id },
  ]
)

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
    { title: "Ruby", level: 1, author_id: users.sample.id, category_id: categories.sample.id },
    { title: "HTML", level: 2, author_id: users.sample.id, category_id: categories.sample.id  },
    { title: "Hunting", level: 3, author_id: users.sample.id, category_id: categories.sample.id  },
    { title: "Landings", level: 3, author_id: users.sample.id, category_id: categories.sample.id  },
    { title: "Git", level: 1, author_id: users.sample.id, category_id: categories.sample.id  }
  ]
)

questions = Question.create!(
  [
    { body: "question body", test_id: tests.sample.id },
    { body: "question body", test_id: tests.sample.id },
    { body: "question body", test_id: tests.sample.id },
    { body: "question body", test_id: tests.sample.id },
    { body: "question body", test_id: tests.sample.id },
  ]
)

answers = Answer.create!(
  [
    { body: "answer body", question_id: questions.sample.id },
    { body: "answer body", question_id: questions.sample.id },
    { body: "answer body", question_id: questions.sample.id },
    { body: "answer body", question_id: questions.sample.id },
    { body: "answer body", question_id: questions.sample.id },
  ]
)

results = Result.create!(
  [
    { user_id: users.sample.id, test_id: tests.sample.id },
    { user_id: users.sample.id, test_id: tests.sample.id },
    { user_id: users.sample.id, test_id: tests.sample.id },
    { user_id: users.sample.id, test_id: tests.sample.id },
    { user_id: users.sample.id, test_id: tests.sample.id },
  ]
)

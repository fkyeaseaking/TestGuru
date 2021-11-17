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
    { title: "Ruby", level: 1, author: users.first, category: categories[0] },
    { title: "HTML", level: 2, author: users.first, category: categories[0]  },
    { title: "Hunting", level: 3, author: users.last, category: categories[1]  },
    { title: "Landings", level: 3, author: users.first, category: categories[3] },
    { title: "Git", level: 1, author: users.last, category: categories[0]  }
  ]
)

questions = Question.create!(
  [
    { body: "question 1", answer: "answer 1", test: tests.first },
    { body: "question 2", answer: "answer 2", test: tests.first },
    { body: "question 3", answer: "answer 3", test: tests.last },
    { body: "question 4", answer: "answer 4", test: tests.first },
    { body: "question 5", answer: "answer 5", test: tests.last },
  ]
)

answers = Answer.create!(
  [
    { body: "answer 1", question: questions.first },
    { body: "wrong answer", question: questions.first },
    { body: "wrong answer", question: questions.last },
    { body: "answer 4", question: questions.first },
    { body: "answer 5", question: questions.last },
  ]
)

results = Result.create!(
  [
    { user: users.last, test: tests.first },
    { user: users.first, test: tests.last },
    { user: users.last, test: tests.last },
    { user: users.first, test: tests.first },
    { user: users.first, test: tests.last },
  ]
)

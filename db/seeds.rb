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
tests = Test.create(
  [
    { title: "Ruby", level: 1, author_id: users.sample.id, category_id: categories.sample.id },
    { title: "HTML", level: 2, author_id: users.sample.id, category_id: categories.sample.id  },
    { title: "Hunting", level: 3, author_id: users.sample.id, category_id: categories.sample.id  },
    { title: "Landings", level: 3, author_id: users.sample.id, category_id: categories.sample.id  },
    { title: "Git", level: 1, author_id: users.sample.id, category_id: categories.sample.id  }
  ]
)

questions = []
for i in 1..5
  questions << Question.create!(body: "question ##{i}", test_id: tests.sample.id)
end

for i in 1..5
  Answer.create!(body: "answer ##{i}", question_id: questions.sample.id)
end

for i in 1..5 
  Result.create!(user_id: users.sample.id, test_id: tests.sample.id)
end

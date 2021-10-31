CATEGORY_TITLES = %w(Programming HR PR Marketing).freeze
USERS = [
  { email: "test1@example.com", completed_tests: [1, 2] },
  { email: "test1@example.com", completed_tests: [5] },
  { email: "test1@example.com", completed_tests: [1, 3, 4] },
]

TESTS = [
  { title: "Ruby", level: 1, author_id: 2, category_id: 1 },
  { title: "HTML", level: 2, author_id: 3, category_id: 1 },
  { title: "Hunting", level: 3, author_id: 1, category_id: 2 },
  { title: "Landings", level: 3, author_id: 1, category_id: 3 },
  { title: "Git", level: 1, author_id: 2, category_id: 1 },
].freeze

CATEGORY_TITLES.each { |title| Category.create(title: title) }
USERS.each { |user| User.create(user) }
TESTS.each { |test| Test.create(test) }

for i in 1..5
  Question.create(body: "question ##{i}", test_id: i)
end

for i in 1..5
  Answer.create(body: "answer ##{i}", question_id: i)
end

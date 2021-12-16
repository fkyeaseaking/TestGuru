module ApplicationHelper
  def question_header(action)
    case action
    when :edit
      "Edit #{@question.test.title} question"
    when :create
      "Create new question"
    end
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}/"
  end
end

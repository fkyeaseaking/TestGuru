module QuestionsHelper
  def year
    Time.current.year
  end

  def question_header(question)
    if question.persisted?
      "Edit #{@question.test.title} question"
    else
      "Create new question"
    end
  end

  def github_url(author:, repo:, name:)
    link_to name, "https://github.com/#{author}/#{repo}/", target: "_blank", rel: "nofollow"
  end
end

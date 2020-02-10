class UserFlow < BaseFlow

  def should_be_director
    el("h3.director").should be_on_page
  end

  def should_not_be_director
    el("h3.director").should_not be_on_page
  end

end

require "../spec_helper"

describe "Director flow" do
  it "don't show director header to simple user" do
    user = UserBox.create
    flow = UserFlow.new

    flow.visit Me::Show, as: user
    flow.should_not_be_director
  end

  it "show director header to director user" do
    user = UserBox.create &.email("director@example.com")
    flow = UserFlow.new

    flow.visit Me::Show, as: user
    flow.should_be_director
  end
end

private def should_be_signed_in(flow)
  flow.el("@sign-out-button").should be_on_page
end

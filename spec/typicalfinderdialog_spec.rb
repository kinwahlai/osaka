# encoding: utf-8
require 'osaka'

describe "Osaka::TypicalFinderDialog" do
  
  include(*Osaka::OsakaExpectations)
  subject { Osaka::TypicalFinderDialog.new("Application", at.window(1))}
  let(:control) { subject.control = mock("RemoteControl", :base_location => at.window(1)) }
  
  
  it "Should be able to set the path" do
    expect_keystroke("g", [ :command, :shift ])
    expect_wait_until_exists(at.sheet(1))
    expect_set("value", at.text_field(1).sheet(1), "path")
    expect_click(at.button("Go").sheet(1))
    expect_wait_until_not_exists(at.sheet(1))
    subject.set_folder("path")
  end

  it "Won't change the path when the path is the current one" do
    control.should_not_receive(:keystroke)
    subject.set_folder(".")
  end
  
end

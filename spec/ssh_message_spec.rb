require "spec_helper"

describe SshMessage do
  it "has a version number" do
    expect(SshMessage::VERSION).not_to be nil
  end

  it "composes an ssh message" do
    info = {
      :kernel => "Linux 3.1.2",
      :user => "runner",
      :project_name => "semaphore",
      :branch_name => "is/pretty_ssh_message",
      :commit_sha => "b50069befccb8e6c31f14c142af96699101b4ee3",
      :build_number => 23,
      :job_count => 64,
      :job_index => 12
    }

expected_message = <<HERE
           *****      *****
          ******************                Welcome to Semaphore's SSH session
           *****************
           *****************                Kernel: Linux 3.1.2
        *******************                 User: runner
  ***********************    *******
  *********************    *********        Project: semaphore
  ********************    ***********       Branch: is/pretty_ssh_message
   ************         ***********         Commit: b50069befccb8e6c31f14c142af96699101b4ee3
    **********          **********          Build Number: 23
    **********          **********          Job: 12/64
    **********          **********
   ***********         ************         Lorem ipsum dolor sit amet, ex sea possim probatus. Et ignota discere
 ***********    *********************       his. Nam partem facete cu. Molestie appetere accommodare has ex,
  *********   **********************        velit deseruisse est ex, audire inimicus mei cu. Vix nobis discere
   ******    **********************         eu, augue patrioque nam no. Audire sanctus at sit, eum no veri
           *******************              homero. Ex cotidieque adversarium vis, in sint fierent
          ******************                corrumpit mel, an qui civibus accusamus. Ius id stet
          ******************                copiosae. Ad pri omnes graeci.
         *******************
          ******      *****                 https://semaphoreci.com/docs
HERE

    message = without_colors(SshMessage.compose(info)).split("\n").map(&:rstrip).join("\n") + "\n"

    expect(message).to eq(expected_message)
  end

  def without_colors(string)
    string.gsub(/\e\[\d+m/, "")
  end
end

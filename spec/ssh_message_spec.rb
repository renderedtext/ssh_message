require "spec_helper"

describe SshMessage do
  it "has a version number" do
    expect(SshMessage::VERSION).not_to be nil
  end

  def without_colors(string)
    string.gsub(/\e\[\d+m/, "")
  end

  let(:info) {{
    :kernel => "Linux 3.1.2",
    :user => "runner",
    :project_name => "semaphore",
    :branch_name => "is/pretty_ssh_message",
    :commit_sha => "b50069befccb8e6c31f14c142af96699101b4ee3",
    :build_number => 23,
    :job_count => 64,
    :job_index => 12
  }}

  it "composes a string" do
    # dummy test for easy visual testing
    message = SshMessage.compose(info)

    puts message

    expect(message).to be_instance_of(String)
  end

  it "composes an ssh message" do
expected_message = <<HERE
                                            Let's get started!
           *****      *****
          ******************                This is the place for testing out your CI box,
           *****************                running your tests manually, or catching the final
           *****************                bug that prevents your tests from turning green.
        *******************
  ***********************    *******        Use the semaphore command to display and run commands.
  *********************    *********
  ********************    ***********       This Semaphore Box contains:
   ************         ***********
    **********          **********          Kernel: Linux 3.1.2
    **********          **********          User: runner
    **********          **********          Project: semaphore
   ***********         ************         Branch: is/pretty_ssh_message
 ***********    *********************       Commit: b50069befccb8e6c31f14c142af96699101b4ee3
  *********   **********************        Build Number: 23
   ******    **********************         Job: 12/64
           *******************
          ******************                For additional information, please consult our
          ******************                documentation at https://semaphoreci.com/docs, or
         *******************                contact us on support. We are always happy to help!
          ******      *****
                                            Happy building :)
HERE

    message = without_colors(SshMessage.compose(info)).split("\n").map(&:rstrip).join("\n") + "\n"

    expect(message).to eq("\n" + expected_message)
  end

  it "keeps the lenght of lines under 100 characters" do
    message_lines = without_colors(SshMessage.compose(info)).split("\n")

    message_lines.each do |line|
      puts line
      expect(line.size).to be < 100
    end
  end
end

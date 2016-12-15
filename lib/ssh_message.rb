require "ssh_message/version"
require "ssh_message/colors"
require "ssh_message/logo"
require "ssh_message/legend"

module SshMessage
  module_function

  def compose(info = {})
    logo = SshMessage::Logo.lines
    legend = SshMessage::Legend.new(info).lines

    logo.zip(legend).map { |pair| "#{pair[0]}     #{pair[1]}" }.join("\n")
  end

end

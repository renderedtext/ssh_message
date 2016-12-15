module SshMessage
  class Legend

    attr_reader :info

    def initialize(info = {})
      @info = info
    end

    def lines
      [
        "Let's get started!",
        "",
        "This is the place for testing out your CI box,",
        "running your tests manually, or catching the final",
        "bug that prevents your tests from turning green.",
        "",
        "This Semaphore Box contains:",
        "",
        render_line("Kernel", info.fetch(:kernel)),
        render_line("User",   info.fetch(:user)),
        render_line("Project", info.fetch(:project_name)),
        render_line("Branch", info.fetch(:branch_name)),
        render_line("Commit", info.fetch(:commit_sha)),
        render_line("Build Number", info.fetch(:build_number)),
        render_line("Job", "#{info.fetch(:job_index)}/#{info.fetch(:job_count)}"),
        "",
        "For additional information, please consult our",
        "documentation at " + SshMessage::Colors.yellow("https://semaphoreci.com/docs") + ", or",
        "contact us on support. We are always happy to help!",
        "",
        "Happy building :)"
      ]
    end

    private

    def render_line(title, value)
      SshMessage::Colors.yellow("#{title}: ") + value.to_s
    end
  end
end

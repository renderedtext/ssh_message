module SshMessage
  class Legend

    TITLE = "Welcome to Semaphore's SSH session"

    attr_reader :info

    def initialize(info = {})
      @info = info
    end

    def lines
      [
        "",
        SshMessage::Colors.cyan(TITLE),
        "",
        render_line("Kernel", info.fetch(:kernel)),
        render_line("User",   info.fetch(:user)),
        "",
        render_line("Project", info.fetch(:project_name)),
        render_line("Branch", info.fetch(:branch_name)),
        render_line("Commit", info.fetch(:commit_sha)),
        render_line("Build Number", info.fetch(:build_number)),
        render_line("Job", "#{info.fetch(:job_index)}/#{info.fetch(:job_count)}"),
        "",
        "Lorem ipsum dolor sit amet, ex sea possim probatus.",
        "Et ignota discere his. Nam partem facete cu. Molestie",
        "velit deseruisse est ex, audire inimicus mei cu.",
        "eu, augue patrioque nam no. Audire sanctus at sit,",
        "homero. Ex cotidieque adversarium vis, in sint",
        "corrumpit mel, an qui civibus accusamus. Ius id stet",
        "copiosae. Ad pri omnes graeci.",
        "",
        "https://semaphoreci.com/docs"
      ]
    end

    private

    def render_line(title, value)
      SshMessage::Colors.cyan("#{title}: ") + value.to_s
    end
  end
end

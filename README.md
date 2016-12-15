# Ssh Message

Render awesome motd messages for Semaphore's SSH sessions.

![docs/dark.png]
![docs/light.png]

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ssh_message'
```

## Usage

To compose an ssh message, do the following:

``` ruby
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

SshMessage.compose(info)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/renderedtext/ssh_message. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

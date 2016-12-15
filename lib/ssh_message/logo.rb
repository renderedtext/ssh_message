module SshMessage
  module Logo
    module_function

    ASCII_DATA = [
      "           *****      *****            ",
      "          ******************           ",
      "           *****************           ",
      "           *****************           ",
      "        *******************            ",
      "  ***********************    =======   ",
      "  *********************    =========   ",
      "  ********************    ===========  ",
      "   ************         ===========    ",
      "    **********          ==========     ",
      "    **********          ==========     ",
      "    **********          ==========     ",
      "   ***********         ============    ",
      " ***********    =====================  ",
      "  *********   ======================   ",
      "   ******    ======================    ",
      "           ===================         ",
      "          ==================           ",
      "          ==================           ",
      "         ===================           ",
      "          ======      =====            "
    ]

    def lines
      ASCII_DATA.map do |line|
        line.split("").map do |c|
          case c
          when "*" then SshMessage::Colors.red(c)
          when "=" then SshMessage::Colors.green("*")
          else c
          end
        end.join
      end
    end

  end
end
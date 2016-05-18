require 'chef/knife/swap_base'

class Chef
  # knife
  class Knife
    include Chef::Knife::SwapBase

    # default command without parameters
    class Swap < Knife
      banner 'knife swap CONFIG'

      def run
        if @name_args.length == 0
          print_current_configs
          print_available_configs
        else
          use_config(@name_args[0])
        end
      end
    end

    # # command to set your default knife.rb config
    # class RackUse < Knife
    #   banner 'knife rack use CONFIG'
    #
    #   def run
    #     use_config(@name_args[0])
    #   end
    # end
  end
end

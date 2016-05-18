require 'chef/knife/swap_base'

class Chef
  # knife
  class Knife
    include Chef::Knife::SwapBase

    # default command without parameters
    class Swap < Knife
      # banner help
      banner 'knife swap CONFIG'

      # begin
      def run
        if @name_args.empty?
          print_current_configs
          print_available_configs
        else
          use_config(@name_args[0])
        end
      end
    end
  end
end

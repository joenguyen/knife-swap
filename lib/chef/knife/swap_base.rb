# top level class
class Chef
  # knife sub class
  class Knife
    # base module
    module SwapBase
      require 'fileutils'

      # get knife config if exists otherwise return ''
      def knife_config
        ::Chef::Knife.config_loader.config_location.nil? ? '' : ::Chef::Knife.config_loader.config_location
      end

      # get .chef dir but default to homedir/.chef if config cant be found
      def chef_dir
        knife_config == '' ? File.join(File.expand_path('~'), '.chef') : File.dirname(knife_config)
      end

      # get available configs
      def available_configs
        Dir.glob(File.join(chef_dir, 'knife-*.rb')).sort
      end

      # print available configs
      def print_available_configs
        puts Chef::Knife.ui.color('available configs:', :cyan).to_s
        available_configs.each do |cfg|
          puts ' * ' + File.basename(cfg, '.rb').split('-')[1..-1].join('-')
        end
      end

      # compare file contents
      def compare_configs(c1, c2)
        File.read(c1) == File.read(c2)
      end

      # returns matching configuration file(s) matching the current knife.rb.
      # it is possible that there are multiple knife-*.rb files that match.  in
      # this case, it will return all matches.
      def current_configs
        matches = []
        unless File.exist?(knife_config)
          puts 'knife swap CONFIG'
          print_available_configs
          exit 1
        end
        available_configs.each do |config|
          matches << config if compare_configs(knife_config, config)
        end
        matches
      end

      # print configs currently being used
      def print_current_configs
        configs = []
        current_configs.each do |cfg|
          configs << File.basename(cfg, '.rb').split('-')[1..-1].join('-')
        end
        puts "#{Chef::Knife.ui.color('current[', :cyan)}#{configs.join(',')}#{Chef::Knife.ui.color(']', :cyan)}"
      end

      # copy config to knife.rb
      def use_config(config)
        found = ''

        # look for matching knife-config.rb
        available_configs.each do |file|
          if config == File.basename(file, '.rb').split('-')[1..-1].join('-')
            found = file
            break
          end
        end

        # evaluate
        if found.empty?
          puts Chef::Knife.ui.color("'#{config}' is not a valid config.", :red, :bold).to_s
          print_current_configs
          print_available_configs
        else
          knife_path = (knife_config.empty? ? File.join(chef_dir, 'knife.rb') : knife_config)
          FileUtils.copy(found, knife_path)
          print_current_configs
        end
      end
    end
  end
end

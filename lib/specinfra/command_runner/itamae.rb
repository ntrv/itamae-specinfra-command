require 'specinfra/command_runner/base'

module Specinfra
  module CommandRunner
    class Itamae < Specinfra::CommandRunner::Base
      # Itamae::NodeからItamae::Backend::*もしくはSpecinfra::Backend::*を取りだす。
      def initialize(node)
        super
        # nodeオブジェクト内からインスタンス変数@backendを取りだす
        @backend = node.instance_variable_get(:@backend)
      end

      def specinfra_command(type, *args)
        @backend.get_command(type, *args)
      end
    end
  end
end

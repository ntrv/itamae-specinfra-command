require 'specinfra/command_runner/base'

module Specinfra
  module CommandRunner
    class Serverspec < Specinfra::CommandRunner::Base
      # Specinfra.backendを受け取る想定
      def initialize(backend)
        @backend = backend
      end

      def specinfra_command(type, *args)
        @backend.command.get(type, *args)
      end
    end
  end
end

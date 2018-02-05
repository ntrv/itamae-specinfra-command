require 'itamae/specinfra/command/base'

module Specinfra
  module CommandRunner
    class Serverspec < Specinfra::CommandRunner::Base
      # Specinfra.backendを受け取る想定
      def initialize(backend)
        super
        @backend = backend
      end

      def specinfra_command(type, *args)
        @backend.command.get(type, *args)
      end
    end
  end
end

require 'itamae/specinfra/command/base'

module Itamae
  module Specinfra
    module Command
      class Serverspec < Itamae::Specinfra::Command::Base
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
end

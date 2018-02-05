require 'itamae/specinfra/command/version'
require 'itamae'
require 'specinfra'

module Itamae
  module Specinfra
    module Command
      class Base
        def initialize
        end

        # typeを指定してspecinfraを呼び出すためのメソッド
        # 以下のURLのコードとほぼ同じ
        # https://github.com/itamae-kitchen/itamae/blob/v1.9.11/lib/itamae/resource/base.rb#L316
        # typeにはsymbolを指定, 命名規則は以下のURLのmethを参照
        # https://github.com/mizzy/specinfra/blob/v2.72.1/lib/specinfra/command_factory.rb#L61
        def run_specinfra(type, *args)
          # 例えば以下のURLのcheck_is_ec2_instanceメソッドのコマンドを実行したい場合
          # https://github.com/mizzy/specinfra/blob/v2.72.1/lib/specinfra/command/base/localhost.rb#L3
          # typeには:check_localhost_is_ec2_instanceを指定する
          cmd = specinfra_command(type, *args)

          # typeにcheck_の文字が入っている場合check_commandを実行
          if type.to_s.start_with?('check_')
            check_command(cmd)
          else
            run_command(cmd)
          end
        end

        # Specinfraのコマンドを文字列で返す
        def specinfra_command(type, *args)
          raise NoImplementedError
        end

        # backend上でコマンドの実行結果のステータスコードが0かどうかを返す
        # 以下のURLのコードとほぼ同じ
        # https://github.com/itamae-kitchen/itamae/blob/v1.9.11/lib/itamae/resource/base.rb#L306
        def check_command(*args)
          args << {} unless args.last.is_a?(Hash)
          args.last[:error] = false
          run_command(*args).exit_status == 0
        end

        # backend上でコマンドを実行するためのメソッド, 配列で指定する
        # 以下のURLのコードとほぼ同じ
        # https://github.com/itamae-kitchen/itamae/blob/v1.9.11/lib/itamae/resource/base.rb#L295
        def run_command(*args)
          args << {} unless args.last.is_a?(Hash)
          @backend.run_command(*args)
        end
      end
    end
  end
end

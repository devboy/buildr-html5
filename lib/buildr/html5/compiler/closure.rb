module Buildr
  module Html5
    module Compiler
      class Closure < Buildr::Compiler::Base
        specify :language => :javascript,
                :sources => :js, :source_ext => :js,
                :target_ext => "js",
                :packaging => :js

        COMPILE_OPTIONS = [:warnings, :debug]

        def initialize(project, options)
          super
          options[:debug] = Buildr.options.debug if options[:debug].nil?
          options[:warnings] ||= true
        end

        # We need to add the maven central repository so buildr will find the closure compiler
        Buildr.repositories.remote << "http://repo2.maven.org/maven2"

        # This is a constant with closure info, the version at the end should be made dynamic
        CLOSURE_SPEC = 'com.google.javascript:closure-compiler:jar:r1592'

        def compile(sources, target, dependencies)
          check_options options, COMPILE_OPTIONS
          # Buildr will make an artifact task which takes care of finding it in the maven repo,
          # and downloading it automatically
          # We call invoke to start that process
          closure_jar = Buildr.artifact(CLOSURE_SPEC)
          closure_jar.invoke

          # We create an array with arguments
          cmd_args = [] << "-jar" << "#{closure_jar.to_s}"

          unless Buildr.application.options.dryrun
            Java::Commands.java cmd_args
          end

        end

        def needed?(sources, target, dependencies)
          true
        end

      end
    end
  end
end

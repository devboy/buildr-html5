module Buildr
  module Html5
    module Compiler
      class Closure < Buildr::Compiler::Base
        specify :language => :javascript,
                :sources => :js, :source_ext => :js,
                :target_ext => "js",
                :packaging => :js

        COMPILE_OPTIONS = [:warnings, :debug, :output]

        def initialize(project, options)
          super
          options[:debug] = Buildr.options.debug if options[:debug].nil?
          options[:warnings] ||= true
        end

        # We need to add the maven central repository so buildr will find the closure compiler
        Buildr.repositories.remote << "http://repo2.maven.org/maven2"

        # This is a constant with closure info, the version at the end should be made dynamic
        CLOSURE_SPEC = 'com.google.javascript:closure-compiler:jar:r1592'
        DEPENDENCIES = [Buildr.artifact("args4j:args4j:jar:2.0.12"),Buildr.artifact("com.google.guava:guava:jar:r07")]

        def compile(sources, target, dependencies)
          check_options options, COMPILE_OPTIONS
          # Buildr will make an artifact task which takes care of finding it in the maven repo,
          # and downloading it automatically
          # We call invoke to start that process
          closure_jar = Buildr.artifact(CLOSURE_SPEC)
          closure_jar.invoke
          DEPENDENCIES.map(&:invoke)

          # We create an array with arguments
          cmd_args = [] << "-classpath" << (DEPENDENCIES + [closure_jar]).map(&:to_s).join(File::PATH_SEPARATOR) << "com.google.javascript.jscomp.CommandLineRunner"
          # We add our source js file
          cmd_args += generate_source_args sources
          # We add our output file
          cmd_args << "--js_output_file" << File.join( target, options[:output] || "#{@project.name}.js" )


          unless Buildr.application.options.dryrun
            Java::Commands.java cmd_args
          end

        end

        def needed?(sources, target, dependencies)
          true
        end

        protected

        def generate_source_args sources
          source_args = []
          source_files = []
          sources.each{ |source_dir| source_files += Dir.glob(File.join(source_dir,"**","*.js"))}
          source_files.each{ |source_file| source_args << "--js" << source_file }
          source_args
        end

      end
    end
  end
end

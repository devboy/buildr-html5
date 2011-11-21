module Buildr
  module Html5
    module Compiler
      class Closure < Buildr::Compiler::Base
        specify :language => :javascript,
                :sources => :js, :source_ext => :js,
                :target_ext => "js",
                :packaging => :js

        def compile(sources, target, dependencies)
          super
        end

        def needed?
          true
        end

      end
    end
  end
end

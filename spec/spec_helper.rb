require "pd"

$spec_root = File.expand_path("..", __FILE__)

RSpec.configure do |config|
  def capture(stream=:stdout)
		require "stringio"
    begin
      stream = stream.to_s
      eval "$#{stream} = StringIO.new"
      yield
      result = eval("$#{stream}").string
    ensure
      eval("$#{stream} = #{stream.upcase}")
    end

    result
  end

  alias :silence :capture
end

module RSpec
  module Core
    module DSL
      def xdescribe(*args, &blk)
        describe *args do
          pending 
        end
      end

      alias xcontext xdescribe
    end
  end
end

def public_all_methods(*klasses)
	klasses.each {|klass|
		klass.class_eval {
      public *(self.protected_instance_methods(false) + self.private_instance_methods(false))
      public_class_method *(self.protected_methods(false) + self.private_methods(false))
    }
	}
end

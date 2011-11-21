require File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'spec_helper'))

describe Buildr::Html5::Compiler::Closure do

  it 'should identify itself from source directories' do
    write 'src/main/js/test.js', '"my awesome js"'
    define('foo').compile.compiler.should eql(:closure)
  end

  it 'should report the language as :javascript' do
    define('foo').compile.using(:closure).language.should eql(:javascript)
  end

  it 'should set the target directory to target' do
    define 'foo' do
      lambda { compile.using(:closure) }.should change { compile.target.to_s }.to(File.expand_path('target'))
    end
  end

  it 'should not override existing target directory' do
    define 'foo' do
      compile.into('classes')
      lambda { compile.using(:closure) }.should_not change { compile.target }
    end
  end

  it 'should not change existing list of sources' do
    define 'foo' do
      compile.from('sources')
      lambda { compile.using(:closure) }.should_not change { compile.sources }
    end
  end

  after do
    Buildr.options.debug = nil
    ENV.delete "debug"
    ENV.delete "DEBUG"
  end
end
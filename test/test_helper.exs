defmodule Test do
  require ExampleLogger

  def run do
    exclude = []
    #if Node.alive?, do: [], else: [distributed: true]
    ExUnit.start(exclude: exclude)
    ExampleLogger.log("This is a log message")
  end
end

Test.run()

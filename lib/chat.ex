defmodule Chat do
  @moduledoc """
  Documentation for `Chat`.
  """

  def receive_message(message) do
    IO.puts message
  end

  def send_message(recipient, message) do
    spawn_task(__MODULE__, :receive_message, recipient, [message])
  end

  def spawn_task(module, fun, recipient, args) do
    recipient
    |> remote_supervisor()
    |> Task.Supervisor.async(module, fun, args)
    |> Task.await()
  end

  defp remote_supervisor(recipient) do
    require IEx; IEx.pry

    Application.get_env(:chat, :remote_supervisor).(recipient)
  end
end

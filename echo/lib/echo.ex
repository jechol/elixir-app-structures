defmodule Echo do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: :echo)
  end
  
  def handle_cast(msg, state) do
    IO.puts ":echo received #{msg}"
    {:noreply, state}
  end
end

# https://hexdocs.pm/iex/1.10.4/IEx.html#module-the-iex-exs-file
# https://alchemist.camp/episodes/iex-exs

defmodule Custom.IEx do
  def exit(), do: System.halt()
  def quit(), do: System.halt()
  def q(), do: System.halt()
end

import_if_available(Custom.IEx, only: [exit: 0, quit: 0, q: 0])

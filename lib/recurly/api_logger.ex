defmodule Recurly.APILogger do
  @moduledoc """
  Module for logging HTTP requests and responses.

  ## TODO
  - Need to implement filtering keys and PII
  """
  require Logger
  alias HTTPoison.Response

  @doc """
  Logs the request.
  """
  def log_request(method, endpoint, body, headers, options) do
    Logger.info "#{method} #{endpoint}"
    Logger.debug """
      body: #{body},
      headers: #{inspect headers},
      options: #{inspect options}
    """
  end

  @doc """
  Logs the response.
  """
  def log_response({:ok, response = %Response{}}, method, endpoint) do
    Logger.info "#{method} #{endpoint} -> #{response.status_code}"
    Logger.debug """
      body: #{response.body}
      headers: #{inspect response.headers}
    """
    {:ok, response}
  end
  def log_response(response), do: response
end

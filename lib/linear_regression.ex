defmodule Numerix.LinearRegression do
  @moduledoc """
  Linear regression functions.
  """

  import Numerix.Statistics

  @doc """
  Least squares best fit for points `{x, y}` to a line `y:x↦a+bx`
  where `x` is the predictor and `y` the response.

  Returns a tuple containing the intercept `a` and slope `b`.
  """
  @spec fit([number], [number]) :: {float, float}
  def fit([], _), do: nil
  def fit(_, []), do: nil
  def fit(xs, ys) when length(xs) != length(ys), do: nil
  def fit(xs, ys) do
    x_mean = xs |> mean
    y_mean = ys |> mean
    variance = xs |> variance
    covariance = xs |> covariance(ys)
    slope = covariance / variance
    intercept = y_mean - (slope * x_mean)
    {intercept, slope}
  end
end

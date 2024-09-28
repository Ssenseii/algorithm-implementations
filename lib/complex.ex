defmodule Complex do
  defstruct real: 0, image: 0

  @type t :: %Complex{real: float, image: float}

  def add(%Complex{real: r1, image: i1}, %Complex{real: r2, image: i2}) do
    %Complex{real: r1 + r2, image: i1 + i2}
  end

  def subtract(%Complex{real: r1, image: i1}, %Complex{real: r2, image: i2}) do
    %Complex{real: r1 - r2, image: i1 - i2}
  end

  def multiply(%Complex{real: r1, image: i1}, %Complex{real: r2, image: i2}) do
    %Complex{
      real: r1 * r2 - i1 * i2,
      image: r1 * i2 + i1 * r2
    }
  end

  def divide(%Complex{real: r1, image: i1}, %Complex{real: r2, image: i2}) do
    denom = r2 * r2 + i2 * i2

    %Complex{
      real: (r1 * r2 + i1 * i2) / denom,
      image: (i1 * r2 - r1 * i2) / denom
    }
  end

  def to_string(%Complex{real: r, image: i}) do
    "#{r} + #{i}i"
  end

  def modulus(%Complex{real: r, image: i}) do
    :math.sqrt(r * r + i * i)
  end

  def conjugate(%Complex{real: r, image: i}) do
    %Complex{real: r, image: -i}
  end

  def exponentiate(%Complex{real: r, image: i}, n) when is_integer(n) do
    case n do
      0 -> %Complex{real: 1, image: 0}
      _ -> exponentiate_helper(%Complex{real: r, image: i}, n)
    end
  end

  defp exponentiate_helper(_, 0), do: %Complex{real: 1, image: 0}
  defp exponentiate_helper(c, n) do
    multiply(c, exponentiate_helper(c, n - 1))
  end

  def magnitude(%Complex{real: r, image: i}) do
    :math.sqrt(:math.pow(r, 2) + :math.pow(i, 2));
  end

  def argument(%Complex{real: r, image: i}) do
    1 / :math.tan(i / r);
  end

  def polar_form_conversion(%Complex{real: r, image: i}) do
    re = magnitude(%Complex{real: r, image: i});
    teta = argument(%Complex{real: r, image: i})
    form = re * (:math.cos(teta) + :math.sin(teta));
    {re, teta, form}
  end

  def polar_form_representation(%Complex{real: r, image: i}) do
    re = magnitude(%Complex{real: r, image: i});
    teta = argument(%Complex{real: r, image: i})
    "#{re} * (cos#{teta}+ sin#{teta})"
  end

  def exponential_form(%Complex{real: r, image: i}) do
    {re, teta, _} = polar_form_conversion(%Complex{real: r, image: i})
    "#{re} * exp(#{teta}i)"
  end

  def square_root(%Complex{real: r, image: i}) do
    {re, theta} = polar_form_conversion(%Complex{real: r, image: i})
    sqrt_re = :math.sqrt(re)
    sqrt_theta = theta / 2
    {sqrt_re * :math.cos(sqrt_theta), sqrt_re * :math.sin(sqrt_theta)}  # Returns the square root in rectangular form
  end

  def raise_to_power(%Complex{real: r, image: i}, n) do
    {re, theta} = polar_form_conversion(%Complex{real: r, image: i})
    new_re = :math.pow(re, n)
    new_theta = n * theta
    {new_re * :math.cos(new_theta), new_re * :math.sin(new_theta)}  # Returns z^n in rectangular form
  end

  def root_extraction(%Complex{real: r, image: i}, n) do
    {re, theta} = polar_form_conversion(%Complex{real: r, image: i})
    root_re = :math.pow(re, 1 / n)

    # Create a list of roots using list comprehension
    roots = for k <- 0..(n-1) do
      {root_re * :math.cos((theta + 2 * :math.pi * k) / n), root_re * :math.sin((theta + 2 * :math.pi * k) / n)}
    end

    roots  # Return the list of roots
  end

  def complex_exponentiation(%Complex{real: r, image: i}) do
    e_to_r = :math.exp(r)
    {e_to_r * :math.cos(i), e_to_r * :math.sin(i)}  # Returns e^z in rectangular form
  end

  def logarithm(%Complex{real: r, image: i}) do
    {re, theta} = polar_form_conversion(%Complex{real: r, image: i})
    { :math.log(re), theta }  # Returns log(z) as {ln|z|, arg(z)}
  end

  def sine(%Complex{real: r, image: i}) do
    sin_r = :math.sin(r) * :math.cosh(i)
    cos_r = :math.cos(r) * :math.sinh(i)
    {sin_r, cos_r}  # Returns sin(z) in rectangular form
  end

  def cosine(%Complex{real: r, image: i}) do
    cos_r = :math.cos(r) * :math.cosh(i)
    sin_r = - :math.sin(r) * :math.sinh(i)
    {cos_r, sin_r}  # Returns cos(z) in rectangular form
  end

  def tangent(%Complex{real: r, image: i}) do
    {sin_r, cos_r} = sine(%Complex{real: r, image: i})
    {sin_r / cos_r}  # Returns tan(z) in rectangular form
  end

  def hyperbolic_sine(%Complex{real: r, image: i}) do
    sinh_r = :math.sinh(r) * :math.cos(i)
    cosh_r = :math.cosh(r) * :math.sin(i)
    {sinh_r, cosh_r}  # Returns sinh(z) in rectangular form
  end

  def hyperbolic_cosine(%Complex{real: r, image: i}) do
    cosh_r = :math.cosh(r) * :math.cos(i)
    sinh_r = :math.sinh(r) * :math.sin(i)
    {cosh_r, sinh_r}  # Returns cosh(z) in rectangular form
  end

  def hyperbolic_tangent(%Complex{real: r, image: i}) do
    {sinh_r, cosh_r} = hyperbolic_sine(%Complex{real: r, image: i})
    {sinh_r / cosh_r}  # Returns tanh(z) in rectangular form
  end

  def comparison(%Complex{real: r1, image: i1}, %Complex{real: r2, image: i2}) do
    r1 == r2 and i1 == i2  # Returns true if both real and imaginary parts are equal
  end

end

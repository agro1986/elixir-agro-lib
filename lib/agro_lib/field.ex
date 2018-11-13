defmodule AgroLib.Field do
  @moduledoc """
  Methods for manipulation of finite fields.
  """
  
  alias AgroLib.Utils
  import AgroLib.Utils, only: [mod: 2]
  
  def make(num, prime) when is_integer(num) and is_integer(prime) and 0 <= num and num < prime, do: {num, prime}
  def to_string({num, prime}), do: "FieldElement_#{prime}(#{num})"
  
  @doc """
  ## Examples
  
      iex> AgroLib.Field.eq?({7, 13}, {7, 13})
      true
      iex> AgroLib.Field.eq?({7, 13}, {6, 13})
      false
      iex> AgroLib.Field.eq?({7, 13}, {7, 11})
      false
  """
  def eq?({num1, prime1}, {num1, prime1}), do: true
  def eq?({_num1, _prime1}, {_num2, _prime2}), do: false

  @doc """
  ## Examples
  
      iex> AgroLib.Field.ne?({7, 13}, {7, 13})
      false
      iex> AgroLib.Field.ne?({7, 13}, {6, 13})
      true
      iex> AgroLib.Field.ne?({7, 13}, {7, 11})
      true
  """
  def ne?(elem1, elem2), do: not eq?(elem1, elem2)
  
  @doc """
  ## Examples
  
      iex> AgroLib.Field.add({7, 13}, {12, 13})
      {6, 13}
  """
  def add({x, prime}, {y, prime}), do: {mod(x + y, prime), prime}

  @doc """
  ## Examples
  
      iex> AgroLib.Field.sub({7, 13}, {12, 13})
      {8, 13}
  """
  def sub({x, prime}, {y, prime}), do: {mod(x - y, prime), prime}
  
  @doc """
  ## Examples
  
      iex> AgroLib.Field.mul({5, 19}, {3, 19})
      {15, 19}
    
      iex> AgroLib.Field.mul({8, 19}, {17, 19})
      {3, 19}
  """
  def mul({x, prime}, {y, prime}), do: {mod(x * y, prime), prime}

  @doc """
  ## Examples
  
      iex> AgroLib.Field.pow({7, 19}, {3, 19})
      {1, 19}
    
      iex> AgroLib.Field.pow({9, 19}, {12, 19})
      {7, 19}
  """
  def pow({x, prime}, {y, prime}), do: {mod(Utils.pow(x, y), prime), prime}

end
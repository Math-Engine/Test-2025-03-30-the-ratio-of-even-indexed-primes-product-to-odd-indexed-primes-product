using Plots
using Base64

param_n = parse(Int, ARGS[1])

function is_prime(n::Int)
  if n <= 1
      return false
  elseif n <= 3
      return true
  end
  if n % 2 == 0 || n % 3 == 0
      return false
  end
  i = 5
  while i * i <= n
      if n % i == 0 || n % (i + 2) == 0
          return false
      end
      i = i + 6
  end
  return true
end

the_number_of_primes = 0
mul_odd = 1
mul_even = 1

ratio_array_x = []
ratio_array_y = []

real_param_n = param_n - param_n%2

for i in 2:real_param_n
  global is_odd
  global mul_odd
  global mul_even
  global ratio_array_x
  global ratio_array_y
  if is_prime(i) == true
    the_number_of_primes = the_number_of_primes + 1
    if the_number_of_primes%2 == 1
      mul_odd = mul_odd * i
    else
      mul_even = mul_even * i
      push!(ratio_array_x, the_number_of_primes)
      push!(ratio_array_y, (mul_even/mul_odd))
    end
  end
end

println("========================================================================================")

plot(ratio_array_x, ratio_array_y,
    marker = :circle,
    linestyle = :solid,
    label = "I love GitHub.",
    title = "I love GitHub.",
    xlabel = "x",
    ylabel = "Ratio")

savefig("graph.png")

graph_image = read("graph.png")
encoded_graph_image = base64encode(graph_image)
data_url = "data:image/png;base64,$encoded_graph_image"

println("========================================================================================")

println(data_url)

println("========================================================================================")

print(ratio_array_y)

### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 96f8cbe0-e6c7-11eb-2968-355425970e0a
begin
	import Pkg
	Pkg.activate(mktempdir())
	Pkg.add([
		Pkg.PackageSpec(name="PlutoUI"), 
		Pkg.PackageSpec(name="HypertextLiteral"),
		Pkg.PackageSpec(name="Plots")
	])
	using PlutoUI
	using HypertextLiteral
	using Plots
end

# ╔═╡ 3f25d82b-a091-4c9a-9246-322d796ff31d
PlutoUI.TableOfContents(aside=true)

# ╔═╡ dbcf4307-04e9-402e-816f-3a198072f97d
md"""
# Khởi tạo notebook
"""

# ╔═╡ 8f07ad20-8f4d-4897-8f1d-348a489c2654
md"""
# Variable (Biến)

Ta có thể định nghĩa 1 biến bằng dấu `=` (assignment). Sau đó có ta có thể sử dụng biến này tại các biểu thức khác:
"""

# ╔═╡ 3e43c4f7-7755-4e0d-8ac7-cdd9463ba996
x = 6

# ╔═╡ 67c15e77-6d38-4369-b210-e912560b9dd9
y = 2x

# ╔═╡ 9779fd93-ba76-4d9c-80e9-b81e8acef0b5
md"""
Theo mặc định, Julia hiển thị đầu ra của biểu thức cuối cùng. (Ta có thể chặn đầu ra bằng cách thêm; (dấu chấm phẩy) ở cuối.)

Chúng ta có thể tìm kiểu biến bằng cách sử dụng `typeof`:
"""

# ╔═╡ 48b77879-cf18-4b8a-949e-1d01deb64252
typeof(y)

# ╔═╡ 42302f46-6b32-441c-8a53-6b398a5b94ea
typeof(0.2);

# ╔═╡ df0bb3d3-9bb7-4209-9401-7a34704c64cc
typeof("a")

# ╔═╡ 61a6d392-ba19-42de-847d-35222a9e148b
md"""
# Functions (hàm)

Chúng ta có thể định nghĩa hàm bằng một dòng cho các hàm đơn giản:
"""

# ╔═╡ 5c3f75a2-d8ca-4885-a744-33d817430f54
f(x) = x + 2

# ╔═╡ 31ba2f8f-3f44-4abb-989e-01f65aa6612b
f(6)

# ╔═╡ 55223981-94a1-4e56-b39f-0f7dbde8e7a5
md"""
Hàm có thể sử dụng với biến như sau
"""

# ╔═╡ 8e0e4c4e-7692-4a57-8220-81fcb5119880
m = 7

# ╔═╡ cd3af3d9-56b6-4f7a-a183-f1ebea65b1e5
f(m)

# ╔═╡ 0abaaee8-df3e-422e-8475-94dc2ad22e51
md"""
Các hàm phức tạp hơn ta sử dụng cú pháp sau với từ khóa `function` và `end`:
"""

# ╔═╡ d3abfe73-9310-4540-be11-4de6a775d37c
function g(x, y)
	z = x + y
	return z^2
end

# ╔═╡ 2876f7f4-8d39-4334-99b3-550d61e679ed
g(2,9)

# ╔═╡ 3586400f-b298-427b-980f-e2cb09c34d61
md"""
# Vectors

Ta có thể khởi tạo 1 `Vector` bằng dấu ngoặc vuông:
"""

# ╔═╡ 4eb9a654-9978-45c1-9cff-199098438a5c
array = [1, 2, 3]

# ╔═╡ 1b3496d1-fd05-40e7-9f46-b9715efd9da3
md"""
Ta có lấy các phần tử cũng bằng cách sử dụng dấu ngoặc vuông. Chú ý rằng `vector` của Julia bắt đầu từ 1:
"""

# ╔═╡ b6dbc585-8463-486e-9ff1-3ebaaeddaf34
array[1]

# ╔═╡ 4842e93c-3700-4791-8960-482bab002c93
array[3]

# ╔═╡ 69074957-128a-4640-b0d6-2ba02c0ec8bb
md"""
Trong Julia, các phép tính với từng phần tử sẽ có dấu `.` tại đằng trước, tương tự với hàm
"""

# ╔═╡ f69be04d-66fc-46c6-8b3c-9143510a5df5
array.*array

# ╔═╡ 68260414-fb06-420a-a790-bc88ba980d9f
array.^2

# ╔═╡ 232fb90c-2086-449a-af9b-365a777850ba
f.(array)

# ╔═╡ f5d8d9b5-85f6-42fe-8d4b-ee9a5d6ad9e4
md"""
# Ví dụ
"""

# ╔═╡ d217f54c-11d0-4c6c-8ac2-3421bfbb5330
md"""
``p_0`` = $(@bind p0 NumberField(1:1000000, default = 100000))

``r`` = $(@bind r NumberField(-0.3:0.01:0.3, default = 0.01))

``n`` = $(@bind n NumberField(0:50, default = 10))
"""

# ╔═╡ 26476884-2d75-423b-ab3d-106689ed2e5f
md"""
## Kết quả
"""

# ╔═╡ 2563c408-be97-4039-9539-fdc618308eac
pn = round(Int, (1+r)^n*p0);

# ╔═╡ b65e7599-cd38-4a62-b503-6abee75556f4
begin
	year = 1:n
	pns = round.(Int, (1+r).^year.*p0)
end;

# ╔═╡ 87eb637d-534a-417a-9b7a-f4e9c8a15fc2
md"""
### Nghiệm số học
"""

# ╔═╡ bab3b48d-01c7-48b3-af55-13ab45dfde14
pns

# ╔═╡ 2e716866-2f28-4b62-bedd-e73f57e5681e
begin
	md"""
	### Nghiệm chính xác
	
	``n =``  $(n)
	
	``p_n = (1+r)^np_0=`` $(pn)
	"""
end

# ╔═╡ 2b8ce708-768a-4726-ba60-02a9051f143c
begin
	md"""
	### Biểu đồ
	"""
	plot(year, pns, seriestype = :scatter, title = "Bieu Do")
	xlabel!("Thời gian năm thứ n")
	ylabel!("Dân số p_n")
end

# ╔═╡ Cell order:
# ╟─3f25d82b-a091-4c9a-9246-322d796ff31d
# ╟─dbcf4307-04e9-402e-816f-3a198072f97d
# ╠═96f8cbe0-e6c7-11eb-2968-355425970e0a
# ╟─8f07ad20-8f4d-4897-8f1d-348a489c2654
# ╠═3e43c4f7-7755-4e0d-8ac7-cdd9463ba996
# ╠═67c15e77-6d38-4369-b210-e912560b9dd9
# ╟─9779fd93-ba76-4d9c-80e9-b81e8acef0b5
# ╠═48b77879-cf18-4b8a-949e-1d01deb64252
# ╠═42302f46-6b32-441c-8a53-6b398a5b94ea
# ╠═df0bb3d3-9bb7-4209-9401-7a34704c64cc
# ╟─61a6d392-ba19-42de-847d-35222a9e148b
# ╠═5c3f75a2-d8ca-4885-a744-33d817430f54
# ╠═31ba2f8f-3f44-4abb-989e-01f65aa6612b
# ╟─55223981-94a1-4e56-b39f-0f7dbde8e7a5
# ╠═8e0e4c4e-7692-4a57-8220-81fcb5119880
# ╠═cd3af3d9-56b6-4f7a-a183-f1ebea65b1e5
# ╟─0abaaee8-df3e-422e-8475-94dc2ad22e51
# ╠═d3abfe73-9310-4540-be11-4de6a775d37c
# ╠═2876f7f4-8d39-4334-99b3-550d61e679ed
# ╟─3586400f-b298-427b-980f-e2cb09c34d61
# ╠═4eb9a654-9978-45c1-9cff-199098438a5c
# ╟─1b3496d1-fd05-40e7-9f46-b9715efd9da3
# ╠═b6dbc585-8463-486e-9ff1-3ebaaeddaf34
# ╠═4842e93c-3700-4791-8960-482bab002c93
# ╟─69074957-128a-4640-b0d6-2ba02c0ec8bb
# ╠═f69be04d-66fc-46c6-8b3c-9143510a5df5
# ╠═68260414-fb06-420a-a790-bc88ba980d9f
# ╠═232fb90c-2086-449a-af9b-365a777850ba
# ╟─f5d8d9b5-85f6-42fe-8d4b-ee9a5d6ad9e4
# ╟─d217f54c-11d0-4c6c-8ac2-3421bfbb5330
# ╟─26476884-2d75-423b-ab3d-106689ed2e5f
# ╠═2563c408-be97-4039-9539-fdc618308eac
# ╠═b65e7599-cd38-4a62-b503-6abee75556f4
# ╟─87eb637d-534a-417a-9b7a-f4e9c8a15fc2
# ╟─bab3b48d-01c7-48b3-af55-13ab45dfde14
# ╟─2e716866-2f28-4b62-bedd-e73f57e5681e
# ╟─2b8ce708-768a-4726-ba60-02a9051f143c

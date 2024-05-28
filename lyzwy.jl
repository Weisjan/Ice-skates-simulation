using Plots

function stworz_elipse(center_x, center_y, radius_x, radius_y, n=100)
    θ = LinRange(0, 2*pi, n)
    X = center_x .+ radius_x * cos.(θ)
    Y = center_y .+ radius_y * sin.(θ)
    return X, Y
end


function nowe_wspolrzedne_2(t, x_1, klatki, v_akt, x_2, y_1, y_2)
	new_x1 = x_1[t-1] + (1/klatki) * (v_akt[t]+v_akt[t-1])/2
	push!(x_1, new_x1)
	new_x2 = x_2[t-1]
	push!(x_2, new_x2)
	new_y1 = y_1[t-1] + (1/klatki) * (v_akt[t]+v_akt[t-1])/2
	push!(y_1, new_y1)
	new_y2 = y_2[t-1] + (1/klatki) * (v_akt[t]+v_akt[t-1])/2
	push!(y_2, new_y2)
end


function nowe_wspolrzedne_1(t, x_1, klatki, v_akt, x_2, y_1, y_2)
	new_x1 = x_1[t-1]
	push!(x_1, new_x1)
	new_x2 = x_2[t-1] + (1/klatki) * (v_akt[t]+v_akt[t-1])/2
	push!(x_2, new_x2)
	new_y1 = y_1[t-1] - (1/klatki) * (v_akt[t]+v_akt[t-1])/2
	push!(y_1, new_y1)
	new_y2 = y_2[t-1] - (1/klatki) * (v_akt[t]+v_akt[t-1])/2
	push!(y_2, new_y2)
end


function przyspieszanie(v_akt, predkosc_maksymalna, a, czas_przyspieszania, opoznienie, skala)
	global t += 1
	if v_akt[t-1] > predkosc_maksymalna
		new_v_akt = v_akt[t-1]
		push!(v_akt, new_v_akt)
	else
		new_v_akt = v_akt[t-1] + a * czas_przyspieszania - opoznienie * czas_przyspieszania / skala
		push!(v_akt, new_v_akt)
	end
end


m = 70  # Masa lyzwiarza w kg
F_lyzwiarza = 50  # Sila z jaka odpycha sie lyzwiarz
przysp_g = 9.81  # Przyspieszenie grawitacyjne na Ziemi
alfa = (pi / 180) * 70  # Kat pod ktorym odpycha sie lyzwiarz
predkosc_minimalna = 10  # Predkosc przy której łyżwiarz odepchnie się 
szybkosc_symulacji = 1 # Mnoznik predkosci symulacji (1-czas rzeczywisty)
predkosc_maksymalna = 20
czas_przyspieszania = 8
wsp_dyn_5_stopni = 0.022   # Wspolczynnik tarcia dynamicznego dla temp -5 stopni

y_1 = Float64[]
push!(y_1, 0)
y_2 = Float64[]
push!(y_2, 0)
x_1 = Float64[]  # Poczatek wektora pierwszej lyzwy
push!(x_1, 0)
x_2 = Float64[]  # Poczatek wektora drugiej lyzwy
push!(x_2, 0)
v_akt = Float64[] # Wektor predkosci m/s
push!(v_akt, 0)		

t = 1
skala = 150
ktora_lyzwa = 2 # ktora lyzwa aktualnie odpycha sie lyzwiarz
opoznienie = m * przysp_g * wsp_dyn_5_stopni	#opzonienie spowodowane tarciem dynamicznym
licz = 0
klatki = 30	# liczba klatek na sekunde
a = F_lyzwiarza * cos(alfa) / m	#przyspieszenie lyzwiaza


# Main

while licz < 20
	if v_akt[t] <= (predkosc_minimalna + 1) && ktora_lyzwa==2
		if licz==0
			for i = 1:czas_przyspieszania
				przyspieszanie(v_akt, predkosc_maksymalna, a, czas_przyspieszania, opoznienie, skala)
			
				nowe_wspolrzedne_2(t, x_1, klatki, v_akt, x_2, y_1, y_2)
				
			end
		else
			for j = 1:4
				global t += 1
				new_v_akt = v_akt[t-1] - opoznienie * (1/klatki) / 2
				push!(v_akt, new_v_akt)
				
				nowe_wspolrzedne_2(t, x_1, klatki, v_akt, x_2, y_1, y_2)				
			end
			for i = 1:czas_przyspieszania
				przyspieszanie(v_akt, predkosc_maksymalna, a, czas_przyspieszania, opoznienie, skala)
								
				nowe_wspolrzedne_2(t, x_1, klatki, v_akt, x_2, y_1, y_2)
			end
		end
		global ktora_lyzwa = 1
	elseif v_akt[t] <= (predkosc_minimalna+1) && ktora_lyzwa==1
		for j = 1:4
			global t += 1
			new_v_akt = v_akt[t-1] - opoznienie * (1/klatki) / 2
			push!(v_akt, new_v_akt)
			nowe_wspolrzedne_1(t, x_1, klatki, v_akt, x_2, y_1, y_2)
		end
		for i = 1:czas_przyspieszania
			przyspieszanie(v_akt, predkosc_maksymalna, a, czas_przyspieszania, opoznienie, skala)
			
			nowe_wspolrzedne_1(t, x_1, klatki, v_akt, x_2, y_1, y_2)
		end
		global ktora_lyzwa=2
	else
		while v_akt[t] > (predkosc_minimalna + 1)
			global t += 1
			new_v_akt = v_akt[t-1] - opoznienie * (1/klatki) / 2
			push!(v_akt, new_v_akt)
			if(ktora_lyzwa==1)
				new_x1 = x_1[t-1] + (1/klatki) * (v_akt[t]+v_akt[t-1])/2
				push!(x_1, new_x1)
				new_x2 = x_2[t-1] + (1/klatki) * (v_akt[t]+v_akt[t-1])/2
				push!(x_2, new_x2)
				new_y1 = y_1[t-1] + (1/klatki) * (v_akt[t]+v_akt[t-1])/2
				push!(y_1, new_y1)
				new_y2 = y_2[t-1] + (1/klatki) * (v_akt[t]+v_akt[t-1])/2
				push!(y_2, new_y2)
			else
				new_x1 = x_1[t-1] + (1/klatki) * (v_akt[t]+v_akt[t-1])/2
				push!(x_1, new_x1)
				new_x2 = x_2[t-1] + (1/klatki) * (v_akt[t]+v_akt[t-1])/2
				push!(x_2, new_x2)
				new_y1 = y_1[t-1] - (1/klatki) * (v_akt[t]+v_akt[t-1])/2
				push!(y_1, new_y1)
				new_y2 = y_2[t-1] - (1/klatki) * (v_akt[t]+v_akt[t-1])/2
				push!(y_2, new_y2)
			end
		end

	end
	global licz += 1
end  

# print(alfa_1)

# Główna pętla rysowania
for i in 1:length(x_1)
    # Utwórz elipsoidy
	
	X, Y = stworz_elipse(x_1[i], y_1[i] + 0.8, 0.8, 0.2)
	X_2, Y_2 = stworz_elipse(x_2[i], y_2[i] - 0.8, 0.8, 0.2)

    # Narysuj elipsy
    local p = plot(title="Symulacja", xlabel="X", ylabel="Y", aspect_ratio=:equal)
    plot!(p, X, Y, label=false, color=:blue)
    plot!(p, X_2, Y_2, label=false, color=:red)
	plot!(xlims=(0, 200), ylims=(-25, 25))


    # Wyświetl wykres
    display(p)
    sleep(1/(szybkosc_symulacji * klatki))
end

# Tworzenie osi czasu
time_vector_x = 1/klatki:1/klatki:length(x_1)/klatki
time_vector_v = 1/klatki:1/klatki:length(v_akt)/klatki

# Tworzenie wykresow polozenia i predkosci
plot_x1_x2 = plot(time_vector_x, x_1, label="x_1", color=:blue, xlabel="Time [s]", ylabel="x(t) [m]")
plot!(plot_x1_x2, time_vector_x, x_2, label="x_2", color=:red, title="Zmiana położenia łyżew w czasie")

plot_v = plot(time_vector_v, v_akt, label="v_akt", color=:green, xlabel="Time [s]", ylabel="v(t) [m/s]", title="Zmiana prędkości ciała w czasie")

p = plot(plot_x1_x2, plot_v, layout=(2, 1))

# Display the combined plot
display(p)
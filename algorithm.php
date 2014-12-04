<?php
require 'header.php';
?>

<div class="container">

<div class="jumbotron">

	<h3>Algorytm przyznawania punktów</h3>
	
	<div class="description">
	Wykorzystany algorytm przyznawania punktów jest modyfikacją 
	<a href="http://pl.wikipedia.org/wiki/Ranking_szachowy">rankingu Elo (szachowego)</a>.
	
	Modyfikacje były potrzebne, ponieważ ranking Elo nie uwzględnia meczy 2 na 2 graczy oraz 2 na 1.
	Ponadto, w szachach możliwe zakończenia gry to: wygrana, remis i porażka.
	W piłkarzykach nie ma remisów i możliwych jest 10 sposobów zwycięstwa (10:0, 10:1, ..., 10:9) oraz 10
	sposobów porażki (0:10, 1:10, ..., 9:10).
	</div>
	
	<div class="description">
	Nowy zawodnik otrzymuje 1000 punktów rankingowych, oznaczanych literą `R`.
	Po meczu drużyny `AB` przeciwko `CD`, punkty zawodników w drużynach są modyfikowane.
	Przegrany zawodnik oddaje zwycięzcy `\Delta` punktów. Wyjątek stanowi gra dwóch na jednego,
	w której to samotny zawodnik oddaje (bądź dostaje) `2\Delta` punktów.
	</div>
	
	<p>`\Delta = 100(S_{AB} - E_{AB})`</p>
	
	<div class="description">
	`S_{AB} \in [0;1]` to rzeczywista wartość meczu dla drużyny `AB`, zaś `E_{AB} \in (0;1)` - oczekiwana. 
	Niech `ab` oznacza liczbę bramek zdobytych przez drużynę `AB` oraz niech `cd` oznacza liczbę bramek zdobytych przez drużynę `CD`.
	Rzeczywista wartość meczu dla drużyny `AB` wynosi:
	</div>
	
	<p>`S_{AB} = 0.05ab`, jeśli `cd = 10`</p>
	<p>`S_{AB} = 1 - 0.05cd`, jeśli `ab = 10`</p>
	
	<div class="description">
	Np. dla wyniku 10:6, `ab = 10`, `cd = 6`, `S_{AB} = 1 - 0.05 \cdot 6 = 0.7`.
	Oczekiwana wartość meczu dla drużyny `AB` wynosi:
	</div>
	
	<p>`E_{AB} = \frac{1}{1+10^{(R_{CD} - R_{AB})/500}}`</p>
	
	<div class="description">
	`R_{AB}` i `R_{CD}` to średnie arytmetyczne liczby punktów dla pierwszej i drugiej drużyny. 
	Jeśli drużyna `AB` składa się z 1 zawodnika, to `R_{AB}` jest równe liczbie punktów tego zawodnika.
	Jeśli drużyna `AB` składa się z 2 zawodników, to `R_{AB} = \frac{R_A + R_B}{2}`.
	</div>
	
	<div class="description">
	Wprowadzono również zabezpieczenie, dzięki któremu zwycięska drużyna nie może stracić punktów
	(a przegrana nie może ich zyskać).
	Jeśli drużyna `AB` wygrała i `S_{AB} < E_{AB}` lub przegrała
	i `S_{AB} > E_{AB}`, to `\Delta = 0`.
	</div>
	
	<div class="description">
	Przykład:
	</div>
	
	<div class="description">
	Zawodnik `A` o sile 1200 (liczbie punktów równej 1200) gra z zawodnikiem `C` o sile 1000.
	Oczekiwana wartość meczu dla drużyny `AB` (de facto gracza `A`) wynosi `0.715`. 
	To oznacza, iż oczekuje się, że `A` wygra wyżej niż 10:6 (czyli 10:5, 10:4, 10:3, 10:2, 10:1 lub 10:0). 
	Jeśli wygra 10:6, to rzeczywisty wynik spotkania `S_{AB}` wyniesie `0.7`,
	zatem trochę mniej, niż oczekiwano. `\Delta=-15`, czyli bez zabezpieczenia zwycięzca straciłby 15 punktów.
	Dzięki zabezpieczeniu `\Delta = 0`, zatem ranking pozostanie bez zmian.
	</div>

</div>

</div>

<script>$("#nav4").addClass('active');</script>

<!-- MathJax JS -->
<script type="text/javascript" src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=AM_HTMLorMML-full"></script>

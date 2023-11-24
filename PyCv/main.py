def zapisz_tablice_do_pliku(tablica, nazwa_pliku):
  with open(nazwa_pliku, "w") as plik:
    for wiersz in tablica:
      plik.write(" ".join(str(elem) for elem in wiersz) + "\n")


# Przykład użycia

tablica = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
nazwa_pliku = "tablica.txt"

zapisz_tablice_do_pliku(tablica, nazwa_pliku)
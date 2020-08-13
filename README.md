# Linear Regression from Scratch
Tugas Seleksi Ca-IRK 2018

Membuat algoritma linear regression dari 0.

## Deskripsi Persoalan
Seperti yang telah kalian pelajari pada mata kuliah Probabilitas dan Statistika, terdapat suatu algoritma yang bernama <b>Regresi Linier (Linear Regression)</b>. Buatlah algoritma Regresi Linear versi kalian sendiri dan cobalah memakai algoritma tersebut untuk memproses dataset!

## Identitas
Muhammad Farid Adilazuarda / 13518040

## Dasar Teori Regresi Linear
Dalam dunia statistika, regresi linear adalah pendeketan yang digunakan untuk melekukan pemodelan hubungan antara variable terikat Y dan satu atau lebih variable bebas X. Kegunaan dari regresi linear adalah melakukan prediksi berdasarkan data-data yang telah dimiliki sebelumnya.<br> 
Berdasarkan jumlah penggunaan variable bebas, regresi linear dapat dikategorikan menjadi dua, yaitu regresi linear univariate (simple linear regression) dan regresi linear multivariate (multiple linear regression). Simple lienar regression digunakan untuk mengetahui pengaruh antara satu buah variabel bebas terhadap satu buah variabel terikat. Sedangkan pada multiple linear regression, variable bebas yang terlibat tidak hanya satu saja melainkan beberapa variabel bebas.

## Penjelasan Kode Sumber
Algoritma untuk memodelkan multiple linear regression dibuat dengan bahasa Julia (.jl) dan terdapat pada file linearRegression.jl yang memuat module linearRegression.<br>
Modul ini memiliki sebuah struct regression yang terdiri atas : <br>

1. testData : dataset untuk testing, sebanyak 20% dari total data masukan
2. data : dataset untuk training data
3. xVar : data untuk variable x (variabel bebas)
4. yVar : data untuk variable y (variabel terikat)
5. model : koefisien dari persamaan regresi linear untuk setiap atribut

Pada julia, tidak dapat membuat class dengan method khusus class tersebut. Oleh karena itu, akan dibuat file "linearRegression.jl" yang mendeklarasikan modul LinearRegression. Pada modul tersebut akan dideklarasikan tipe data bentukan yang bernama Regression. Kemudian akan dibuat setter untuk tiap atribut dari tipe data bentukan tersebut. 

1. Main Library<br>
   Pada modul LinearRegression juga akan dideklarasikan beberapa fungsi untuk memudahkan training dan prediksi yaitu dotProduct dan perhitungan error. Kemudian, pada fungsi train akan melakukan multiple linear regression dan mengisi value dari hasil regresi tersebut ke property model yang ada pada tipe data bentukan. Setelah itu, terdapat fungsi predict yang akan melakukan prediksi terhadap dataTest pada tipe data bentukan, dan kemudian akan mengevaluasi akurasi dari algoritma menggunakan Mean Absolute Error dan Root Mean Square Error, kalkulasi error mereturn hasil dari selisih prediksi dengan data aktual. Hasil prediksi tersebut akan di return, karna selanjutnya akan dapat digunakan untuk visualisasi scatter plot dan line plot. 

2. Visualizer<br>
   Modul ini berguna untuk memvisualisasikan titik-titik Data Test dan garis regresi linier yang dihasilkan (plotting). Modul ini memanfaatkan library Plots untuk proses plotting data.

## Referensi
1. Probability & Statistics for Engineers & Scientits 9th ed., Ronald E. Walpole et al.
2. Julia Documentation: https://docs.julialang.org/
3. Julia Cheatsheet: https://cheatsheets.quantecon.org/julia-cheatsheet.html
4.  Vehicle Dataset from Cardekho: https://www.kaggle.com/nehalbirla/vehicle-dataset-from-cardekho.
5. https://medium.com/human-in-a-machine-world/mae-and-rmse-which-metric-is-better-e60ac3bde13d
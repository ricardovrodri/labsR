# Realizacion por parte del alumno de la primera relacion de problemas de la
# asignatura MLDE

# Ejercicio 1

## Apartado 1.

####  Definición del vector de longitudes, mediante la función c (concatenate)

longitudA = c(1.8, 1.2, 1.6, 1.7, 1.1, 1) 

### Estudio descriptivo de la muestra aleatoria longitudA

####  Uso de la función summary (resumen), en función del tipo de variable hace
####  un analisis distinto, para variables numericas realiza la media, la moda,
####  los tres cuartiles (25,50,75), y el minimo y el máximo

summary(longitudA)


### Diagrama de caja y bigotes, es otra forma de resumir los datos en un gráfico
### en esta ocasion, es válido solo para tipos numericos y representa los datos
### de summary pero de una forma más visual, pudiendo esclarecer si hay valores
### que no son normales o están demasiado dispersos, la función que nos permite
### realizarlo es boxplot


boxplot(longitudA)

boxplot(longitudA, horizontal = TRUE)

### Otra funcion que suele usarse para hacer análisis graficos de una variable
### numerica es el histograma, que muestra el grafico de barras o columnas

hist(longitudA)

### Se ve la utilidad del parametro break para aumentar el numero de columnas o
### para especificar los extremos del rectangulo



### Para responder a la pregunta del apartado 1 vamos a utilizar el test de
### Shapiro_Wilk, test no paramétrico para contrastar la hipotesis nula: X sigue
### una distribucion normal, frente la hipotesis alternativa X no sigue una
### distribucion normal. Tiene las mismas caracteristicas de un test parametrico
### con un nivel de confianza. Para ello calculamos un estadístico y nos
### preguntamos si dicho estadistico calculado para nuestra muestra entra en la
### region critica, y entonces podemos rechazar la hipotesis nula, en cambio si
### cayera dentro de la region de aceptacion, diriamos que no existen evidencias
### suficientes para oponerse a la idea de que sea cierta H0. Estos calculos
### recordemos estan sujetos a dos tipos de error, el que queremos controlar es
### que H0 sea cierto y nosostros lo rechacemos, ya que rechazar es algo muy
### cerrado mientras que lo contrario simplemente es asegurar que no hay
### evidencias para decir lo contrario, pero tampoco es claro que sea cierto.


shapiro.test(longitudA)

### Otra opcion es qqnorm y qqline, que nos permite ver por un lado los
### cuantiles de la muestra y la distancia a la que estos estan de sus valores
### teoricos si efectivamente siguieran una normal, la funcion qqline, nos
### permite ver una recta por donde deberian pasar los cuantiles

qqnorm(longitudA)
qqline(longitudA)


##  Apartado 2. 

### La media muestral, es un estimador puntual de la media y la podemos calcular
### como:

mean(longitudA)

### Mientras que para la varianza un estimador insesgado es la cuasivarianza que
### se calcula con la funcion var()

var(longitudA)

##  Apartado 3.

### Vamos a realizar un contraste de hipotesis para la media de una normal
### desconocida la varianza, podemos suponer ques sigue una distribucion normal
### por el apartado 1. Para ello usamos la funcion t.test

t.test(longitudA, mu = 1.5,  alternative = "l")

### El p-valor obtenido es 0.2521 que es un valor bastante elevado por lo que no
### existen evidencias suficientes para decir que la media no pueda ser igual a
### 1.5, es decir, no hay suficientes motivos para creer que la media esté
### seguro por debajo de 1.5, podría estar por encima o ser igual



##  Apartado 4. Repetimos el proceso para la variable B


longitudB = c(2.1, 1.9, 1.5, 2.0, 1.3, 1.4)

shapiro.test(longitudB)

# El p-valor es 0.3135 que no es menor que 0.05 por lo que no podemos rechazar
# que la muestra siga una distribución normal


t.test(longitudB, mu = 1.5,  alternative = "l")


#   Apartado 5. Teniendo en cuenta que posiblemente haya una dependencia entre
#   ambas y como queremos saber si la media ha variado lo suficiente, no podemos
#   estudiar un estadistico para dos normales independientes y por ello vamos a
#   estudiar la variable aleatoria A-B y hacer un contraste para esa variable
#   (unidimensional)


Dif = longitudB - longitudA

shapiro.test(Dif)

t.test(Dif)

t.test(longitudA, y = longitudB, paired = TRUE)

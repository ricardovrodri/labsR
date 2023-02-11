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
### desconocida la varianza, podemos suponer que sigue una distribucion normal
### por el apartado 1. Para ello usamos la funcion t.test

t.test(longitudA, mu = 1.5,  alternative = "l")

### El p-valor obtenido es 0.2521 que no es un valor sufientemente bajo como
### para asegurar estadisticamente que la media este por debajo de 1.5. Sin
### embargo habría que notar que esto no nos impide considerar que la media sea
### ciertamente inferior a 1.5, dado que hay que conocer lo que se está haciendo
### realmente al hacer un test paramétrico.No decimos que la media sea superior
### a 1.5, solo aseveramos que no tenemos las suficientes evidencias
### estadísticas para asegurar que no lo sea. Simplemente no podemos estar
### seguros



##  Apartado 4. Repetimos el proceso para la variable B


longitudB = c(2.1, 1.9, 1.5, 2.0, 1.3, 1.4)

shapiro.test(longitudB)

### El p-valor es 0.3135 que no es menor que 0.05 por lo que no podemos rechazar
### que la muestra siga una distribución normal


t.test(longitudB, mu = 1.5,  alternative = "l")

### El p valor en este caso es 0.8951 por lo que con menos motivos que en el
### caso de longitudA podemos decir que la media sea inferior a 1.5. En este
### sentido podriamos hacer un segundo experimento, que es preguntarnos si hay
### suficientes motivos para creer que de hecho es mayor que 1.5

t.test(longitudB, mu = 1.5, alternative = "g")

### Podemos observar por el p-valor 0.1049, que aunque tampoco tenemos
### evidencias suficientes para defender que la media sea superior a 1.5, el
### p-valor es muy inferior al caso anterior.

## Apartado 5. Teniendo en cuenta que posiblemente haya una dependencia entre
## ambas y como queremos saber si la media ha variado lo suficiente, no podemos
## estudiar un estadistico para dos normales independientes y por ello vamos a
## estudiar la variable aleatoria A-B y hacer un contraste para esa variable
## (unidimensional)

### Creacion de la variable aleatoria diferencia

Dif = longitudB - longitudA


### Realización del test de Shapiro_Will para comprobar si la variable
### diferencia es una normal o al menos si no hay evidencias suficientes para
### descartar esas hipótesis

shapiro.test(Dif)

### El p-value es 0.799 por lo que tenemos aun menos motivos que en los casos
### anteriores para creer que la variable diferencia siga una distribucion que
### no sea normal.

### Realizamos el t.test, en este caso no hace falta especificar el mu puesto
### que el que queremos es el por defecto siendo este cero, y tampoco hay que
### especificar alternative porque es two-sided que es el por defecto también
### (queremos comprobar si la media, la diferencia en este caso entre A y B, es
### igual o no a cero)

t.test(Dif)

### El p-valor en este caso es 0.0372 por lo que sí que tenemos evidencias
### suficientes para argumentar que efectivamente la media (la poblacional que
### no la sabemos) ha cambiado entre A y B.

### Otra opcion mas simple es usar la funcion t.test con el argumento para las
### normales dependientes siendo este paired (que por defecto vale false y lo
### cambiamos a true para este supuesto)

t.test(longitudA, y = longitudB, paired = TRUE)

### Podemos comprobar que el p-valor efectivamente es el mismo.


## Apartado 6: Como recordamos, el objetivo del cambio de proceso era modificar
## la media en 2.5 unidades, podemos comprobar que se ha modificado, pero
## podemos preguntarnos si cumple su proposito.

### Nota al ejercicio: Me parece evidente que no ha cambiado la media en 2.5,
### por eso creo que en el documento hay un posible error de escritura y se
### queria preguntar si el cambio de la media era a 2.5 y no un cambio de 2.5,
### por lo que haré un subapartado a) y b) para cada supuesto


### a) ¿Ha cambiado la media en 2.5 unidades? Realizamos el mismo test que antes
### para la diferencia pero en este caso queremos saber si la diferencia entre
### las medias es igual a 2.5


t.test(longitudB, y = longitudA, paired = TRUE, mu = 2.5)

### Como se puede comprobar el p-valor es una cantidad del orden de 1e-06, con
### lo que existen evidencias mas que suficientes para rechazar la hipotesis de
### que la media haya cambiado en 2.5

### b) ¿Ha cambiado la media a 2.5? Teniendo en cuenta que hemos especificado
### que no había criterios suficientes para oponerse a que la media del proceso
### A pudiera ser 1.5, voy a suponer que el objetivo real de la pregunta es
### cuestionar si la media ha podido cambiar una unidad de un proceso al otro.

t.test(longitudB, y = longitudA, paired = TRUE, mu = 1)

### Podemos comprobar de nuevo que sigue habiendo evidencias más que suficientes
### para asegurar que la media no se ha modificado en una unidad, pero en este
### caso con un p-valor un poco más aceptable. El proceso en todo caso no cumple
### su cometido.
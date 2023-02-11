# Realizacion por parte del alumno de la primera relacion de problemas de la
# asignatura MLDE

# Ejercicio 2

## Apartado 1

### Definicion de las variables aleatorias para los programas A y B

progA = c(.32, .39, .28, .21, .30, .29, .33, .36, .40, .37)
progB = c(.32, .25, .30, .42, .40, .39, .27, .24, .36, .35)

### Podemos comenzar haciendo algunos analisis numericos sobre las variables
### aleatorias, por ejemplo empezar con un summary, y unos gráficos y bigotes
### para ambas

summary(progA)
summary(progB)

boxplot(progA, progB)
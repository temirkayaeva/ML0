
* [Метрические методы классификации](https://github.com/temirkayaeva/ML0#метрические-методы-классификации)
    * [Алгоритм 1NN](https://github.com/temirkayaeva/ML0#алгоритм-1nn)
    * [Алгоритм KNN](https://github.com/temirkayaeva/ML0#алгоритм-knn)
    * [Алгоритм KwNN](https://github.com/temirkayaeva/ML0#алгоритм-kwnn)
    * [Метод парзеновского окна](https://github.com/temirkayaeva/ML0/#метод-парзеновского-окна)
    * [Метод потенциальных функций](https://github.com/temirkayaeva/ML0/#метод-потенциальных-функций)
* [Байесовские алгоритмы классификации](https://github.com/temirkayaeva/ML0#байесовские-алгоритмы-классификации)
    * [Нормальный дискриминантный анализ](https://github.com/temirkayaeva/ML0#нормальный-дискриминантный-анализ)
    * [Наивный	нормальный байесовский	классификатор](https://github.com/temirkayaeva/ML0#наивныйнормальный-байесовскийклассификатор)
    * [Подстановочный алгоритм](https://github.com/temirkayaeva/ML0#подстановочный-алгоритм)
    * [Линейный дискриминант Фишера](https://github.com/temirkayaeva/ML0#линейный-дискриминант-фишера)



# Метрические методы классификации

Методы обучения, основанные на анализе сходства объектов,  будем называть ***метрическими***.

*Метрический алгоритм классификации* с обучающей выборкой Xl относит объект u к тому классу y ∈ Y , для которого суммарный вес ближайших обучающих объектов Γy(u, Xl) максимален: <img src="https://github.com/temirkayaeva/ML0/raw/master/images/2.png" width="500"> где весовая функция <img src="https://github.com/temirkayaeva/ML0/raw/master/images/3.png" width="45">  оценивает степень важности *i*-го соседа для классификации объекта *u*. Обычно весовая функция <img src="https://github.com/temirkayaeva/ML0/raw/master/images/3.png" width="45">  — нертрицательная, невозврастающая по *i*, что соответствует **гипотезе компактности** (схожим объектам чаще соответствуют схожие ответы). 

 
## Алгоритм 1NN

**Алгоритм ближайшего соседа - 1NN** (nearest neighbor, NN)  является самым простым алгоритмом классификации. Он относит классифицируемый объект <img src="https://github.com/temirkayaeva/ML0/raw/master/images/4.png" width="45"> к тому классу, которому принадлежит ближайший обучающий объект: <img src="https://github.com/temirkayaeva/ML0/raw/master/images/5.png" width="100">

<img src="https://github.com/temirkayaeva/ML0/raw/master/images/1nn1.png" width="900"> 
  
#### Достоинства метода

* Простота реализации.

#### Недостатки метода

* Неустойчивость к погрешностям (шуму, выбросам).
* Отсутствие настраиваемых параметров.
* Низкое качество классификации.
* Приходится хранить всю выборку целиком.

## Алгоритм KNN

**В алгоритме k ближайших соседей - KNN** (k nearest neighbors) объекты классифицируются  путем *голосования* по *k* ближайшим соседям. Каждый из соседей <img src="https://github.com/temirkayaeva/ML0/raw/master/images/knn1.png" width="120">  голосует за отнесение
объекта <img src="https://github.com/temirkayaeva/ML0/raw/master/images/knn2.png" width="15">  к своему классу <img src="https://github.com/temirkayaeva/ML0/raw/master/images/knn3.png" width="19">. Алгоритм относит объект  <img src="https://github.com/temirkayaeva/ML0/raw/master/images/knn2.png" width="15">  к тому классу, который
наберёт большее число голосов:
<img src="https://github.com/temirkayaeva/ML0/raw/master/images/knn4.png" width="350"> 

<img src="https://github.com/temirkayaeva/ML0/raw/master/images/knn.png" width="900"> 

### Оптимизация числа соседей k

Оптимальное значение параметра *k* определяют по критерию скользящего контроля с *исключением объектов по одному* (leave-one-out, LOO).
 Для каждого объекта <img src="https://github.com/temirkayaeva/ML0/raw/master/images/loo1.png" width="70">  проверяется,
правильно ли он классифицируется по своим *k* ближайшим соседям.

<img src="https://github.com/temirkayaeva/ML0/raw/master/images/loo2.png" width="400"> 

<img src="https://github.com/temirkayaeva/ML0/raw/master/images/looo1.png" width="900">

Оптимальное *k* = 6.

#### Достоинства метода

* Простота реализации.

#### Недостатки метода

* При k = 1 неустойчивость к погрешностям. Если среди обучающих объектов *выброс* - объект, находящийся в окружении объектов чужого класса, то не только он сам будет классифицирован неверно, но и те окружающие его объекты, для которых он окажется ближайшим.

* При k = l алгоритм наоборот чрезмерно устойчив и вырождается в константу.
 
* Бедный набор параметров.

*  Максимальная сумма голосов может достигаться на нескольких классах одновременно.

## Алгоритм k взвешенных ближайших соседей

В данном алгоритме вводится строго убывающая последовательность вещественных весов <img src="https://github.com/temirkayaeva/ML0/raw/master/images/kwnn1.png" width="19">,  задающих вклад i-го соседа в классификацию:

<img src="https://github.com/temirkayaeva/ML0/raw/master/images/kwnn2.png" width="350"> 

#### Выбор последовательности

* <img src="https://github.com/temirkayaeva/ML0/raw/master/images/kwnn3.png" width="90"> — линейно убывающие веса; при данном выборе последовательности неоднозначности также могут возникать (например: классов два; первый и четвёртый сосед голосуют за класс 1, второй и третий — за класс 2; суммы голосов совпадают).

* <img src="https://github.com/temirkayaeva/ML0/raw/master/images/kwnn4.png" width="100"> —  экспоненциально убывающие веса (геометрическая прогрессия), *q* — параметр алгоритма. Его можно подбирать по критерию LOO, аналогично числу соседей k.

<img src="https://github.com/temirkayaeva/ML0/raw/master/images/lookwnn.png" width="900"> 
Оптимальное q = 1, k = 6. 

### Сравнение методов KNN и KWNN

| Карта классификации KNN  | Карта классификации KWNN |
| ------------- | ------------- |
| <img src="https://github.com/temirkayaeva/ML0/raw/master/images/knnmap.png" width="400">  | <img src="https://github.com/temirkayaeva/ML0/raw/master/images/kwnn.png" width="400">  |

Из-за того, что алгоритм k взвешенных ближайших соседей учитывает порядок объектов при классификации, он выдаёт лучший результат, чем алгоритм k ближайших соседей (kNN). 

**Пример, показывающий	преимущество	метода kwNN над KNN:**
<img src="https://github.com/temirkayaeva/ML0/raw/master/images/6nn.png" width="420"><img src="https://github.com/temirkayaeva/ML0/raw/master/images/6wnn.png" width="420">  

## Метод парзеновского окна

Ещё один способ задать веса соседям — определить  <img src="https://github.com/temirkayaeva/ML0/raw/master/images/kwnn1.png" width="19"> как функцию  не от ранга соседа *i*, а как функцию от расстояния <img src="https://github.com/temirkayaeva/ML0/raw/master/images/okno1.png" width="60">. Для этого вводится  функция ядра  <img src="https://github.com/temirkayaeva/ML0/raw/master/images/okno2.png" width="28"> невозрастающую на <img src="https://github.com/temirkayaeva/ML0/raw/master/images/okno3.png" width="28"> и рассматривается алгоритм: 

<img src="https://github.com/temirkayaeva/ML0/raw/master/images/okno4.png" width="350"> 

Параметр *h* называется шириной окна и играет примерно ту же роль, что и число соседей *k*. "Окно" — это сферическая окрестность объекта *u* радиуса *h*, при попадании в которую обучающий объект <img src="https://github.com/temirkayaeva/ML0/raw/master/images/loo1.png" width="60"> "голосует" за отношение объекта *u* к классу <img src="https://github.com/temirkayaeva/ML0/raw/master/images/okno6.png" width="16">. Параметр *h* можно задавать или определять по скользящему контролю (LOO). 

Обучающие объекты  могут быть неравномерно распределены по пространству *X*. В окрестности одних объектов может оказываться очень много соседей, а в окрестности других — ни одного. В этих случаях применяется *окно переменной ширины*: 

<img src="https://github.com/temirkayaeva/ML0/raw/master/images/okno5.png" width="350"> 

**Виды ядер** 

| Ядро <img src="https://github.com/temirkayaeva/ML0/raw/master/images/k0.gif" width="30"> | Формула |
| ------------- | ------------- |
| Епанечникова	 | <img src="https://github.com/temirkayaeva/ML0/raw/master/images/k1.gif" width="200">  |
| Квартическое	 | <img src="https://github.com/temirkayaeva/ML0/raw/master/images/k2.gif" width="200">  |
| Треугольное	 | <img src="https://github.com/temirkayaeva/ML0/raw/master/images/k3.gif" width="180">  |
| Гауссовское	 | <img src="https://github.com/temirkayaeva/ML0/raw/master/images/k4.gif" width="180">  |
| Прямоугольное	 | <img src="https://github.com/temirkayaeva/ML0/raw/master/images/k5.gif" width="150">  |

| Графики LOO  | Карты классификаций |
| ------------- | ------------- |
| <img src="https://github.com/temirkayaeva/ML0/raw/master/images/kerep.png" width="350">|<img src="https://github.com/temirkayaeva/ML0/raw/master/images/mapkerep.png" width="540">
| <img src="https://github.com/temirkayaeva/ML0/raw/master/images/kerq.png" width="350">|<img src="https://github.com/temirkayaeva/ML0/raw/master/images/mapkerq.png" width="540">
| <img src="https://github.com/temirkayaeva/ML0/raw/master/images/kerr.png" width="350">|<img src="https://github.com/temirkayaeva/ML0/raw/master/images/mapkerr.png" width="540">
| <img src="https://github.com/temirkayaeva/ML0/raw/master/images/kert.png" width="350">|<img src="https://github.com/temirkayaeva/ML0/raw/master/images/mapkert.png" width="540">
| <img src="https://github.com/temirkayaeva/ML0/raw/master/images/kerg.png" width="350">|<img src="https://github.com/temirkayaeva/ML0/raw/master/images/mapkerg.png" width="540">

### Сравнение методов

На примере видно, что гауссовское ядро имеет преимущество, так как классифицирует все точки. В остальных ядрах точки, не попавшие в окна, не классифицируются (на картинках они имеют серый цвет).



## Метод потенциальных функций

Ядро помещается в каждый обучающий объект <img src="https://github.com/temirkayaeva/ML0/raw/master/images/loo1.png" width="60">  и "притягивает" объект *u* к классу <img src="https://github.com/temirkayaeva/ML0/raw/master/images/okno6.png" width="16">, если он попадает в его окрестность радиуса <img src="https://github.com/temirkayaeva/ML0/raw/master/images/pfunctions1.png" width="15">:

<img src="https://github.com/temirkayaeva/ML0/raw/master/images/pfunctions.png" width="400"> 

**Идея метода**: если обучающий объект  <img src="https://github.com/temirkayaeva/ML0/raw/master/images/pfunctions2.png" width="16"> классифицируется неверно, то потенциал класса <img src="https://github.com/temirkayaeva/ML0/raw/master/images/okno6.png" width="16"> недостаточен в точке <img src="https://github.com/temirkayaeva/ML0/raw/master/images/pfunctions2.png" width="16">, и вес <img src="https://github.com/temirkayaeva/ML0/raw/master/images/pfunctions3.png" width="16"> увеличивается на единицу. 

#### Достоинства метода

* Эффективность (когда обучающие объекты поступают потоком, и хранить их в памяти нет возможности или необходимости)

#### Недостатки метода

* Недленно сходится

* Результат обучения зависит от порядка предъявления объектов

*  Слишком грубо (с шагом 1) настраиваются веса <img src="https://github.com/temirkayaeva/ML0/raw/master/images/pfunctions3.png" width="16"> 

* Не настраиваются параметры <img src="https://github.com/temirkayaeva/ML0/raw/master/images/pfunctions1.png" width="15">

Следовательно,  данный алгоритм не может похвастаться высоким качеством классификации.

# Байесовские алгоритмы классификации

Байесовский подход основан на теореме, утверждающей, что если плотности распределения каждого из классов известны, то искомый алгоритм можно выписать в явном аналитическом виде. На практике плотности распределения классов, как правило, не известны.
Их приходится оценивать (восстанавливать) по обучающей выборке. Чтобы классифицировать точку, для начала, нужно вычислить функции правдоподобия каждого из классов, затем вычислить апостериорные вероятности классов. Классифицируемый объект относится к тому классу, у которого апостериорная вероятность максимальна.

**Оптимальное байесовское решающее правило**: 
<img src="https://github.com/temirkayaeva/ML0/raw/master/images/baes.png" width="190">, где
* <img src="https://github.com/temirkayaeva/ML0/raw/master/images/baes1.png" width="30">  - априорные вероятности  классов (вероятности появления объектов каждого из классов)
* <img src="https://github.com/temirkayaeva/ML0/raw/master/images/baes2.png" width="35"> - функции правдоподобия классов (плотности распределения классов)
* <img src="https://github.com/temirkayaeva/ML0/raw/master/images/baes3.png" width="30"> - величина потери.

## Нормальный дискриминантный анализ

*Вероятностное распределение с плотностью* 
<img src="http://1.618034.com/blog_data/math/formula.48016.png" width="450"> 
называется n-мерным нормальным (гауссовским) распределением с вектором матожидания (центром)  <img src="http://1.618034.com/blog_data/math/formula.48017.png" width="70">  и ковариационной матрицей  <img src="http://1.618034.com/blog_data/math/formula.48019.png" width="70">. Матрица Σ симметричная, невырожденная и положительно определённая. 

**Геометрическая интерпретация нормальной плотности**. 

* Если признаки некоррелированы, <img src="http://1.618034.com/blog_data/math/formula.48021.png" width="150">  то линии уровня плотности распределения имеют форму эллипсоидов с центром <img src="http://1.618034.com/blog_data/math/formula.23640.png" width="20"> и осями, параллельными линиям координат.
* Если признаки имеют одинаковые дисперсии, <img src="http://1.618034.com/blog_data/math/formula.48022.png" width="70">, то эллипсоиды являются сферам. 
* Если признаки коррелированы, то матрица <img src="http://1.618034.com/blog_data/math/formula.29578.png" width="20">  не диагональна и линии уровня имеют форму эллипсоидов, оси которых повёрнуты относительно исходной системы координат. 

|  признаки некоррелированы | признаки имеют одинаковые дисперсии | признаки коррелированы |
| ------------- | ------------- | ------------- | 
| <img src="https://github.com/temirkayaeva/ML0/raw/master/images/b2.png" width="280">|<img src="https://github.com/temirkayaeva/ML0/raw/master/images/b1.png" width="280"> | <img src="https://github.com/temirkayaeva/ML0/raw/master/images/b3.png" width="280">|

## Наивный	нормальный байесовский	классификатор
Допустим, что признаки <img src="http://1.618034.com/blog_data/math/formula.48025.png" width="90"> - независимые случайные величины с плотностями распределения, <img src="http://1.618034.com/blog_data/math/formula.48028.png" width="170">.

Тогда функции правдоподобия классов представимы в виде произведения одномерных плотностей по признакам: 
<img src="http://1.618034.com/blog_data/math/formula.48031.png" width="310">.

Вычислим эмпирическую плотность распределения и подставим ее в формулу оптимального байесовского классификатора (вместо истинной функции правдоподобия).  Априорную вероятность каждого из классов оценим, как долю объектов класса y ∈ Y в выборке. 
Получаем классификатор:

<img src="http://1.618034.com/blog_data/math/formula.48036.png" width="300">

Предположение о независимости существенно упрощает задачу, так как восстановление n одномерных плотностей намного более простая задача,  чем одной n-мерной. 

#### Достоинства

* Простота вычислений 
* Когда признаки действительно независимы, классификатор оптимален

#### Недостатки

* Низкое качество классификации в реальных задач

## Подстановочный алгоритм

Параметры функций правдоподобия  <img src="http://1.618034.com/blog_data/math/formula.48700.png" width="35"> и <img src="http://1.618034.com/blog_data/math/formula.48701.png" width="35"> можно оценить по частям обучающей выборки для каждого класса y отдельно.

<img src="http://1.618034.com/blog_data/math/formula.48704.png" width="400"> 

Полученные выборочные оценки непосредственно подставляются в формулу оптимального байесовского классификатора <img src="http://1.618034.com/blog_data/math/formula.48706.png" width="200">. В результате получается алгоритм классификации, который так и называется — подстановочным (plug-in).

Реализация самого алгоритма: 

```R
plugin <- function(x, Py, mu, Sigma) { 
m <- 2 # количество классов 
n <- 2 # количество признаков
scores <-  rep(0, m) #вектор плотностей
for (i in 1:m) {
      k <- -1/2*((t(x-mu)%*%solve(Sigma))%*%(x-mu))/2
      N <- exp(k)/sqrt((2*pi)^n*det(Sigma))
      scores[i] <- Py[i] * N
      }
  which.max(scores) #порядковый номер максимальной вероятности
}
```

Разделяющая поверхность между двумя классами s и t задаётся следующим образом: 

<img src="http://1.618034.com/blog_data/math/formula.52395.png" width="200">

Так как <img src="http://1.618034.com/blog_data/math/formula.52396.png" width="200">, то логарифмируя плотности каждого класса, получим коэффициенты разделяющей кривой:

<img src="https://camo.githubusercontent.com/ede022e9653a71c319e7e10fa2bbe2df77a33eed/68747470733a2f2f6c617465782e636f6465636f67732e636f6d2f6769662e6c617465783f2535436c6e253742705f79253238782532392537442532302533442532302d253543667261632537426e253744253742322537442532302535436c6e2537423225354370692537442532302d2532302535436672616325374231253744253742322537442535436c6e2537422535436c6566742532302537432532302535435369676d615f7925323025354372696768742532302537432537442532302d253230253543667261632537423125374425374232253744253238782532302d2532302535436d755f79253239253545542532302535435369676d612535452537422d312537445f79253230253238782532302d2532302535436d755f79253239" width="500">

Получение коэффициентов подстановочного алгоритма:

```R
get_coeffs <- function(mu1, sigma1, mu2, sigma2) {
  # Line equation: a*x1^2 + b*x1*x2 + c*x2 + d*x1 + e*x2 + f = 0
  determ1 <-det(sigma1)
  determ2 <-det(sigma2)
  a <- sigma1[2,2]/determ1
  b <- -sigma1[2,1]/determ1
  c <- -sigma1[1,2]/determ1
  d <- sigma1[1,1]/determ1

  e <- sigma2[2,2]/determ2
  f <- -sigma2[2,1]/determ2
  m <- -sigma2[1,2]/determ2
  n <- sigma2[1,1]/determ2

  F <-  - log(abs(det(sigma1))) + log(abs(det(sigma2))) + mu1[1]*mu1[1]*a+(b+c)*mu1[1]*mu1[2]+d*mu1[2]*mu1[2]-mu2[1]*mu2[1]*e-(f+m)*mu2[1]*mu2[2]-mu2[2]*n
  A <- a-e
  B <- d-n
  C <- b+c+f+m
  D <- -2*mu1[1]*a-2*mu1[2]*b-mu1[1]*c+2*mu2[1]*e+f*mu2[1]+mu2[2]*m
  E <- -mu1[1]*b-mu1[1]*c-d*2*mu1[2]+f*mu2[1]+m*mu2[1]+2*mu2[2]*n
  return(c("x^2" = A, "y^2" = B, "xy" = C, "x" = D, "y" = E, "1" = F))
}
```

* Если классы равновероятны и равнозначны (ковариационные матрицы
равны, признаки некоррелированы и имеют одинаковые дисперсии), то разделяющая гиперплоскость проходит по середине между классами, ортогонально линии, соединяющей центры классов; классы имеют сферическую форму. 

<img src="https://github.com/temirkayaeva/ML0/raw/master/images/12.png" width="600">

* Если ковариационные матрицы не диагональны и не равны, то разделяющая поверхность становится квадратичной и «прогибается» так, чтобы менее плотный класс «охватывал» более плотный.

<img src="https://github.com/temirkayaeva/ML0/raw/master/images/16.png" width="600">

Выбирая различные матрицы ковариации и центры для генерации тестовых данных, будем получать различные виды дискриминантной функции.

<img src="https://github.com/temirkayaeva/ML0/raw/master/17.png" width="600"> <img src="https://github.com/temirkayaeva/ML0/raw/master/15.png" width="600">

## Линейный дискриминант Фишера

Допустим, что ковариационные матрицы классов равными. В таком случае достаточно оценить только одну ковариационную матрицу Σ, задействовав для этого всю выборку целиком.  Оценка ковариацинной матрицы вычисляется по следующей формуле: 

<img src="http://1.618034.com/blog_data/math/formula.54530.png" width="300">

В данном случае разделяющая поверхность является линейной, а ее коэффициенты находятся из оптимального байесовского решающего правила: 

<img src="http://1.618034.com/blog_data/math/formula.54528.png" width="700">
Этот алгоритм называется линейным дискриминантом Фишера (ЛДФ). 

Разделяющая поверхность задается формулой: 
<img src="http://1.618034.com/blog_data/math/formula.54531.png" width="100">, коэффициенты находятся по следующим формулам: 

<img src="http://1.618034.com/blog_data/math/formula.54532.png" width="150">

<img src="http://1.618034.com/blog_data/math/formula.54533.png" width="170">



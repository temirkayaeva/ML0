
## Метрические методы классификации

Методы обучения, основанные на анализе сходства объектов,  будем называть *метрическими*.
 
Пусть на множестве объектов X задана функция расстояния *ρ: X × X → (0,∞)*.  Существует целевая зависимость *y** :  X → Y, значения которой известны только на объектах обучающей выборки 
![Alt text](https://latex2png.com/pngs/03803ad3e8b46f76831df83fd1a51e98.png "Optional title")

**Задача классификации:** Х — объекты, Y — ответы (идентификаторы классов);
*X<sup>ℓ*= (x<sub>i</sub>,y<sub>i</sub>)<sup>l</sup><sub>i=1</sub>
 
 **Гипотеза компактности:** Схожие объекты, как правило, лежат в одном классе.
 
 **Формализация понятия "сходства":** Задана функция расстояния ρ: X×X → (0,∞). Например, евклидово расстояние: *ρ(u,xi)* = (
 
Метрический классификатор (similarity-based classifier) — алгоритм классификации, основанный на вычислении оценок сходства между объектами. 
 
## Алгоритм ближайшего соседа

Алгоритм ближайшего соседа относит классифицируемый объект *u ∈ X<sup>ℓ* к тому классу, которому принадлежит ближайший обучающий объект: 
  
#### Достоинства метода

* Простота реализации.

#### Недостатки метода

* Неустойчивость к погрешностям (шуму, выбросам).
* Отсутствие настраиваемых параметров.
* Низкое качество классификации.
* Приходится хранить всю выборку целиком.

## Алгоритм k-ближайших соседей

Метод *k*-ближайших соседей (англ. *k-nearest neighbors algorithm*, k-NN) — метрический алгоритм для автоматической классификации объектов или регрессии.

В случае использования метода для классификации объект присваивается тому классу, который является наиболее распространённым среди *k* соседей данного элемента, классы которых уже известны. В случае использования метода для регрессии, объекту присваивается среднее значение по *k* ближайшим к нему объектам, значения которых уже известны.

Алгоритм может быть применим к выборкам с большим количеством атрибутов (многомерным). Для этого перед применением нужно определить функцию расстояния; классический вариант такой функции — евклидова метрика.

####  Идея метода

Метод основан на предположении о том, что близким объектам в признаковом пространстве соответствуют похожие метки.

Для нового объекта *x* метод предполагает найти ближайшие к нему объекты *x<sub>1</sub>,x<sub>2</sub>,...x<sub>K</sub>* и построить прогноз по их меткам.

#### Достоинства метода

* Простота реализации.

#### Недостатки метода

* Неустойчивость к погрешностям. Если среди обучающих объектов *выброс* - объект, находящийся в окружении объектов чужого класса, то не только он сам будет классифицирован неверно, но и те окружающие его объекты, для которых он окажется ближайшим.

* Отсутствие параметров, которые можно было бы настраивать по выборке. Алгоритм полностью зависит от того, насколько удачно выбрана метрика *ρ*.



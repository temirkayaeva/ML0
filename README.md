## Метод k-ближайших соседей

Метод *k*-ближайших соседей (англ. *k-nearest neighbors algorithm*, k-NN) — метрический алгоритм для автоматической классификации объектов или регрессии.

В случае использования метода для классификации объект присваивается тому классу, который является наиболее распространённым среди *k* соседей данного элемента, классы которых уже известны. В случае использования метода для регрессии, объекту присваивается среднее значение по *k* ближайшим к нему объектам, значения которых уже известны.

Алгоритм может быть применим к выборкам с большим количеством атрибутов (многомерным). Для этого перед применением нужно определить функцию расстояния; классический вариант такой функции — евклидова метрика.

####  Идея метода

Метод основан на предположении о том, что близким объектам в признаковом пространстве соответствуют похожие метки.

Для нового объекта *x* метод предполагает найти ближайшие к нему объекты *x<sub>1</sub>,x<sub>2</sub>,...x<sub>K</sub>* и построить прогноз по их меткам.

#### Достоинства метода

#### Недостатки метода

* При *к*=1 алгоритм неустойчив к погрешностям-выбросам.
* При *к*=*l* алгоритм вырождается в константу.
* Бедный набор параметров.



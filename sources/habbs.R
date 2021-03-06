
lossPerceptron <- function(x)
{
 return (max(-x, 0))
}

#íîðìàëèçàöèÿ íà÷àëüíûõ äàííûõ
trainingSampleNormalization <- function(xl) {
  n <- dim(xl)[2] - 1
  for (i in 1:n) {
    xl[, i] <- (xl[, i] - mean(xl[, i])) / sd(xl[, i])
  }
  return(xl)
}

# Äîáàâëåíèå êîëîíêè èç -1 äëÿ w0
trainingSamplePrepare <- function(xl) {
  l <- dim(xl)[1]
  n <- dim(xl)[2] - 1
  xl <- cbind(xl[, 1:n], seq(from = -1, to = -1, length.out = l), xl[, n + 1])
}

# ïðèìåíÿåì ìåòîä ñòîõàñòè÷åñêîãî ãðàäèåíòà
sg <- function(xl, eta = 0.2, lambda = 1/60) {
  l <- dim(xl)[1]
  n <- dim(xl)[2] - 1
  
  # ñòàíäàðòíàÿ èíèöèàëèçàöèÿ âåñîâ w
  w <- c(1/2, 1/2, 1/2)
  
  iterCount <- 0
  # îïðåäåëÿåì Q
  Q <- 0
  for (i in 1:l) {
    # âû÷èñëÿåì ñêàëÿðíîå ïðîèçâåäåíèå <w,x>
    wx <- sum(w * xl[i, 1:n])
    margin <- wx * xl[i, n + 1]
   Q <- Q + lossPerceptron(margin)
  }
  repeat {

      # ñëó÷àéíûì îáðàçîì âûáèðàåì èíäåêñ èç îáúåêòîâ îøèáêè
      i <- sample(1:l, 1)
      iterCount <- iterCount + 1
      xi <- xl[i, 1:n]
      yi <- xl[i, n + 1]
      wx <- crossprod(w, xi)
      margin <- wx * yi
      ex <- lossPerceptron(margin)
      w <- w + eta * yi * xi
      Qprev <- Q
      Q <- (1 - lambda) * Q + lambda * ex

     # abline(a = w[3] / w[2], b = -w[1] / w[2],  col = "black")
 
      if(abs(Qprev - Q) < 1e-3) { 
      break
    }
  }
  return(w) 
}

  ObjectsCountofEachClass = 100
  library(MASS)
  Sigma1 <- matrix(c(2, 0, 0, 10), 2, 2)
  Sigma2 <- matrix(c(4, 1, 1, 2), 2, 2)
  
  xy1 <- mvrnorm(n=ObjectsCountofEachClass, c(0, 0), Sigma1)
  xy2 <- mvrnorm(n=ObjectsCountofEachClass, c(10, -10), Sigma2)
  
  xl <- rbind(cbind(xy1, 1), cbind(xy2, -1))
  print(xl);
  
  xlNorm <- trainingSampleNormalization(xl)
  xlNorm <- trainingSamplePrepare(xlNorm)
  
  colors <- c(rgb(255/255, 255/255, 0/255), "white", rgb(0/255, 200/255, 0/255))
  plot(xlNorm[, 1], xlNorm[, 2], pch = 21, bg = colors[xl[,3]+ 2], asp = 1)
  w <- sg(xlNorm)
  print(w)
  
  abline(a = w[3] / w[2], b = -w[1] / w[2], lwd = 3, col = "red")

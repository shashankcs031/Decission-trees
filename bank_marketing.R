library(rpart)
bank <- read.csv('bank.csv', sep=';')

# Cast the cols to the correct types
cols <- c(1,6,13:15)
bank[,cols] <- as.integer(as.character(unlist(bank[,cols])))
cols <- c(2:5,7:9,11,13,16)
bank[,cols] <- lapply(bank[,cols], factor)
# Remove unnecessary cols

bank$day <- NULL
bank$duration <- NULL

# Build the decision tree
banktree <- rpart(y ~ ., data=bank, method='class',
                  control=rpart.control(minsplit=65, cp=0.001))
plot(banktree)
text(banktree, pretty=TRUE)
